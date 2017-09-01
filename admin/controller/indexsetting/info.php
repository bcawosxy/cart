<?php
class ControllerindexSettinginfo extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('indexsetting/info');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$config_data = [
			'bigshop_top_bar_contact_status',
			'bigshop_top_bar_contact',
			'bigshop_top_bar_email_status',
			'bigshop_top_bar_email',
			'bigshop_address_status',
			'bigshop_mobile_status',
			'bigshop_email_status',
			'bigshop_address',
			'bigshop_mobile',
			'bigshop_email',
			'bigshop_feature_box1_status',
			'bigshop_feature_box2_status',
			'bigshop_feature_box3_status',
			'bigshop_feature_box1_title',
			'bigshop_feature_box2_title',
			'bigshop_feature_box3_title',
			'bigshop_feature_box1_subtitle',
			'bigshop_feature_box2_subtitle',
			'bigshop_feature_box3_subtitle',
		];


        foreach ($config_data as $conf) {
            if (isset($this->request->post[$conf])) {
                $data[$conf] = $this->request->post[$conf];
            } else {
                $data[$conf] = $this->config->get($conf);
            }
        }
		

		/* old */
		//取得indexTital的相關資料
		// $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "module` WHERE `code` = '" . $this->db->escape($code) . "' AND `name` = '" . $this->db->escape($name) . "' ORDER BY `name`");
		// $module_info = json_decode($query->row['setting'], true);
		// $module_id = $query->row['module_id'];

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			print_r($this->request->post);
			$code = 'bigshop';
			$store_id = 0;
			foreach ($this->request->post as $key => $value) {
				if (substr($key, 0, strlen($code)) == $code) {
					if (!is_array($value)) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
					} else {
						$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value, true)) . "', serialized = '1'");
					}
				}
			}

			$this->response->redirect($this->url->link('indexsetting/info', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_header'] = $this->language->get('text_header');
		$data['text_feature'] = $this->language->get('text_feature');
		$data['text_footer'] = $this->language->get('text_footer');
		$data['text_telphone'] = $this->language->get('text_telphone');
		$data['text_email'] = $this->language->get('text_email');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('indexsetting/info', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('indexsetting/info', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = array();
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('indexsetting/info', $data));
	}

	protected function validate() {
		return !$this->error;
	}
}