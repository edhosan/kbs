<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<div id="footer">
	<div class='container'>
		<div class='row'>
			<div class='col-md-6 col-xs-3 lang'>
				<a href='#' class='btn btn-warning'><i class='fa fa-arrow-up'></i></a>
			</div>
			<div class='col-md-6 col-xs-9 text-right'>
				<div class='footer-copyleft'><a href="https://www.facebook.com/groups/opensid/" target='_new' title='Forum'>Komunitas</a> <a href="<?php echo site_url('siteman')?>" target='_new' title='Login'>OpenSID</a> &copy; 2017</div>
				<div>Content by &reg; <?php echo ucwords($this->setting->sebutan_desa) . ' ' . trim($desa['nama_desa']) . ', ' . ucwords($this->setting->sebutan_kabupaten) . ' ' . $desa['nama_kabupaten']; ?></div>
			</div>
		</div>
	</div>
</div>