<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php
echo "
<div class='list-frame'>

	<div>
		<h2 class='text-title mt0'><strong>Daftar Calon Pemilih Berdasarkan Wilayah (pada tgl pemilihan $tanggal_pemilihan)</strong></h2>

		<div class='table-responsive'>
		<table id='dpt' class='table table-bordered table-striped'>
		<thead>
		<tr>
			<th>No</th>
			<th>Nama Dusun</th>
			<th>RW</th>
			<th>Jiwa</th>
			<th>Lk</th>
			<th>Pr</th>
		</tr>
		</thead>";
		if(count($main) > 0){
			echo "
			<tbody>";

			foreach($main as $data){
				echo "<tr>
					<td>".$data['no']."</td>
					<td>".strtoupper($data['dusun'])."</td>
					<td>".strtoupper($data['rw'])."</td>
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

