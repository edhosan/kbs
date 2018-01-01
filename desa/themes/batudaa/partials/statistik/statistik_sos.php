<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<script type="text/javascript" src="<?php echo base_url()?>assets/js/highcharts/highcharts.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	new Highcharts.Chart({
		chart: {
			renderTo: 'container',
			defaultSeriesType: 'column'
		},
		title: {
			text: 'Statistik Kelas Sosial'
		},
		xAxis: {
			title: {
				text: 'Kelas Sosial'
			},
			categories: [
			<?php  $i=0;foreach($main as $data){$i++;?>
			  <?php echo "'$data[nama]',";?>
			<?php }?>
			]
		},
		yAxis: {
			title: {
				text: 'Populasi'
			}
		},
		legend: {
			layout: 'vertical',
			backgroundColor: '#FFFFFF',
			align: 'left',
			verticalAlign: 'top',
			x: 100,
			y: 70,
			floating: true,
			shadow: true,
			enabled:false
		},
		tooltip: {
			formatter: function() {
				return ''+
					this.x +': '+ this.y +'';
			}
		},
		plotOptions: {
			series: {
				colorByPoint: true
			},
			column: {
				pointPadding: 0.2,
				borderWidth: 0
			}
		},
			series: [{
			name: 'Populasi',
			data: [
			<?php  foreach($main as $data){?>
				<?php echo $data['jumlah'].",";?>
			<?php }?>]

		}]
	});

});
</script>

<?php
echo "
<div class='list-frame'>

	<div class='top-frame'>
		<h2 class='text-title mt0 mb0'><strong>Statistik Kependudukan berdasarkan Indeks Kemiskinan</strong></h2>
	</div>

	<div class='clearfix'>
		<h3 class='text-title mt0'><strong>Grafik Data</strong></h3>
		<div>
			<div id='container'></div>
			<div id='contentpane'>
				<div class='ui-layout-north panel top'></div>
				<div class='ui-layout-center' id='chart' style='padding: 5px;'></div>
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
				<th>#</th>
				<th>Kelompok</th>
				<th>Jumlah</th>
				</tr>
			</thead>
			<tbody>";
			$i=0;
			foreach($main as $data){
				echo "
				<tr>
					<td class='text-right'>".$data['id']."</td>
					<td>".$data['nama']."</td>
					<td class='text-right'>".$data['jumlah']."</td>
				</tr>";
				$i=$i+$data['jumlah'];
			}
			echo "
			</tbody>
			<tfooter><tr><th colspan=2 class='text-right'>JUMLAH</th><th>$i</th></tr></tfooter>
			</table>
			</div>
		</div>

	</div>

</div> <!-- .list-frame -->";
