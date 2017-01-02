<?php
class ControllerInformationVersion extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/version');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/version')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		//text-new
		$data['text_subTitle'] = $this->language->get('text_subTitle');		
		$data['text_county'] = $this->language->get('text_county');		
		$data['text_area'] = $this->language->get('text_area');		
		$data['text_school'] = $this->language->get('text_school');		
		$data['text_PrimarySchool'] = $this->language->get('text_PrimarySchool');		
		$data['text_JuniorHighSchool'] = $this->language->get('text_JuniorHighSchool');		
		$data['text_SeniorHighSchool'] = $this->language->get('text_SeniorHighSchool');		
		$data['text_no_results_text'] = $this->language->get('text_no_results_text');		

		//fetch location list
		$this->load->model('localisation/zone');
		$data['zones'] = $this->model_localisation_zone->getZonesByCountryId(206);		

		$data['fetchAreaUrl'] = $this->url->link('information/version/getareabyzone');
		$data['fetchPrimaryUrl'] = $this->url->link('information/version/getprimarybyarea');
		$data['fetchJuniorUrl'] = $this->url->link('information/version/getjuniorbyarea');
		$data['fetchSeniorUrl'] = $this->url->link('information/version/getseniorbyarea');
		$data['fetchJsonUrl'] = $this->url->link('information/version/');

		//------------//
		$data['button_map'] = $this->language->get('button_map');

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['enquiry'])) {
			$data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$data['error_enquiry'] = '';
		}

		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/version', '', true);

		$this->load->model('tool/image');

		if ($this->config->get('config_image')) {
			$data['image'] = $this->model_tool_image->resize($this->config->get('config_image'), $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
		} else {
			$data['image'] = false;
		}

		$data['store'] = $this->config->get('config_name');
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['geocode'] = $this->config->get('config_geocode');
		$data['geocode_hl'] = $this->config->get('config_language');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['fax'] = $this->config->get('config_fax');
		$data['open'] = nl2br($this->config->get('config_open'));
		$data['comment'] = $this->config->get('config_comment');

		$data['locations'] = array();

		$this->load->model('localisation/location');

		foreach((array)$this->config->get('config_location') as $location_id) {
			$location_info = $this->model_localisation_location->getLocation($location_id);

			if ($location_info) {
				if ($location_info['image']) {
					$image = $this->model_tool_image->resize($location_info['image'], $this->config->get($this->config->get('config_theme') . '_image_location_width'), $this->config->get($this->config->get('config_theme') . '_image_location_height'));
				} else {
					$image = false;
				}

				$data['locations'][] = array(
					'location_id' => $location_info['location_id'],
					'name'        => $location_info['name'],
					'address'     => nl2br($location_info['address']),
					'geocode'     => $location_info['geocode'],
					'telephone'   => $location_info['telephone'],
					'fax'         => $location_info['fax'],
					'image'       => $image,
					'open'        => nl2br($location_info['open']),
					'comment'     => $location_info['comment']
				);
			}
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = $this->customer->getEmail();
		}

		if (isset($this->request->post['enquiry'])) {
			$data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$data['enquiry'] = '';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('version', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/version', $data));
	}

	protected function validate() {
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
			$this->error['enquiry'] = $this->language->get('error_enquiry');
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('contact', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}

	public function getareabyzone() {
		$zone_id = $_POST['data'];
		//fetch area list
		$this->load->model('localisation/area');
		$areas = $this->model_localisation_area->getAreasByZoneId($zone_id);	
		print_r(json_encode($areas));
		die();
	}

	public function getprimarybyarea() {
		$area_id = $_POST['data'];
		//fetch area list
		$this->load->model('localisation/primary');
		$schools = $this->model_localisation_primary->getSchoolsByAreaId($area_id);	
		print_r(json_encode($schools));
		die();
	}

	public function getjuniorbyarea() {
		$area_id = $_POST['data'];
		//fetch area list
		$this->load->model('localisation/junior');
		$schools = $this->model_localisation_junior->getSchoolsByAreaId($area_id);	
		print_r(json_encode($schools));
		die();
	}

	public function getseniorbyarea() {
		$area_id = $_POST['data'];
		//fetch area list
		$this->load->model('localisation/senior');
		$schools = $this->model_localisation_senior->getSchoolsByAreaId($area_id);	
		print_r(json_encode($schools));
		die();
	}

	public function getversionbyschool() {
		$type = $_POST['type'];
		$school = $_POST['school'];
		$schoolName = $_POST['schoolName'];
		$county = $_POST['county'];
		$countyName = str_replace('台', '臺', $_POST['countyName']);

		require_once(DIR_UPLOAD.'/Classes/PHPExcel.php');
		require_once(DIR_UPLOAD.'/Classes/phpexcel/IOFactory.php'); 
		$objPHPExcel = new PHPExcel();

		//從excel中取出資料列
		$file = DIR_UPLOAD.'version/primary/105-primary.xls';
		try {
		    $objPHPExcel = PHPExcel_IOFactory::load($file);
		} catch(Exception $e) {
		    die('Error loading file "'.pathinfo($file,PATHINFO_BASENAME).'": '.$e->getMessage());
		}
		
		$sheetData = $objPHPExcel->getActiveSheet()->toArray('',true,true,true);

		foreach ($sheetData[1] as $k0 => $v0) {
			if($v0 =='縣市') $fileCountyNameCel = $k0;
			if($v0 =='學校') $fileSchoolNameCel = $k0;
		}

		
		$data = []; $a_tmpName =[]; $school =[];$return =[];
		foreach ($sheetData as $k0 => $v0) {
		    if($v0[$fileCountyNameCel] == '宜蘭縣') {
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


		// print_r(1);
		print_r($data);
		die();
	}

}
