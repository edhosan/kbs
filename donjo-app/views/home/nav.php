<div id="nav">
<ul>
	<?php if($_SESSION['grup']==1){?>
		<li <?php if($act==0){?>class="selected"<?php }?>>
			<a href="<?php echo site_url('hom_desa/konfigurasi')?>">Identitas <?php echo ucwords($this->setting->sebutan_desa)?></a>
		</li>
	<?php }?>
	<li <?php if($act==2){?>class="selected"<?php }?>>
		<a href="<?php echo site_url('hom_desa')?>">KBS</a>
	</li>
</ul>
</div>
