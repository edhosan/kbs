<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<!DOCTYPE html>
<html>
<head>
<?php $this->load->view("$folder_themes/commons/meta.php"); ?>
</head>
<body class='panipi-dark'>

<?php $this->load->view("$folder_themes/commons/header.php"); ?>

<div id='batanga'>
	<div class='container'>
		<div class='row mt20'>
			<div class='col-md-8 mb20'>
				<?php
				// TODO: karena keterbatasan ketersediaan contoh data, yang sudah diujicoba baru tipe 3 dan default
				if (($tipe == 2) && ($tipex==1)) {
					$this->load->view("$folder_themes/partials/statistik/statistik_sos.php");

				} else if ($tipe == 3){
					$this->load->view("$folder_themes/partials/statistik/wilayah.php");

				} else if($tipe == 4){
					// di themes tidak sedia, jadi ambil dari view default dan sesuaikan
					$this->load->view("$folder_themes/partials/statistik/dpt.php");

				} else {
					$this->load->view("$folder_themes/partials/statistik/statistik.php");
				}
				?>
			</div>
			<div class='col-md-4'>
				<?php $this->load->view("$folder_themes/commons/right_menu.php"); ?>
			</div>
		</div>
	</div>
</div>

<?php $this->load->view("$folder_themes/commons/copyleft.php"); ?>

</body>
</html>