<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php
if ($single_artikel["id"]){
	echo "
	<div class='list-frame artikel' id=\"artikel-".$single_artikel["judul"]."\">
		<h1 class='artikel-judul text-title mt0'><strong>$single_artikel[judul]</strong></h1>

		<div class='artikel-waktu text-muted mb15'>
			<span class='mr10'><i class='fa fa-clock-o'></i> ".tgl_indo2($single_artikel['tgl_upload'])."</span>
			<span class='mr10'><i class='fa fa-user'></i> ".$single_artikel['owner']."</span> ";
			# TODO OpenSID#697 : akan bekerja setelah PR diterima
			if (trim($single_artikel['kategori']) != '') {
				echo "<span><i class='fa fa-tag'></i> <a href='", site_url("first/kategori/$single_artikel[id_kategori]") ,"'>$single_artikel[kategori]</a></span>";
			}
		echo "
		</div>";

		if($single_artikel['gambar']!=''){
			if ( is_file(LOKASI_FOTO_ARTIKEL."sedang_".$single_artikel['gambar'])) {
				echo "
				<div class='artikel-gambar mb10'>
					<a href=\"".AmbilFotoArtikel($single_artikel['gambar'],'sedang')."\" class='fancybox' rel=\"$single_artikel[id]\">
						<img class='full' src=\"".AmbilFotoArtikel($single_artikel['gambar'],'sedang')."\" />
					</a>
				</div>";
			}
		}

		echo "<div class='artikel-konten clearfix'>$single_artikel[isi]</div>";

		if ($single_artikel['dokumen']!=''){
			if(is_file(LOKASI_DOKUMEN.$single_artikel['dokumen'])) {
				echo "<blockquote class='artikel-lampiran mt10'>Dokumen Lampiran: <a href=\"".base_url().LOKASI_DOKUMEN.$single_artikel['dokumen']."\">".$single_artikel['link_dokumen']."</a></blockquote>";
			}
		}

		// gambar tambahan
		// TODO OpenSID#691 : bagusnya fitur ini diganti dengan artikel yang bisa merujuk ke album atau sebaliknya
		echo "
		<div class='list-view artikel-galeri'>
		<div class='row'>";
		if($single_artikel['gambar1']!=''){
			if(is_file(LOKASI_FOTO_ARTIKEL."sedang_".$single_artikel['gambar1'])) {
				echo "
				<div class='col-md-4'>
					<div class='thumbnail list-view-galery'>
						<a href='".AmbilFotoArtikel($single_artikel['gambar1'],'sedang')."' class='fancybox' rel=\"$single_artikel[id]\">
							<div class='img'>
								<img src='".AmbilFotoArtikel($single_artikel['gambar1'],'kecil')."' />
							</div>
						</a>
					</div>
				</div>";
			}
		}
		if($single_artikel['gambar2']!=''){
			if(is_file(LOKASI_FOTO_ARTIKEL."sedang_".$single_artikel['gambar2'])) {
				echo "
				<div class='col-md-4'>
					<div class='thumbnail list-view-galery'>
						<a href='".AmbilFotoArtikel($single_artikel['gambar2'],'sedang')."' class='fancybox' rel=\"$single_artikel[id]\">
							<div class='img'>
								<img class='full-max' src='".AmbilFotoArtikel($single_artikel['gambar2'],'kecil')."' />
							</div>
						</a>
					</div>
				</div>";
			}
		}
		if($single_artikel['gambar3']!=''){
			if(is_file(LOKASI_FOTO_ARTIKEL."sedang_".$single_artikel['gambar3'])) {
				echo "
				<div class='col-md-4'>
					<div class='thumbnail list-view-galery'>
						<a href='".AmbilFotoArtikel($single_artikel['gambar3'],'sedang')."' class='fancybox' rel=\"$single_artikel[id]\">
							<div class='img'>
								<img class='full-max' src='".AmbilFotoArtikel($single_artikel['gambar3'],'kecil')."' />
							</div>
						</a>
					</div>
				</div>";
			}
		}

		echo "
		</div>
		</div>

		<div class='clearfix form-group artikel-bagikan'>
			<ul id='pageshare' title='bagikan ke teman anda' class='pagination'>
				<li id='fb'><a name='b_share' href='http://www.facebook.com/sharer.php?u=".site_url()."first/artikel/".$single_artikel["id"]."'><i class='fa fa-facebook-square'></i><span class='hidden-xs'> Share</span></a></li>
				<li id='rt'><a href='http://twitter.com/share' class='twitter-share-button'><i class='fa fa-twitter text-info'></i><span class='hidden-xs'> Tweet</span></a></li>
				<li id='gpshare'><a href='https://plus.google.com/share?url=".site_url()."first/artikel/".$single_artikel["id"]."&hl=id'><i class='fa fa-google-plus text-danger'></i><span class='hidden-xs'> Bagikan</span></a></li>
				<li id='wa_share'><a href='whatsapp://send?text=".site_url()."first/artikel/".$single_artikel["id"]."'><i class='fa fa-whatsapp text-success'></i><span class='hidden-xs'> WhatsApp</span></a></li>
			</ul>
		</div>

		<div class='clearfix artikel-komentar-daftar'>";
		if (is_array($komentar)){
			echo "
			<div class='sub-frame-1'>
			<div class='list-view'><h3 class='title'><strong>Komentar</strong></h3></div>";
			foreach($komentar AS $data){
				if($data['enabled']==1){
					echo "
					<div style='margin-left:-5px;'><span class='mr10'><i class='fa fa-user'></i> $data[owner]</span> <span class='text-success'><small><i class='fa fa-clock-o'></i> ".tgl_indo2($data['tgl_upload'])."</small></span></div>
					<div class='mt10'><blockquote>$data[komentar]</blockquote></div>";
				}
			}
			echo "
			</div>";

		//} else if ($single_artikel['boleh_komentar']){
		//	echo "<div class='sub-frame-1'>Silakan tulis komentar dalam formulir berikut ini (Gunakan bahasa yang santun)</div>";
		}
		echo "
		</div>


		<div class='sub-frame-2 artikel-komentar-form'>";
		if($single_artikel['boleh_komentar']){
			//echo "<p><i>Formulir Komentar (Komentar baru terbit setelah disetujui Admin)</i></p>";
			echo "<p><i>Silakan tulis komentar dalam formulir berikut ini. Gunakan bahasa yang santun dan komentar baru terbit setelah disetujui Admin.</i></p>";

			// tampilkan hanya jika 'flash_message' ada
			if (isset($_SESSION['validation_error']) AND $_SESSION['validation_error']) $label = 'label-danger'; else $label = 'label-info';
			if ($flash_message) {
				echo "<div class='sub-frame-0 ".$label."'>$flash_message</div>";
			}

			echo "
			<div>
				<form id='form-komentar' name='form' action='".site_url("first/add_comment/".$single_artikel["id"])."' method='POST'>
				<div>
					<div class='form-group'>
						<label>Nama</label>
						<input class='form-control input-sm' type=text required name='owner' maxlength=30 value=\"".(!empty($_SESSION['post']['owner']) ? $_SESSION['post']['owner'] : $_SESSION['nama'])."\">
					</div>
					<div class='form-group'>
						<label>Alamat E-mail</label>
						<input class='form-control input-sm' type=text placeholder='(boleh kosong)' name='email' maxlength=30 value=\"".$_SESSION['post']['email']."\">
					</div>
					<div class='form-group'>
						<label>Komentar</label>
						<textarea class='form-control input-sm' required name='komentar'>".$_SESSION['post']['komentar']."</textarea>
					</div>
					<div class='form-group'>
						<div class='row'>
							<div class='col-sm-4'>
								<img id='captcha' src='".base_url('securimage/securimage_show.php')."' alt='CAPTCHA Image'/>
							</div>
							<div class='col-sm-4'>
								<a href='#' onclick=\"document.getElementById('captcha').src = '".base_url()."securimage/securimage_show.php?' + Math.random(); return false\">[ Ganti Gambar ]</a>
								<div><input class='form-control input-sm' type='text' required name='captcha_code' maxlength='6' value='".$_SESSION['post']['captcha_code']."'/> Isikan kode di gambar</div>
							</div>
						</div>
					</div>
					<input class='btn btn-primary btn-lg' type='submit' value='Kirim Komentar'>
				</div>
				</form>
			</div>";

		} else {
			echo "<span class='info'>Komentar untuk artikel ini telah ditutup.</span>";
		}
		echo "
		</div> <!-- .sub-frame-2 -->

	</div> <!-- .list-frame -->";


} else {
	show_404();
	/*
	echo "
	<div class='list-frame'>
		<h3><strong>Maaf, data tidak ditemukan</strong></h3>
		<p>Anda telah terdampar di halaman yang datanya tidak ada lagi di web ini. Mohon periksa kembali, atau laporkan kepada kami.</p>
	</div>";
	*/
}

