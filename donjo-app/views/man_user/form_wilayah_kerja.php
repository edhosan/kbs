<script type="text/javascript">
	$(document).ready(function() { 
		var user = {};
		user.results = [
			<?php foreach($user as $data){ ?>
				{
					id: '<?php echo $data["id"] ?>',
					name: '<?php echo $data["nama"] ?>',
					group: '<?php echo $data["grup"] ?>'
				},
			<?php } ?>
		];
		user.total = user.results.length;

		$('#userid').flexbox( user, {
			resultTemplate: '<div><label>Nama  : </label> {name}</div>' + 
			                '<div><label>Group : </label> {group}</div>',
			watermark: 'Ketik nama user di sini..',
		    width: 260,
		    noResultsText :'Tidak ada nama user yang sesuai..',
			    onSelect: function() {
				$('#'+'main').submit();
		    }
		});

	});	
</script>

<div id="pageC">
<table class="inner">
<tr style="vertical-align:top">
<td style="background:#fff;padding:0px;">

<div class="content-header">

</div>
<div id="contentpane">
	<div class="ui-layout-north panel"><h3>Form Wilayah Kerja Pengguna</h3>
</div>

<form id="mainform" action="<?php echo $form_action?>" method="POST" enctype="multipart/form-data">
<div class="ui-layout-center" id="maincontent" style="padding: 5px;">
	<table class="form">
        <tr>
          <th width="100"><?php echo ucwords($this->setting->sebutan_kecamatan)?></th>
          <td>
            <select name='kecamatan' onchange="formAction('mainform','<?php echo site_url('wilayah_kerja_user/form')?>')" <?php if($kecamatan){?>class="required" <?php }?>>
              <option value="">Pilih <?php echo ucwords($this->setting->sebutan_kecamatan)?></option>
              <?php foreach($kecamatan as $data){?>
                <option value="<?php echo $data['kecamatan']?>" <?php if($kec_sel==$data['kecamatan']){?>selected<?php }?>><?php echo unpenetration(ununderscore($data['kecamatan']))?></option>
              <?php }?>
            </select>
          </td>
        </tr>

        <tr>
          <th width="100"><?php echo ucwords($this->setting->sebutan_dusun)?></th>
          <td>
            <select name="id_cluster">
              <option value="">Pilih <?php echo ucwords($this->setting->sebutan_dusun)?></option>
              <?php foreach($dusun as $data){?>
                <option value="<?php echo underscore($data['dusun'])?>" <?php if($dus_sel==$data['dusun']){?>selected<?php }?>><?php echo unpenetration(ununderscore($data['dusun']))?></option>
              <?php }?>
            </select>
          </td>
        </tr>

       	<tr>
            <th>Username / Nama</th>
            <td>
                <div id="userid" name="id_user"></div>
            </td>
        </tr>
	</table>
</div>

<div class="ui-layout-south panel bottom">
<div class="left">
<a href="<?php echo site_url()?>wilayah_kerja_user" class="uibutton icon prev">Kembali</a>
</div>
<div class="right">
<div class="uibutton-group">
<button class="uibutton" type="reset"><span class="fa fa-refresh"></span> Bersihkan</button>
<button class="uibutton confirm" type="submit" ><span class="fa fa-save"></span> Simpan</button>
</div>
</div>
</div> </form>
</div>
</td></tr></table>
</div>
