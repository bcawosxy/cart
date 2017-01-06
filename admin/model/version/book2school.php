<?php
class ModelVersionBook2school extends Model {
	
	public function createTable($years ,$schoolType) {
		$new_db = $years.'_'.$schoolType;
		
		//create table
		$query = $this->db->query('CREATE TABLE IF NOT EXISTS `book2school`.`'.$new_db.'` (
		  `id` int(11) unsigned NOT NULL,
		  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
		  `sub_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
		  `zone_id` int(11) unsigned NOT NULL,
		  `zone` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
		  `grades` text COLLATE utf8_unicode_ci NOT NULL
		) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;');

		//Truncate Table
		$query = $this->db->query('TRUNCATE TABLE `book2school`.`'.$new_db.'`');
		
		//set table index
		$query = $this->db->query('ALTER TABLE `book2school`.`'.$new_db.'`
			ADD PRIMARY KEY (`id`),
			ADD KEY `name` (`name`),
		  	ADD KEY `sub_name` (`sub_name`),
		  	ADD KEY `zone_id` (`zone_id`);');

		//set AutoIncrement
		$query = $this->db->query('ALTER TABLE `book2school`.`'.$new_db.'` MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;');

		return $new_db;
	}

	public function insertdata($dbname, $data) {
		$return = 1;
		foreach ($data as $k0 => $v0) {
			//取得對應縣市id (zone)
			$zone = str_replace('台', '臺', $v0['zone']);
			$fetchZoneQuery = $this->db->query('SELECT `zone_id`,`name` AS `zone_name` FROM `'.DB_PREFIX.'zone` WHERE `name` = "'.$zone.'";');
			if( ($fetchZoneQuery->num_rows) === 1 ) {
				$str = '';
				$str = 'INSERT INTO `book2school`.`'.$dbname.'` (`id`, `name`, `sub_name`, `zone_id`, `zone`, `grades`) VALUES (NULL, "'.$v0['name'].'", "", "'.$fetchZoneQuery->row['zone_id'].'", "'.$fetchZoneQuery->row['zone_name'].'", \''.str_replace('\\', '\\\\', json_encode($v0['class'])).'\');';
				$insertBook2SchoolQuery = $this->db->query($str);
			}			
		}
		return $return;
	}

	public function setdata($schoolType=null, $years=null, $path=null) {
		$return = 0;
		if($schoolType != null && $years != null && $path != null) {
			$DBName = $this->createTable($years, $schoolType);
			require_once(DIR_UPLOAD.'Classes/PHPExcel.php');
			require_once(DIR_UPLOAD.'Classes/phpexcel/IOFactory.php'); 
			$objPHPExcel = new PHPExcel();

			//從excel中取出資料列
			$file = $path;
			try {
			    $objPHPExcel = PHPExcel_IOFactory::load($file);
			} catch(Exception $e) {
			    die('Error loading file "'.pathinfo($file,PATHINFO_BASENAME).'": '.$e->getMessage());
			}
			    
			$sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
			foreach ($sheetData[1] as $k0 => $v0) {
				if($v0 =='縣市') $fileCountyNameCel = $k0;
				if($v0 =='學校') $fileSchoolNameCel = $k0;
			}
			
			$data = []; $a_tmpName =[]; $school =[];
			foreach ($sheetData as $k0 => $v0) {
			    if($k0 > 1) {
			        $books=[];
			        if(!in_array($v0[$fileSchoolNameCel], $a_tmpName)) {
			            if(count($school) > 0) $data[] = $school;
			            //紀錄下一個學校
			            $a_tmpName[] = $v0[$fileSchoolNameCel];

			            foreach ($sheetData[1] as $k1 => $v1) {
			            	if( in_array($k1, ['A','B','C']) ) continue;
			            	$a_grade[$sheetData[1][$k1]] = $v0[$k1];
			            }

			            $books[1] = $a_grade;
			            $school = [
			                'name' => $v0[$fileSchoolNameCel],
			                'zone' => $v0[$fileCountyNameCel],
			                'class' => $books,
			            ]; 
			        } else {
			            foreach ($sheetData[1] as $k1 => $v1) {
			            	if( in_array($k1, ['A','B','C']) ) continue;
			            	$a_grade[$sheetData[1][$k1]] = $v0[$k1];
			            }
			            $school['class'][$v0['C']] = $a_grade;
			        }
			    } 
			}
			$data[] = $school;
			$return = $this->insertdata($DBName, $data);
			$objPHPExcel->disconnectWorksheets();
			unset($objPHPExcel);
		}
		return ['result' => $return];
	}

}