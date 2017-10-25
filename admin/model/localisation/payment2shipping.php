<?php
class ModelLocalisationPayment2shipping extends Model {

	public function editPayment2shippings($data, $shipping_method) {
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

	public function editShippingsByShippingSetting($data) {
		for($i=1;$i<=12;$i++) {
			$shipping_code = 'xshipping.xshipping'.$i;	
			if($data['xshipping_status'.$i] && !empty($data['xshipping_name'.$i])) {
				
				$edit = "UPDATE `" . DB_PREFIX . "payment2shipping` SET `shipping_title` = '" . $this->db->escape($data['xshipping_name'.$i]) . "', `shipping_cost` = '" .(int)$this->db->escape($data['xshipping_cost'.$i]) . "', `shipping_text` = '" . $this->db->escape('$ '.$data['xshipping_cost'.$i] ). "' WHERE `shipping_code` = '". $shipping_code ."'";				

				$this->db->query($edit);

			} else {
				$delete = "DELETE FROM `" .  DB_PREFIX. "payment2shipping` WHERE `shipping_code` = '". $shipping_code ."'";
				$this->db->query($delete);
			}
		}
	}
}
?>