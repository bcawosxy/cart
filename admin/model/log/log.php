<?php
class ModelLogLog extends Model {

	public function createTable() {
		$dbName = date('Ymd');

		//create table
		$query = $this->db->query('CREATE TABLE IF NOT EXISTS `bookstore_log`.`'.$dbName.'` (
			`member` enum("customer","user") COLLATE utf8_unicode_ci NOT NULL,
			`member_id` int(10) unsigned NOT NULL,
			`act` enum("add","no_permission","delete","edit","login","upload") COLLATE utf8_unicode_ci NOT NULL,
			`target` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
			`target_id` int(10) unsigned DEFAULT NULL,			
			`device` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
			`server` text COLLATE utf8_unicode_ci,
			`post` text COLLATE utf8_unicode_ci,
			`get` text COLLATE utf8_unicode_ci,
			`ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
			`inserttime` datetime NOT NULL
		) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;');

		return $dbName;
	}


	public function getDevice() {
		$return = null;
		require_once(DIR_UPLOAD.'detectdevice-1.0.3/detect.php');
		
		if (Detect::isMobile()) {
			if (Detect::isiOS()) {
				$return = "iOS - ". Detect::brand() . "_".Detect::version('iPhone');
			} elseif(Detect::isAndroidOS()) {
				$return = "Android - ". Detect::brand()." - ".Detect::version('Android');
			} elseif(Detect::isTablet()) {
				$return = "Tablet - ". Detect::brand();
			}
		} else {
			$return = Detect::browser();
		}

		return $return;
	}	

	/**
	 * 171030 - Mars 針對特定事件紀錄log
	 * String 	$menber 	: user / customer : user = 後台管理者, customer = 前台客戶 (這邊固定user)
	 * Int 		$member_id 	: 對應ID
	 * String 	$act 		: add,no_permission,delete,edit,login,upload 對應不同動作紀錄log
	 * String 	$target 	: 執行目標 (product...)
	 * Int 		$target_id 	: 執行目標ID
	 * Text 	$server 	: $_SERVER
	 * Text 	$post 		: $_POST
	 * Text 	$get 		: $_GET
	 */

	public function setLog($member_id, $act, $target = null, $target_id = null, $server, $post, $get) {
		$dbName = $this->createTable();

		$device = $this->db->escape($this->getDevice());
		$server = $this->db->escape(json_encode($server));
		$post = $this->db->escape(json_encode($post));
		$get = $this->db->escape(json_encode($get));
		$ip = $this->db->escape($this->request->server['REMOTE_ADDR']);

		$query = 'INSERT INTO `bookstore_log`.`'.$dbName.'` (`member`, `member_id`, `act`, `target`, `target_id`, `device`, `server`, `post`, `get`, `ip`, `inserttime`) VALUES ("user", "'.$member_id.'", "'.$act.'",  "'.$target.'",  "'.$target_id.'", "'.$device.'", "'.$server.'", "'.$post.'", "'.$get.'", "'.$ip.'",  "'.INSERTTIME.'");';

		$result = $this->db->query($query);
	}
}