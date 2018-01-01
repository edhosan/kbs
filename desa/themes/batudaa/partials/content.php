<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php
// headline muncul kalau tidak sedang melakukan pencarian
if ((empty($_GET['cari'])) && ($headline)) {
	$url = site_url("first/artikel/$headline[id]");
	//$abstrak_headline = potong_teks($headline['isi'], 700);
	$abstrak_headline = potong_teks($headline['isi'], 410);
	echo "
	<div class='btd-card btd-card-full mb20 headline'>
		<h2 class='artikel-judul text-title mt0'><a href='$url'>$headline[judul]</a></h2>
		<div class='artikel-waktu text-muted'>
			<span class='mr10'><i class='fa fa-clock-o'></i> ".tgl_indo2($headline['tgl_upload'])."</span>
			<span class='mr10'><i class='fa fa-user'></i>  $headline[owner]</span> ";
			if (trim($headline['kategori']) != '') {
				echo "<span><i class='fa fa-tag'></i> <a href='", site_url("first/kategori/$headline[id_kategori]") ,"'>$headline[kategori]</a></span>";
			}
		echo "
		</div>
		<div class='clearfix mt20'>";
			if (($headline['gambar']!='') && (is_file(LOKASI_FOTO_ARTIKEL."kecil_".$headline['gambar']))) {
				echo "
				<div class='artikel-gambar-kecil'>
					<div class='artikel-opensid-img'>
						<img src='".AmbilFotoArtikel($headline['gambar'],'kecil')."' alt='". $headline["judul"] ."'/>
					</div>
				</div>";
			}
			echo "
			<div class='artikel-konten'>$abstrak_headline <a href='$url'>..selengkapnya</a></div>
		</div>
	</div>

	<div class='clearfix mb20'></div>";
}

// daftar artikel
$title = (!empty($judul_kategori))? $judul_kategori: "Berita KBS";
if(is_array($title)){
	foreach($title as $item){
		$title= $item;
	}
}

/*echo "
<div class='btd-card btd-card-top mb20'>
<div class='list-view'>
	<h1 class='title mt10'><span>$title</span></h1>
</div>
</div>*/

echo "
<h1 class='text-title content-title mt0 mb20'><span>$title</span></h1>

<div class='list-view artikel-daftar'>";
if($artikel){

	foreach($artikel as $data){
		$url = site_url("first/artikel/$data[id]");
		$abstrak = potong_teks($data['isi'], 410);
		echo "
		<div class='btd-card btd-card-top mb20'>
			<h3 class='artikel-judul title mt0'><a href='$url'>$data[judul]</a></h3>
			<div class='artikel-waktu text-muted'>
				<span class='mr10'><i class='fa fa-clock-o'></i> ".tgl_indo2($data['tgl_upload'])."</span>
				<span class='mr10'><i class='fa fa-user'></i>  $data[owner]</span> ";
				if (trim($data['kategori']) != '') {
					echo "<span><i class='fa fa-tag'></i> <a href='", site_url("first/kategori/$data[id_kategori]") ,"'>$data[kategori]</a></span>";
				}
			echo "
			</div>
			<div class='clearfix mt20'>";
				if (($data['gambar']!='') && (is_file(LOKASI_FOTO_ARTIKEL."kecil_".$data['gambar']))) {
					echo "
					<div class='artikel-gambar-kecil'>
						<div class='artikel-opensid-img'>
							<img src='".AmbilFotoArtikel($data['gambar'],'kecil')."' alt='". $data["judul"] ."'/>
						</div>
					</div>";
				}
				echo "
				<div class='artikel-konten'>$abstrak <a href='$url'>..selengkapnya</a></div>
			</div>
		</div>

		<div class='clearfix mb20'></div>";
		//<hr class='divider'>";
	}


} else {
	echo "
	<div>
		<hr class='divider'>
		<h3><strong>Maaf, belum ada data</strong></h3>
		<p>Belum ada artikel yang dituliskan dalam <strong>".$title."</strong>.</p>
		<p>Silakan kunjungi situs web kami dalam waktu dekat.</p>
	</div>";
}

echo "
</div> <!-- .list-view -->";

// kalau jml page lebih dari satu baru muncul
if (($artikel) && ((int)$paging->end_link > 1)){
	echo "
	<div>
		<ul class='pagination'>";
		// TODO : butuh helper untuk menggenerate html tag untuk paging
		if($paging->start_link){
			echo "<li><a href=\"".site_url("first/$paging_page/$paging->start_link" . $paging->suffix)."\" title='Halaman Pertama'>&laquo;</a></li>";
		}

		if($paging->prev){
			echo "<li><a href=\"".site_url("first/$paging_page/$paging->prev" . $paging->suffix)."\" title='Halaman Sebelumnya'>&larr;</a></li>";
		}

		for($i=$paging->start_link;$i<=$paging->end_link;$i++){
			$strC = ($p == $i)? "class='active'":"";
			echo "<li $strC><a href=\"".site_url("first/$paging_page/$i" . $paging->suffix)."\" title='Halaman $i'>$i</a></li>";
		}

		if($paging->next){
			echo "<li><a href=\"".site_url("first/$paging_page/$paging->next" . $paging->suffix)."\" title='Halaman Selanjutnya'>&rarr;</a></li>";
		}

		if($paging->end_link){
			echo "<li><a href=\"".site_url("first/$paging_page/$paging->end_link" . $paging->suffix)."\" title='Halaman Terakhir'>&raquo;</a></li>";
		}
		echo "
		</ul>
	</div>";
}
