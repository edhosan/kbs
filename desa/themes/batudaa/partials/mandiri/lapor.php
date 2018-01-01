<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<div class="list-frame">
	<h2 class='text-title mt0'>LAPORAN PENDUDUK</h2>
	<?php
	if ($_SESSION['sukses']==1){
		echo "<div class='alert alert-success'>Data telah terkirim, dan akan segera kami proses.</div>";
		unset($_SESSION['sukses']);
	}
	?>

	<p class='text-warning'><i class='fa fa-comments-o'></i> Silahkan laporkan perubahan data kependudukan anda.</p>

	<form id="validasi" action="<?php echo site_url('first/add_comment/775') ?>" method="POST">
	<div class='form-group'>
		<label>Pengirim</label>
		<input class="form-control" type="text" readonly="readonly" name="owner" value="<?php echo $_SESSION['nama']?>"/>
	</div>
	<div class='form-group'>
		<label>NIK</label>
		<input class="form-control" type="text" readonly="readonly" name="email" value="<?php echo $_SESSION['nik']?>"/>
	</div>
	<div class='form-group'>
		<label>Laporan</label>
		<textarea name="komentar" rows="10" class='form-control'></textarea>
	</div>

	<input class='btn btn-primary btn-lg' type="submit" value="Kirim Laporan">
	</form>
</div>
