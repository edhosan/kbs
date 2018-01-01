<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php
echo "
<div class='list-view'>
	<h1 class='title mb20'><span>Galeri Album</span></h1>

	<div class='row'>";
	foreach($gallery AS $item){
		if (is_file(LOKASI_GALERI . "sedang_" . $item['gambar'])) {
			$sub = site_url("first/sub_gallery/$item[id]");
			echo "
			<div class='col-md-3 col-sm-6'>
				<div class='thumbnail list-view-galery' title=\"$item[nama]\">
					<a href='$sub'>
						<div class='img'>
							<img src='".AmbilGaleri($item['gambar'],'kecil')."' />
						</div>
					</a>
					<div class='list-view-galery-caption'>
						<strong><a href='$sub'>$item[nama]</a></strong>
						<p><small>", tgl_indo2($item['tgl_upload']) ,"</small></p>
					</div>
				</div>
			</div>";
		}
	}
	echo "
	</div>
</div>";


if ((int)$paging->end_link > 1) {
	echo "
	<div class='clearfix mt20'>
		<ul class='pagination'>";
		if($paging->start_link){
			echo "<li><a href=\"".site_url("first/gallery/$paging->start_link")."\" title='Halaman Pertama'>&laquo;</a></li>";
		}

		if($paging->prev){
			echo "<li><a href=\"".site_url("first/gallery/$paging->prev")."\" title='Halaman Sebelumnya'>&larr;</a></li>";
		}

		for($i=$paging->start_link;$i<=$paging->end_link;$i++){
			$strC = ($p == $i)? "class='active'":"";
			echo "<li $strC><a href=\"".site_url("first/gallery/$i")."\" title='Halaman $i'>$i</a></li>";
		}

		if($paging->next){
			echo "<li><a href=\"".site_url("first/gallery/$paging->next")."\" title='Halaman Selanjutnya'>&rarr;</a></li>";
		}

		if($paging->end_link){
			echo "<li><a href=\"".site_url("first/gallery/$paging->end_link")."\" title='Halaman Terakhir'>&raquo;</a></li>";
		}
		echo "
		</ul>
	</div>";
}