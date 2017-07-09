<?php
class ControllerAccountVerify extends Controller {
	public function index() {
		date_default_timezone_set("Asia/Taipei");
		if (isset($this->request->get['id'])) {
			$id = $this->request->get['id'];
		} else {
			$this->response->redirect($this->url->link('error/NotFound'));
		}

		if (isset($this->request->get['token'])) {
			$token = $this->request->get['token'];
		} else {
			$this->response->redirect($this->url->link('error/NotFound'));
		}
		
		//取得原先做好的token
		$datetime = date('Y-m-d G:i:s', strtotime("-1 day"));
		$sql = 'select `token` from '.DB_PREFIX.'customer_verify where `inserttime` > "'.$datetime.'" and customer_id = '. $id;
		$r = $this->db->query($sql);
		$MakedToken = (isset($r->row['token'])) ? $r->row['token'] : null;
		
		//取得salt & password 做出token驗證
		$sql = 'select `salt`, `password` from '.DB_PREFIX.'customer where customer_id = '. $id;
		$r = $this->db->query($sql);
		$reMakeToken = sha1($r->row['salt'].$r->row['password']);
				
		if( ($token === $MakedToken) && ($token === $reMakeToken) && ($MakedToken === $reMakeToken)) {
			$sql = 'DELETE FROM '.DB_PREFIX.'customer_verify where customer_id = ' . $id;
			$r = $this->db->query($sql);
			$this->response->redirect($this->url->link('account/verifysuccess'));
		} else {
			$this->response->redirect($this->url->link('error/NotFound'));
		}
	}
}
