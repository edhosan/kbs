<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<div class='navbar navbar-default navbar-fixed-top'>
	<div class='container'>

		<div class='navbar-header'>
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a href="<?php echo site_url('first'); ?>"><img src="<?php echo LogoDesa($desa['logo']) ?>" class='hidden-xs'></a>
			<a class='navbar-brand with-subbrand' href="<?php echo site_url('first'); ?>">
				<div>
					<div class='title hidden-sm'><?php echo "<span class='hidden-xs web-title-desa'>" . ucwords($this->setting->sebutan_desa) . ' </span>' . $desa['nama_desa'] ?></div>
					<div class='sub-title hidden-xs hidden-sm'><?php echo "<span class='web-title-kabupaten'>" . ucwords($this->setting->sebutan_kabupaten . ' </span>' . $desa['nama_kabupaten']) ?></div>
				</div>
			</a>
		</div>

		<div id="navbar" class="navbar-collapse collapse">
			<?php $s_display = (trim($_GET['cari'])=='') ? '' : 'visible'; ?>
			<div class="navbar-form <?php echo $s_display; ?>">
				<form id='formSearch' method='get' action="<?php echo site_url('first') ?>">
					<div class="form-group">
						<div class="input-group">
							<input type='text' class='form-control' placeholder="Pencarian..." name='cari' value="<?php echo $_GET['cari'] ?>">
							<span class="input-group-btn">
								<button type='submit' class='btn btn-default'><i class='fa fa-search'></i></button>
							</span>
						</div>
					</div>
				</form>
			</div>

            <ul class="nav navbar-nav navbar-right">
				<?php foreach($menu_atas as $data){?>
					<?php if(count($data['submenu'])>0): ?>
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="<?php echo site_url()."first/".$data['link']?>"><?php echo $data['nama'] . " <i class='fa fa-angle-down'></i>"; ?></a>
							<ul class="dropdown-menu">
								<?php foreach($data['submenu'] as $submenu): ?>
									<li><a href="<?php echo site_url()."first/".$submenu['link']?>"><?php echo $submenu['nama']?></a></li>
								<?php endforeach; ?>
							</ul>
						</li>
					<?php else: ?>
						<li class='$item[status]'><a href="<?php echo site_url()."first/".$data['link']?>"><?php echo $data['nama'];?></a></li>
					<?php endif; ?>
				<?php }?>
				<li class='hidden-xs'><a href='javascript:void(0)' id='btnSearch' class="<?php echo $s_display; ?>"><i class='fa fa-search'></i></a></li>
			</ul>

		</div> <!-- #navbar -->

	</div> <!-- .container -->
</div>

<div id='lunggongo'></div>