<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<!-- Daftar Widget disebelah kanan -->
<?php
if($w_cos){
	echo "
	<div class='btd-right-menu'>
	<div class='row'>";
	$tmp = 0;
	foreach($w_cos as $data){
		echo "
		<div class='col-sm-6 col-md-12'>";

		if($data["jenis_widget"] == 1){
			include("donjo-app/views/widgets/".trim($data['isi']));

		} elseif($data["jenis_widget"] == 2){
			include(LOKASI_WIDGET.trim($data['isi']));

		} else {
			echo "
			<div class='list-frame'>
				<div class='list-view'>
					<h1 class='title'><span>", strip_tags($data['judul']) ,"</span></h1>
					<div>", html_entity_decode($data['isi']) ,"</div>
				</div>
			</div>";
		}

		echo "
		<div class='mb20'></div>
		</div>";

		$tmp++;

		if ($tmp % 2 == 0) {
			echo "<div class='clearfix visible-sm'></div>";
		}
	}
	echo "
	</div>
	</div>";
}
