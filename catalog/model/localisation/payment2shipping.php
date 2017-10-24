<?php
class ModelLocalisationPayment2shipping extends Model {

	public function getPayment2Shippings($payment_code, $aviShippingMethods) {
		$return = [];

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "payment2shipping WHERE `payment_code` = '" . $payment_code."' AND `shipping_code` IN ( '". implode("','", $aviShippingMethods) ."' )");

		foreach ($query->rows as $result => $values) {
			$return[$values['payment_code']][str_replace('xshipping.', '', $values['shipping_code'])] = [
				'code' => $values['shipping_code'],
				'cost' => $values['shipping_cost'],
				'title' => $values['shipping_title'],
				'text' => $values['shipping_text'],
				'tax_class_id' => null ,
			];
		}

		return $return;
	}

}
?>