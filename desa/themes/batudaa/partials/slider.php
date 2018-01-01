<div class="container">
<div class="row mt20">
<div class="col-md-12 mb20">
			<div id=luncuran class='carousel slide'>
				<!-- Indicators -->
				<?php
				$jml=count($slider_gambar['gambar']);
				if ($jml > 1) {
					echo "<ol class='carousel-indicators'>";
					$tmp = 0;
					foreach($slider_gambar['gambar'] as $item) {
						$help = ($tmp == 0) ? "class='active'" : '';
						echo "<li data-target='#luncuran' data-slide-to=\"$tmp\" $help></li>";
						$tmp++;
					}
					echo "</ol>";
				}
				?>

				<div class='carousel-inner'>
					<?php
					$tmp = 0;
					foreach($slider_gambar['gambar'] as $item) {
						$help = ($tmp == 0) ? 'active' : '';
						$img = base_url($slider_gambar['lokasi'] . 'sedang_' . $item['gambar']);
						echo "
						<div class='item $help'>
							<img src=\"$img\"/>
							<div class='luncuran-caption'>
								<div class='luncuran-body'>
									<h2>$item[judul]</h2>";
									if ((int) $item['id'] > 0) {
										echo "<div class='hidden-xs'><a href='". site_url("first/artikel/$item[id]") ."' class='btn btn-success btn-lg'><i class='fa fa-newspaper-o'></i> Baca Artikel</a></div>";
									}
								echo "
								</div>
							</div>
						</div>";
						$tmp++;
					}

					if ($tmp == 0) {
						echo "
						<div class='item active'>
							<img alt='.' />
							<div class='luncuran-caption'>
								<div class='luncuran-body'>
									<h2>", strtoupper($desa['nama_desa']) ,"</h2>
									<div class='clearfix'>
										<p class='pull-left'>", strtoupper($this->setting->sebutan_kabupaten." ".$desa['nama_kabupaten']) ,"</p>
									</div>
								</div>
							</div>
						</div>";
					}
					?>
				</div>

				<?php if ($jml > 1): ?>
				<!-- Controls -->
				<a class="left carousel-control" href="#luncuran" data-slide="prev">
					<span class="icon-prev"></span>
				</a>
				<a class="right carousel-control" href="#luncuran" data-slide="next">
					<span class="icon-next"></span>
				</a>
				<?php endif ?>
			</div>
		</div>
	</div>
</div>


<?php
if (count($teks_berjalan)>0) {
	$this->load->view("$folder_themes/partials/marquee.php");
}
?>

<script language='javascript'>
$(document).ready(function() {
	$('.carousel').carousel({
		interval: 10000, // 10 detik
	});
});
</script>
