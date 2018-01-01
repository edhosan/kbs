<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php
echo "
<div class='list-frame'>

	<div>
		<h2 class='text-title mt0'><strong>Demografi Berdasar ". $heading."</strong></h2>

		<div class='table-responsive'>
		<table class='table table-bordered table-striped'>
		<thead>
		<tr>
			<th>No</th>
			<th>Nama Dusun</th>
			<th>Nama Kepala Dusun</th>
			<th>Jumlah RT</th>
			<th>Jumlah KK</th>
			<th>Jiwa</th>
			<th>Lk</th>
			<th>Pr</th>
		</tr>
		</thead>";
		if(count($main) > 0){
			echo "
			<tbody>";

			foreach($main as $data){
				echo "
				<tr>
					<td>".$data['no']."</td>
					<td>".strtoupper(unpenetration(ununderscore($data['dusun'])))."</td>
					<td>".strtoupper(unpenetration($data['nama_kadus']))."</td>
					<td class='text-right'>".$data['jumlah_rt']."</td>
					<td class='text-right'>".$data['jumlah_kk']."</td>
					<td class='text-right'>".$data['jumlah_warga']."</td>
					<td class='text-right'>".$data['jumlah_warga_l']."</td>
					<td class='text-right'>".$data['jumlah_warga_p']."</td>
				</tr>";
			}
			echo "
			</tbody>
			<tfooter>
			<tr>
				<th colspan=3 class='text-right'>TOTAL</th>
				<th class='text-right'>".$total['total_rt']."</th>
				<th class='text-right'>".$total['total_kk']."</th>
				<th class='text-right'>".$total['total_warga']."</th>
				<th class='text-right'>".$total['total_warga_l']."</th>
				<th class='text-right'>".$total['total_warga_p']."</th>
			</tr>
			</tfooter>";

		} else {
			echo "<tr><td colspan=6 class='text-center'>Daftar masih kosong</td></tr>";
		}
		echo "
		</table>
		</div>
	</div>

</div> <!-- .list-frame -->";

