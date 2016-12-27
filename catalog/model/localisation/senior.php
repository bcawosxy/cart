<?php
class ModelLocalisationsenior extends Model {
	public function getSchoolsByAreaId($area_id) {
		$senior_data = $this->cache->get('seniorSchools.' . (int)$area_id);

		if (!$senior_data) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "senior WHERE area_id = '" . (int)$area_id . "' AND status = '1' ORDER BY senior_id");

			$senior_data = $query->rows;

			$this->cache->set('seniorSchools.' . (int)$area_id, $senior_data);
		}

		return $senior_data;
	}
}