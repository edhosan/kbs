<?php  if(!defined('BASEPATH')) exit('No direct script access allowed');

class Wilayah_Kerja_User extends CI_Controller{

	function __construct(){
		parent::__construct();
		session_start();
		$this->load->model('user_model');
		$grup	= $this->user_model->sesi_grup($_SESSION['sesi']);
		if($grup!=1) {
			$_SESSION['request_uri'] = $_SERVER['REQUEST_URI'];
			redirect('siteman');
		}
		$this->load->model('header_model');
		$this->load->model('penduduk_model');
		$this->modul_ini = 11;
	}

	function clear(){
		unset($_SESSION['cari']);
		redirect('wilayah_kerja_user');
	}

	function index($p=1,$o=0){

		$data['p']        = $p;
		$data['o']        = $o;

		if(isset($_SESSION['cari']))
			$data['cari'] = $_SESSION['cari'];
		else $data['cari'] = '';

		if(isset($_POST['per_page']))
			$_SESSION['per_page']=$_POST['per_page'];
		$data['per_page'] = $_SESSION['per_page'];

		$data['paging']  = $this->user_model->paging_wilayah_kerja($p,$o);
		$data['main']    = $this->user_model->list_data_wilayah_kerja($o, $data['paging']->offset, $data['paging']->per_page);
		$data['keyword'] = $this->user_model->autocomplete_wilayah_kerja();

		$header = $this->header_model->get_data();
		$menu['act']='1';

		$this->load->view('header', $header);
		$this->load->view('man_user/nav', $menu);
		$this->load->view('man_user/daftar_wilayah_kerja',$data);
		$this->load->view('footer');
	}

	function form($p=1,$o=0,$id_user='',$id_cluster=''){

		$data['p'] = $p;
		$data['o'] = $o;

		if(isset($_POST['kecamatan']))
			$data['kec_sel'] = $_POST['kecamatan'];
		else
			$data['kec_sel'] = "";


		if(isset($_POST['dusun']))
			$data['dus_sel'] = $_POST['dusun'];
		else
			$data['dus_sel'] = '';

		if($id_user && $id_cluster){
			$data['wilayah_kerja'] = $this->user_model->get_user($id);
			$data['form_action']   = site_url("man_user/update/$p/$o/$id");
		}
		else{
			$data['wilayah_kerja'] = null;
			$data['form_action'] = site_url("wilayah_kerja_user/insert");
		}

		$data['kecamatan'] = $this->penduduk_model->list_kecamatan();
		$data['dusun'] = $this->penduduk_model->list_dusun($data['kec_sel']);
		$data['user'] = $this->user_model->list_user();
		$header = $this->header_model->get_data();
		$menu['act']='1';
		unset($_SESSION['dari_internal']);

		$this->load->view('header', $header);
		$this->load->view('man_user/nav', $menu);
		$this->load->view('man_user/form_wilayah_kerja',$data);
		$this->load->view('footer');
	}

	function search(){
		$cari = $this->input->post('cari');
		if($cari!='')
			$_SESSION['cari']=$cari;
		else unset($_SESSION['cari']);
		redirect('wilayah_kerja_user');
	}

	function filter(){
		$filter = $this->input->post('filter');
		if($filter!=0)
			$_SESSION['filter']=$filter;
		else unset($_SESSION['filter']);
		redirect('man_user');
	}

	function insert(){
		$this->user_model->insert_wilayah_kerja();
		redirect("wilayah_kerja_user");
	}

	function update($p=1,$o=0,$id=''){
		$this->user_model->update($id);
		redirect("man_user/index/$p/$o");
	}

	function delete($p=1,$o=0,$id_user='',$id_cluster=''){
		$this->user_model->delete_wilayah_kerja($id_user,$id_cluster);
		redirect("wilayah_kerja_user/index/$p/$o");
	}

	function delete_all($p=1,$o=0){
		$this->user_model->delete_all_wilayah_kerja();
		redirect("wilayah_kerja_user/index/$p/$o");
	}

	function user_lock($id=''){
		$this->user_model->user_lock($id,0);
		redirect("man_user/index/$p/$o");
	}

	function user_unlock($id=''){
		$this->user_model->user_lock($id,1);
		redirect("man_user/index/$p/$o");
	}

}
