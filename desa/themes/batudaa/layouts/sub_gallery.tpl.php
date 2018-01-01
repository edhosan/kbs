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
		<?php $this->load->view("$folder_themes/partials/gallery/gambar.php"); ?>
	</div>
</div>

<?php $this->load->view("$folder_themes/commons/copyleft.php"); ?>

</body>
</html>