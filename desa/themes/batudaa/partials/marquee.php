<?php  if(!defined('BASEPATH')) exit('No direct script access allowed'); ?>

<script type="text/javascript">
$(document).ready(function() {
	$('#marquee').on('cycle-initialized', function( event, opts ) {
		$('div.marquee-box').removeClass('hide');
	});
    $('#marquee').cycle({
		fx: 'carousel',
		speed: 20000,
		timeout: '10',
		easing: 'linear',
		pauseOnHover: true,
		slides: '> span',
		throttleSpeed: true
	});
});
</script>
<div class="container">
<div class="row mt20">
<div class="col-md-12 mb20">
<div class='marquee-box hide'>
<div id="marquee">
	<?php foreach($teks_berjalan AS $data) {?>
	<span><?php echo strip_tags($data['isi']); ?></span>
	<?php } ?>
	<span>&nbsp;</span>
</div>
</div>
</div>
</div>
</div>
</div>