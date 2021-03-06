<?php
class ModelExtensionTotalXfee extends Model {

	public function getTotal($total) {
	
	    $this->language->load('extension/total/xfee');
		
		$shipping_method=isset($this->session->data['shipping_method']['code'])?$this->session->data['shipping_method']['code']:'';
		$payment_method=isset($this->session->data['payment_method']['code'])?$this->session->data['payment_method']['code']:'';
		
		if(isset($this->session->data['default']['shipping_method']['code'])) $shipping_method = $this->session->data['default']['shipping_method']['code'];
		if(isset($this->session->data['default']['payment_method']['code'])) $payment_method = $this->session->data['default']['payment_method']['code'];
		
		$order_info='';
        if(isset($this->session->data['order_id'])){
            $this->load->model('checkout/order');
            $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        }
        
        if(isset($this->request->get['order_id'])){
            $this->load->model('checkout/order');
            $order_info = $this->model_checkout_order->getOrder($this->request->get['order_id']);
        }
        
        
       
	   if($order_info){
            $currency_code=$order_info['currency_code']; 
			
			if(!$shipping_method){
              $shipping_method=$order_info['shipping_code'];
            }
            
           if(!$payment_method){
              $payment_method=$order_info['payment_code'];
            }
            
        }
		
		/* For manual order insertion */
		if(isset($_POST['payment_code']) && !empty($_POST['payment_code']))$payment_method=$_POST['payment_code'];
		if(isset($_POST['shipping_code']) && !empty($_POST['shipping_code']))$shipping_method=$_POST['shipping_code'];
		
		
		$address = array();
		if(isset($this->session->data['shipping_address'])) $address = $this->session->data['shipping_address'];

		if ($this->cart->getSubTotal()) {
			
		  for($i=1;$i<=12;$i++)
			   {	
			           $xfee_total=(float)$this->config->get('xfee_total'.$i);
				       if(empty($xfee_total))$xfee_total=0;
				       
				    	
				       $xfee_total_max=(float)$this->config->get('xfee_total_max'.$i);
					   
					   if(!$this->config->get('xfee_name'.$i)) continue;
					   if($xfee_total>$this->cart->getSubTotal()) continue;
					   if($xfee_total_max && $xfee_total_max<$this->cart->getSubTotal()) continue;

					   if($this->config->get('xfee_payment'.$i) && $this->config->get('xfee_payment'.$i)!=$payment_method) continue;
					   if($this->config->get('xfee_shipping'.$i) && $this->config->get('xfee_shipping'.$i).'.'.$this->config->get('xfee_shipping'.$i)!=$shipping_method && $this->config->get('xfee_shipping'.$i)!=$shipping_method) continue;

					   /**
					    * 0918 - 計算價格 ($total['total']) 小於 $xfee的門檻時沒有免運優惠
					    * 1013 - 發現 ($total['total']) 會包含運費金額, 故需扣除運費金額後再來進行比對
					    *  ex: 價格 : 1000  運費 : 150 免運門檻 : 600  折抵 : 500  ==> (1000-500=500) 應該要運費, 但加上150運費後(650) 又會判斷成免運, 故需此判斷
					    * 1031 - 條件從 "<="" 變成 "<"
					    */

					   if(isset($this->session->data['shipping_method'])) {
					   	if( ($total['total']-$this->session->data['shipping_method']['cost']) < $xfee_total) continue;
					   }

                       if($this->config->get('xfee_geo_zone_id'.$i) && $address){
					      
                           $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id='".(int)$this->config->get('xfee_geo_zone_id'.$i)."' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')"); 
                           if ($query->num_rows==0) continue;
                                               
                        }

						$tax_vat=0;
						if ($this->config->get('xfee_tax_class_id'.$i)) {
							$tax_rates = $this->tax->getRates($this->config->get('xfee_cost'.$i), $this->config->get('xfee_tax_class_id'.$i));
							
							foreach ($tax_rates as $tax_rate) {
								if (!isset($total['taxes'][$tax_rate['tax_rate_id']])) {
									$total['taxes'][$tax_rate['tax_rate_id']] = $tax_rate['amount'];
									$tax_vat+=$tax_rate['amount'];
								} else {
									$total['taxes'][$tax_rate['tax_rate_id']] += $tax_rate['amount'];
									$tax_vat+=$tax_rate['amount'];
								}
							}
						}
						
						/**
						 *  1013 - 配合 x-shipping 套件, 折抵的運費由 x-shipping的運費決定而非 x-fee 設置的固定折抵金額
						           $disCount = $this->session->data['shipping_method']['cost']
						 */
						$disCount = (isset($this->session->data['shipping_method'])) ? -$this->session->data['shipping_method']['cost'] : 0 ;

						$total['totals'][] = array( 
							'code'       => 'xfee'.$i,
							'title'      => $this->config->get('xfee_name'.$i),
							'value'      => $disCount,
							'sort_order' => $this->config->get('xfee_sort_order'.$i)
						);
						
						$total['total'] += $disCount;
		  
		      }
		
		}
	}
}
?>