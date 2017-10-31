<?php
class ControllerCommonLog extends Controller {
	private $error = array();

	public function index() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			
			$act = $this->request->post['act'];
			$target = $this->request->post['target'];
			$target_id = $this->request->post['target_id'];

			//record log
			$this->load->model('log/log');
			$this->model_log_log->setLog($this->user->getId(), $act, $target, $target_id, $this->request->server, $this->request->post, $this->request->get);
		}
	}
}
