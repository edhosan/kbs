<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php
echo "
<div class='list-view'>
	<h4 class='title mb0'><a href='", site_url('first/gallery') ,"'><i class='fa fa-arrow-left'></i> Galeri Album</a></h4>
	<h1 class='title mb5'><span>$parrent[nama]</span></h1>
	<p class='mb20 text-muted'><i class='fa fa-clock-o'></i> ", tgl_indo2($parrent['tgl_upload']) ,"</p>

	<div class='row'>";
	foreach($gallery AS $item){
		if (is_file(LOKASI_GALERI . "sedang_" . $item['gambar'])) {
			echo "
			<div class='col-md-3 col-sm-6'>
				<div class='thumbnail list-view-galery'>
					<a href='".AmbilGaleri($item['gambar'],'sedang')."' class='fancybox' rel=\"$parrent[id]\">
						<div class='img'>
							<img src='".AmbilGaleri($item['gambar'],'kecil')."' />
						</div>
					</a>
					<div class='list-view-galery-caption'><strong>". $item["nama"]."</strong></div>
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
			echo "<li><a href=\"".site_url("first/sub_gallery/$parrent[id]/$paging->start_link")."\" title='Halaman Pertama'>&laquo;</a></li>";
		}

		if($paging->prev){
			echo "<li><a href=\"".site_url("first/sub_gallery/$parrent[id]/$paging->prev")."\" title='Halaman Sebelumnya'>&larr;</a></li>";
		}

		for($i=$paging->start_link;$i<=$paging->end_link;$i++){
			$strC = ($p == $i)? "class='active'":"";
			echo "<li $strC><a href=\"".site_url("first/sub_gallery/$parrent[id]/$i")."\" title='Halaman $i'>$i</a></li>";
		}

		if($paging->next){
			echo "<li><a href=\"".site_url("first/sub_gallery/$parrent[id]/$paging->next")."\" title='Halaman Selanjutnya'>&rarr;</a></li>";
		}

		if($paging->end_link){
			echo "<li><a href=\"".site_url("first/sub_gallery/$parrent[id]/$paging->end_link")."\" title='Halaman Terakhir'>&raquo;</a></li>";
		}
		echo "
		</ul>
	</div>";
}
