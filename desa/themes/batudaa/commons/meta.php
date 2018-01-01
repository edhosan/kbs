<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<?php $desa_title = trim(ucwords($this->setting->sebutan_desa) . ' ' . $desa['nama_desa']); ?>
<meta content="utf-8" http-equiv="encoding">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name='viewport' content='width=device-width, initial-scale=1' />
<meta name='google' content='notranslate' />
<meta name='theme' content='batudaa' />
<meta name='theme:version' content='1.1' />
<meta name='theme:url' content='http://github.com/batudaa/batudaa-theme' />
<meta name='keywords' content="sid, sistem informasi desa, web, blog, informasi, website, batudaa, desa, kecamatan, kabupaten, indonesia, kampung, <?php echo $desa['nama_desa']; ?>, <?php echo $desa['nama_kecamatan']; ?>, <?php echo $desa['nama_kabupaten']; ?>" />
<meta property="og:site_name" content="<?php echo $desa_title ?>"/>
<meta property="og:type" content="article"/>
<?php if(isset($single_artikel)): ?>
	<title><?php echo $single_artikel["judul"] . " - $desa_title" ?></title>
	<meta name='description' content="<?php echo str_replace('"', "'", substr(strip_tags($single_artikel['isi']), 0, 400)); ?>" />
	<meta property="og:title" content="<?php echo $single_artikel["judul"];?>"/>
	<?php if (trim($single_artikel['gambar'])!=''): ?>
	<meta property="og:image" content="<?php echo base_url()?><?php echo LOKASI_FOTO_ARTIKEL?>sedang_<?php echo $single_artikel['gambar'];?>"/>
	<?php endif; ?>
	<meta property='og:description' content="<?php echo str_replace('"', "'", substr(strip_tags($single_artikel['isi']), 0, 400)); ?>" />
<?php else: ?>
	<title><?php $tmp = ltrim(get_dynamic_title_page_from_path(), ' -'); echo (trim($tmp)=='') ? $desa_title : "$tmp - $desa_title"; ?></title>
	<meta name='description' content="<?php echo $this->setting->website_title . ' ' . $desa_title; ?>" />
	<meta property="og:title" content="<?php echo $desa_title;?>"/>
	<meta property='og:description' content="<?php echo $this->setting->website_title . ' ' . $desa_title; ?>" />
<?php endif; ?>
<meta property='og:url' content="<?php echo current_url(); ?>" />
<?php if(is_file(LOKASI_LOGO_DESA . "favicon.ico")): ?>
<link rel="shortcut icon" href="<?php echo base_url() . LOKASI_LOGO_DESA?>favicon.ico" />
<?php else: ?>
<link rel="shortcut icon" href="<?php echo base_url('favicon.ico')?>" />
<?php endif; ?>
<link type='text/css' href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css'); ?>" rel='stylesheet' />
<link type='text/css' href="<?php echo base_url('assets/css/font-awesome.min.css'); ?>" rel='stylesheet' />
<link type='text/css' href='<?php echo base_url("$this->theme_folder/batudaa/vendor/fancybox/jquery.fancybox.css"); ?>' rel='stylesheet' />
<link type='text/css' href='<?php echo base_url("$this->theme_folder/batudaa/assets/css/batudaa.css"); ?>' rel='
stylesheet' />
<link type='text/css' href='<?php echo base_url("$this->theme_folder/batudaa/assets/css/marque.css"); ?>' rel='
stylesheet' />
<link type='text/css' href='<?php echo base_url("$this->theme_folder/batudaa/assets/css/text.css"); ?>' rel='
stylesheet' />
<?php if (is_file("desa/css/batudaa/desa-web.css")): ?>
<?php // Extra CSS untuk batudaa theme. Timpa aturan css batudaa theme di berkas ini. ?>
<link type='text/css' href='<?php echo base_url("desa/css/batudaa/desa-web.css"); ?>' rel='stylesheet' />
<?php endif; ?>
<script language='javascript' src="<?php echo base_url('assets/js/jquery.min.js'); ?>"></script>
<script language='javascript' src="<?php echo base_url('assets/bootstrap/js/bootstrap.js'); ?>"></script>
<script language='javascript' src='<?php echo base_url("$this->theme_folder/batudaa/vendor/fancybox/jquery.fancybox.js"); ?>'></script>
<script language='javascript' src="<?php echo base_url('assets/js/jquery.cycle2.min.js') ?>"></script>
<script language='javascript' src="<?php echo base_url('assets/js/jquery.cycle2.carousel.js') ?>"></script>
<script language='javascript' src='<?php echo base_url("$this->theme_folder/batudaa/assets/js/batudaa.js"); ?>'></script>