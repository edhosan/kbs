<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<!DOCTYPE html>
<html>
<head>
<?php $this->load->view("$folder_themes/commons/meta.php"); ?>
</head>
<body>

<?php
$this->load->view("$folder_themes/commons/header.php");

// slider, tidak muncul kalau dalam mode search
if ((empty($_GET['cari'])) && ((count($slide_galeri)>0 || count($slide_artikel)>0))) {
	$this->load->view("$folder_themes/partials/slider.php");
}
?>

<div id='batanga'>
	<div class='container'>
		<div class='row mt20'>
			<div class='col-md-8 mb20'>
				<?php $this->load->view("$folder_themes/partials/content.php"); ?>
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
