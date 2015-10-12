<?php
class ControllerPaymentIONPay extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/ionpay');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ionpay', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		
		$this->data['entry_env'] = $this->language->get('entry_env');
		$this->data['entry_merchant'] = $this->language->get('entry_merchant');
		$this->data['entry_security'] = $this->language->get('entry_security');
		$this->data['entry_payment'] = $this->language->get('entry_payment');
		$this->data['entry_ionpay_rate'] = $this->language->get('entry_ionpay_rate');
		$this->data['entry_invoice'] = $this->language->get('entry_invoice');
		$this->data['entry_callback'] = $this->language->get('entry_callback');
		$this->data['entry_total'] = $this->language->get('entry_total');	
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_order_success_status'] = $this->language->get('entry_order_success_status');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

  		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['merchant'])) {
			$this->data['error_merchant'] = $this->error['merchant'];
		} else {
			$this->data['error_merchant'] = '';
		}

 		if (isset($this->error['security'])) {
			$this->data['error_security'] = $this->error['security'];
		} else {
			$this->data['error_security'] = '';
		}

 		if (isset($this->error['payment'])) {
			$this->data['error_payment'] = $this->error['payment'];
		} else {
			$this->data['error_payment'] = '';
		}

 		if (isset($this->error['inv_payment'])) {
			$this->data['error_inv_payment'] = $this->error['inv_payment'];
		} else {
			$this->data['error_inv_payment'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/ionpay', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
		$this->data['action'] = $this->url->link('payment/ionpay', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
		
		$inputs = array(
			'ionpay_environment',
			'ionpay_merchant',
			'ionpay_security',
			'ionpay_payment',
			'ionpay_rate',
			'ionpay_inv_payment',
			'ionpay_total',
			'ionpay_order_status_id',
			'ionpay_success_status',
			'ionpay_geo_zone_id',
			'ionpay_status',
			'ionpay_sort_order'
		);

		// For better performance
		for ($i=0; $i < count($inputs); $i++) { 
			if (isset($this->request->post[$inputs[$i]])) {
				$this->data[$inputs[$i]] = $this->request->post[$inputs[$i]];
			} else {
				$this->data[$inputs[$i]] = $this->config->get($inputs[$i]);
			}
		}
		
		$this->data['callback'] = HTTP_CATALOG . 'index.php?route=payment/ionpay/callback';
		
		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$this->load->model('localisation/geo_zone');
										
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		$this->template = 'payment/ionpay.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/ionpay')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['ionpay_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}

		if (!$this->request->post['ionpay_security']) {
			$this->error['security'] = $this->language->get('error_security');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>