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
				$views_partial_layout = '';
				switch ($m) {
					case 1:
						$views_partial_layout = "$folder_themes/partials/mandiri/biodata.php";
						break;
					case 2:
						$views_partial_layout = "$folder_themes/partials/mandiri/layanan.php";
						break;
					case 4:
						$views_partial_layout = "$folder_themes/partials/mandiri/bantuan.php";
						break;
					default:
						$views_partial_layout = "$folder_themes/partials/mandiri/lapor.php";
				}
				$this->load->view($views_partial_layout);
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