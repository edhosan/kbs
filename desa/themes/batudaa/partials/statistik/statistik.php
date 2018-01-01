<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php if($tipe==1) { ?>
<script type="text/javascript">
$(document).ready(function() {
	new Highcharts.Chart({
		chart: { renderTo: 'container'},
		title:0,
				xAxis: {
					categories: [
					<?php  $i=0;foreach($stat as $data){$i++;?>
					  <?php if($data['jumlah'] != "-" AND $data['nama']!= "TOTAL"){echo "'$i',";}?>
					<?php }?>
					]
				},
			plotOptions: {
				series: {
					colorByPoint: true
				},
				column: {
					pointPadding: -0.1,
					borderWidth: 0
				}
			},
				legend: {
					enabled:false
				},
		series: [{
			type: 'column',
			name: 'Jumlah Populasi',
			shadow:1,
			border:1,
			data: [
					<?php  foreach($stat as $data){?>
						<?php if($data['jumlah'] != "-" AND $data['nama']!= "TOTAL"){?>
							['<?php echo $data['nama']?>',<?php echo $data['jumlah']?>],
						<?php }?>
					<?php }?>
			]
		}]
	});
});
</script>

<?php } else { ?>

<script type="text/javascript">
 $(document).ready(function () {
	// Build the chart
	new Highcharts.Chart({
		chart: {
			renderTo: 'container'
		},
		title:0,
		plotOptions: {
			pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				showInLegend: true
			}
		},
		series: [{
			type: 'pie',
			name: 'Jumlah Populasi',
			shadow:1,
			border:1,
			data: [
					<?php  foreach($stat as $data){?>
						<?php if($data['jumlah'] != "-" AND $data['nama']!= "TOTAL"){?>
							['<?php echo $data['nama']?>',<?php echo $data['jumlah']?>],
						<?php }?>
					<?php }?>
			]
		}]
	});
});
</script>
<?php }?>

<script src="<?php echo base_url()?>assets/js/highcharts/highcharts.js"></script>
<script src="<?php echo base_url()?>assets/js/highcharts/highcharts-more.js"></script>
<script src="<?php echo base_url()?>assets/js/highcharts/exporting.js"></script>
<script>
$(function(){
	$('#showData').click(function(){
		$('tr.tr-lebih').removeClass('hide');
		$('#showData').hide();
	});
});
</script>

<?php
echo "
<div class='list-frame'>

	<div>
		<div class='top-frame'>
			<h2 class='text-title mt0 mb0'><strong>Demografi Berdasar $heading</strong></h2>
		</div>

		<div class='clearfix'>
			<div class='row'>
				<div class='col-xs-4 col-md-8'><h3 class='text-title mt0'><strong>Grafik Data</strong></h3></div>
				<div class='col-xs-8 col-md-4'>
					<div class=\"box-tools pull-right\">
						<div class=\"btn-group-xs\">";
							$strC = ($tipe==1)? "btn-primary":"btn-default";
							echo "<a href=\"".site_url("first/statistik/$st/1")."\" class=\"btn $strC btn-xs\">Bar Graph</a>";
							$strC = ($tipe==0)? "btn-primary":"btn-default";
							echo "<a href=\"".site_url("first/statistik/$st/0")."\" class=\"btn $strC btn-xs\">Pie Cart</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div id='container'></div>
			<div id='contentpane'>
				<div class='ui-layout-north panel top'></div>
			</div>
		</div>


		<div class='mt20'>
			<h3 class='text-title mt0'><strong>Tabel Data</strong></h3>
		</div>
		<div>
			<div class='table-responsive'>
			<table class='table table-bordered table-striped'>
			<thead>
			<tr>
				<th rowspan=2>No</th>
				<th rowspan=2 class='text-left'>Kelompok</th>
				<th colspan=2>Jumlah</th>";
				if($jenis_laporan == 'penduduk'){
					echo "
					<th colspan=2>Laki-laki</th>
					<th colspan=2>Perempuan</th>";
				}
				echo "
			</tr>
			<tr>
			<th class='text-right'>n</th>
			<th class='text-right'>%</th>";
			if($jenis_laporan == 'penduduk'){
				echo "
				<th class='text-right'>n</th>
				<th class='text-right'>%</th>
				<th class='text-right'>n</th>
				<th class='text-right'>%</th>";
			}
			echo "
			</tr>
			</thead>
			<tbody>";
			$i=0; $l=0; $p=0;
			$hide=''; $not_hide=0;
			$jml = count($stat);
			foreach($stat as $data){
				$not_hide++;
				if ($not_hide > 10 AND $jml > 11) $hide='tr-lebih hide';
				echo "
				<tr class='$hide'>
					<td class='text-right'>".$data['no']."</td>
					<td>".$data['nama']."</td>
					<td class='text-right'>".$data['jumlah']."</td>
					<td class='text-right'>".$data['persen']."</td>";
					if($jenis_laporan == 'penduduk'){
						echo "
						<td class='text-right'>".$data['laki']."</td>
						<td class='text-right'>".$data['persen1']."</td>
						<td class='text-right'>".$data['perempuan']."</td>
						<td class='text-right'>".$data['persen2']."</td>";
					}
				echo "
				</tr>";
				$i=$i+$data['jumlah'];
				$l=$l+$data['laki'];
				$p=$p+$data['perempuan'];
			}
			echo "
			</tbody>
			</table>";

			if ($hide == "tr-lebih hide"){
				echo "<button class='btn btn-xs btn-success' id='showData'>Selengkapnya...</button>";
			}

			echo "
			</div>
		</div>
	</div>

</div> <!-- .list-frame -->";
