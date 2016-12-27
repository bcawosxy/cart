<?php
class ModelLocalisationArea extends Model {
	public function getArea($area_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE area_id = '" . (int)$area_id . "' AND status = '1'");

		return $query->row;
	}

	public function getAreasByZoneId($zone_id) {
		$area_data = $this->cache->get('area.' . (int)$zone_id);

		if (!$area_data) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "area WHERE zone_id = '" . (int)$zone_id . "' AND status = '1' ORDER BY area_id DESC");
				

			$area_data = $query->rows;

			$this->cache->set('zone.' . (int)$zone_id, $area_data);
		}

		return $area_data;
	}
}