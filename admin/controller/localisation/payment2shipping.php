<?php
class ControllerlocalisationPayment2shipping extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('localisation/payment2shipping');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			print_r($this->request->post);
			exit;
			// $code = 'bigshop';
			// $store_id = 0;
			// foreach ($this->request->post as $key => $value) {
			// 	if (substr($key, 0, strlen($code)) == $code) {
			// 		if (!is_array($value)) {
			// 			$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
			// 		} else {
			// 			$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value, true)) . "', serialized = '1'");
			// 		}
			// 	}
			// }

			$this->response->redirect($this->url->link('localisation/payment2shipping', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_header'] = $this->language->get('text_header');
		$data['text_footer'] = $this->language->get('text_footer');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('localisation/payment2shipping', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('localisation/payment2shipping', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);


		//取得支付方式
		$payment_method = $this->getPaymentMethods();
		$shipping_method = $this->getShippingMethods();

		if (isset($this->request->post['payment_method'])) {
			$data['payment_method'] = $this->request->post['payment_method'];
		} else {
			$data['payment_method'] = $payment_method;
		}

		if (isset($this->request->post['shipping_method'])) {
			$data['shipping_method'] = $this->request->post['shipping_method'];
		} else {
			$data['shipping_method'] = $shipping_method['xshipping'];
		}

		if (isset($this->error['name'])) {
			$data['error_fail_status'] = $this->error['name'];
		} else {
			$data['error_fail_status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('localisation/payment2shipping', $data));
	}

	protected function getPaymentMethods() {
		$this->load->model('extension/extension');
		$results = $this->model_extension_extension->getExtensions('payment');
		$recurring = $this->cart->hasRecurringProducts();
		$method_data = array();
		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {

				if(VERSION < '2.3.0.0'){
   					$this->load->model('payment/' . $result['code']);

					$method = $this->{'model_payment_' . $result['code']}->getMethod($payment_address, $total);
   				}else{
   					$this->load->model('extension/payment/' . $result['code']);

					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod();
   				}

				if ($method) {
					if ($recurring) {
						if(VERSION < '2.3.0.0'){
							if (method_exists($this->{'model_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						}else{
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						}
					} else {
						$method_data[$result['code']] = $method;
					}					
				}
			}
		}

		$sort_order = array();

		foreach ($method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $method_data);

		return $method_data;
	}

	protected function getShippingMethods() {
		$method_data = array();

		$this->load->model('extension/extension');

		$results = $this->model_extension_extension->getExtensions('shipping');

		foreach ($results as $result) {

			if ($this->config->get($result['code'] . '_status')) {
   				
   				if(VERSION < '2.3.0.0'){
   					$this->load->model('shipping/' . $result['code']);

					$quote = $this->{'model_shipping_' . $result['code']}->getQuote($shipping_address);
   				}else{
   					$this->load->model('extension/shipping/' . $result['code']);

					$quote = $this->{'model_extension_shipping_' . $result['code']}->getQuote();
   				}
				
				if ($quote) {
					$method_data[$result['code']] = array(
						'quote'      => $quote['quote'],
						'sort_order' => $quote['sort_order'],
					);
				}
			}
		}

		$sort_order = array();

		foreach ($method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $method_data);

		return $method_data;
	}

	protected function validate() {
		return !$this->error;
	}
}