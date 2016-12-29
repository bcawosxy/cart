<?php
class ModelVersionBook2school extends Model {
	
	public function createTable($year) {
		
		//create table
		$query = $this->db->query('CREATE TABLE `book2school`.`2016` (
		  `name` VARCHAR(128) COLLATE utf8_unicode_ci NOT NULL,
		  `sub_name` VARCHAR(128) COLLATE utf8_unicode_ci NOT NULL,
		  `zone_id` INT(11) UNSIGNED NOT NULL,
		  `zone` VARCHAR(128) COLLATE utf8_unicode_ci NOT NULL,
		  `grades` TEXT COLLATE utf8_unicode_ci NOT NULL
		) ENGINE=MYISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;');

		//set table index
		$query = $this->db->query('ALTER TABLE `book2school`.`2016`
		  ADD KEY `name` (`name`),
		  ADD KEY `sub_name` (`sub_name`),
		  ADD KEY `zone_id` (`zone_id`);');

	}

	public function getdata() {
		$year = date('Y');
		$this->createTable($year);
		$query = $this->db->query("SELECT * FROM `book2school`.`$year`");

		return $query->row;
	}

}