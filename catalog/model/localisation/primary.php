<?php
class ModelLocalisationPrimary extends Model {
	public function getSchoolsByAreaId($area_id) {
		$primary_data = $this->cache->get('primarySchools.' . (int)$area_id);

		if (!$primary_data) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "primary WHERE area_id = '" . (int)$area_id . "' AND status = '1' ORDER BY primary_id");

			$primary_data = $query->rows;

			$this->cache->set('primarySchools.' . (int)$area_id, $primary_data);
		}

		return $primary_data;
	}
}