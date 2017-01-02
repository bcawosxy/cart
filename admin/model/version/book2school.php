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

	public function getdata() {
		$year = date('Y');
		$this->createTable($year);
		$query = $this->db->query("SELECT * FROM `book2school`.`$year`");

		return $query->row;
	}

	public function insertdata($dbname, $data) {
		print_r($data);
	}

	public function setdata($schoolType=null, $years=null, $path=null) {
		$return = 0;
		if($schoolType != null && $years != null && $path != null) {
			$DBName = $this->createTable($years, $schoolType);
			require_once(DIR_UPLOAD.'/Classes/PHPExcel.php');
			require_once(DIR_UPLOAD.'/Classes/phpexcel/IOFactory.php'); 
			$objPHPExcel = new PHPExcel();

			//從excel中取出資料列
			$file = $path;
			try {
			    $objPHPExcel = PHPExcel_IOFactory::load($file);
			} catch(Exception $e) {
			    die('Error loading file "'.pathinfo($file,PATHINFO_BASENAME).'": '.$e->getMessage());
			}
			    
			$sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
			$data = []; $a_tmpName =[]; $school =[];
			foreach ($sheetData as $k0 => $v0) {
			    if($k0 > 1) {
			        $books=[];
			        if(!in_array($v0['A'], $a_tmpName)) {
			            if(count($school) > 0) $data[] = $school;
			            //開始一輪新的學校
			            $a_tmpName[] = $v0['A'];
			            $books[$v0['C']] = [
			                $sheetData[1]['D'] => $v0['D'],
			                $sheetData[1]['E'] => $v0['E'],
			                $sheetData[1]['F'] => $v0['F'],
			                $sheetData[1]['G'] => $v0['G'],
			                $sheetData[1]['H'] => $v0['H'],
			                $sheetData[1]['I'] => $v0['I'],
			                $sheetData[1]['J'] => $v0['J'],
			            ];
			            
			            $school = [
			                'name' => $v0['A'],
			                'zone' => $v0['B'],
			                'class' => $books,
			            ]; 
			        } else {            
			            $books = [
			                $sheetData[1]['D'] => $v0['D'],
			                $sheetData[1]['E'] => $v0['E'],
			                $sheetData[1]['F'] => $v0['F'],
			                $sheetData[1]['G'] => $v0['G'],
			                $sheetData[1]['H'] => $v0['H'],
			                $sheetData[1]['I'] => $v0['I'],
			                $sheetData[1]['J'] => $v0['J'],
			            ];
			            $school['class'][$v0['C']] = $books;
			        }
			    } 
			}
			$data[] = $school;
			$this->insertdata($DBName, $data);
			
			$return = 1;
		}
		return [$return];
	}

}