<?php
class ModelExtensionPaymentBankTransfer extends Model {
	public function getMethod() {
		$this->load->language('extension/payment/bank_transfer');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('bank_transfer_geo_zone_id') . "'");

		if (!$this->config->get('bank_transfer_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'bank_transfer',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('bank_transfer_sort_order')
			);
		}

		return $method_data;
	}	

	/**
	 * [getMethod description]
	 * 從 catalog\model\extension\payment\ 目錄下拷貝到 admin\model\extension\payment 的檔案
	 * 以下是原始 function 內容, 因應後台並沒有地址及金額的參數 , 故調整原本函式
	 * @param  [type] $address [description]
	 * @param  [type] $total   [description]
	 * @return [type]          [description]
	 */
	/*
	public function getMethod($address, $total) {
		$this->load->language('extension/payment/bank_transfer');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('bank_transfer_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if ($this->config->get('bank_transfer_total') > 0 && $this->config->get('bank_transfer_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('bank_transfer_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'bank_transfer',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('bank_transfer_sort_order')
			);
		}

		return $method_data;
	}
	*/
}