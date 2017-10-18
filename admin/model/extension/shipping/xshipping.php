<?php
class ModelExtensionShippingXshipping extends Model {
	
	function getQuote() {
		$this->load->language('extension/shipping/xshipping');
	
		$method_data = array();
	    $quote_data = array();
		$currency_code = isset($this->session->data['currency']) ? $this->session->data['currency'] : $this->config->get('config_currency');
			
			
      		for($i=1;$i<=12;$i++)
			{
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('xshipping_geo_zone_id'.$i) . "' OR zone_id = '0'");
	
				if (!$this->config->get('xshipping_geo_zone_id'.$i)) {
					$status = true;
				} elseif ($query->num_rows) {
					$status = true;
				} else {
					$status = false;
				}
				
				
				
				if (!$this->config->get('xshipping_status'.$i)) {
				  $status = false;
				}
				
				if (!$this->config->get('xshipping_name'.$i)) {
				  $status = false;
				}
				
				$shipping_cost=$this->config->get('xshipping_cost'.$i);
				$free_shipping_cost=(float)$this->config->get('xshipping_free'.$i);
				if(empty($free_shipping_cost))$free_shipping_cost=0;
				
				if ($this->cart->getSubTotal() >= $free_shipping_cost && $free_shipping_cost!=0) {
					$shipping_cost = 0;
					
				}
				
				
				if ($status) {
				
					$quote_data['xshipping'.$i] = array(
						'code'         => 'xshipping'.'.xshipping'.$i,
						'title'        => $this->config->get('xshipping_name'.$i),
						'cost'         => $shipping_cost,
						'tax_class_id' => $this->config->get('xshipping_tax_class_id'.$i),
						'text'         => $this->currency->format($this->tax->calculate($shipping_cost, $this->config->get('xshipping_tax_class_id'.$i), $this->config->get('config_tax')), $currency_code)
					);
		
					
				}
			}
			
			if(!$quote_data) return array();
			
			$method_data = array(
				'code'       => 'xshipping',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('xshipping_sort_order'),
				'error'      => ''
			);	
		
	
		return $method_data;
	}


	/**
	 * [getQuote description]
	 * 從 catalog\model\extension\shipping\ 目錄下拷貝到 admin\model\extension\shipping 的檔案
	 * 以下是原始 function 內容, 因應後台並沒有地址的參數 , 故調整原本函式
	 * @param  [type] $address [description]
	 * @return [type]          [description]
	 */
	/*
	function getQuote($address) {
		$this->load->language('extension/shipping/xshipping');
	
		$method_data = array();
	    $quote_data = array();
		$currency_code = isset($this->session->data['currency']) ? $this->session->data['currency'] : $this->config->get('config_currency');
			
			
      		for($i=1;$i<=12;$i++)
			{
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('xshipping_geo_zone_id'.$i) . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
	
				if (!$this->config->get('xshipping_geo_zone_id'.$i)) {
					$status = true;
				} elseif ($query->num_rows) {
					$status = true;
				} else {
					$status = false;
				}
				
				
				
				if (!$this->config->get('xshipping_status'.$i)) {
				  $status = false;
				}
				
				if (!$this->config->get('xshipping_name'.$i)) {
				  $status = false;
				}
				
				$shipping_cost=$this->config->get('xshipping_cost'.$i);
				$free_shipping_cost=(float)$this->config->get('xshipping_free'.$i);
				if(empty($free_shipping_cost))$free_shipping_cost=0;
				
				if ($this->cart->getSubTotal() >= $free_shipping_cost && $free_shipping_cost!=0) {
					$shipping_cost = 0;
					
				}
				
				
				if ($status) {
				
					$quote_data['xshipping'.$i] = array(
						'code'         => 'xshipping'.'.xshipping'.$i,
						'title'        => $this->config->get('xshipping_name'.$i),
						'cost'         => $shipping_cost,
						'tax_class_id' => $this->config->get('xshipping_tax_class_id'.$i),
						'text'         => $this->currency->format($this->tax->calculate($shipping_cost, $this->config->get('xshipping_tax_class_id'.$i), $this->config->get('config_tax')), $currency_code)
					);
		
					
				}
			}
			
			if(!$quote_data) return array();
			
			$method_data = array(
				'code'       => 'xshipping',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('xshipping_sort_order'),
				'error'      => ''
			);	
		
	
		return $method_data;
	}
	*/
}
?>