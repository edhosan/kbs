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
				<?php $this->load->view("$folder_themes/partials/artikel.php"); ?>
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
