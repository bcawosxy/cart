<?php
class ModelLocalisationPayment2shipping extends Model {

	public function editPayment2shipping($data, $shipping_method) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "payment2shipping`");

		foreach ($data as $k0 => $v0) {
			foreach ($v0 as $k1 => $v1) {
				$shipping_methods = $shipping_method[str_replace('xshipping.', '', $v1)];
				$this->db->query("INSERT INTO " . DB_PREFIX . "payment2shipping SET payment_code = '" . $k0 . "', `shipping_code` = '" . $this->db->escape($shipping_methods['code']) . "', `shipping_title` = '" . $this->db->escape($shipping_methods['title']) . "', `shipping_cost` = '" .(int)$shipping_methods['cost'] . "', `shipping_text` = '" . $this->db->escape($shipping_methods['text']) . "'");
			}
		}
	}

	public function getPayment2Shippings() {
		$return = [];

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "payment2shipping");

		foreach ($query->rows as $result => $values) {
			$return[$values['payment_code']][] = $query->rows[$result];
		}

		return $return;
	}

}
?>