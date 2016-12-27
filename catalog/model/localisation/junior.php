<?php
class ModelLocalisationJunior extends Model {
	public function getSchoolsByAreaId($area_id) {
		$junior_data = $this->cache->get('juniorSchools.' . (int)$area_id);

		if (!$junior_data) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "junior WHERE area_id = '" . (int)$area_id . "' AND status = '1' ORDER BY junior_id");

			$junior_data = $query->rows;

			$this->cache->set('juniorSchools.' . (int)$area_id, $junior_data);
		}

		return $junior_data;
	}
}