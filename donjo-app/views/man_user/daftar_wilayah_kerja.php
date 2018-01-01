<script>
  $(function() {
    var keyword = <?php echo $keyword?> ;
    $( "#cari" ).autocomplete({
      source: keyword
    });
  });
</script>

<div id="pageC">
  <table class="inner">
<tr style="vertical-align:top">
    <td style="background:#fff;padding:0px;">
<div class="content-header">
    <h3>Wilayah Kerja</h3>
</div>
<div id="contentpane">
  <form id="mainform" name="mainform" action="" method="post">
    <div class="ui-layout-center" id="maincontent" style="padding: 5px;">
        <div class="table-panel top">
            <div class="left">
              <div class="uibutton-group">
                  <a href="<?php echo site_url('wilayah_kerja_user/form')?>" class="uibutton tipsy south" title="Tambah Wilayah Kerja Baru" ><span class="fa fa-plus-square">&nbsp;</span>Tambah Wilayah Kerja Baru</a>
                  <button type="button" title="Hapus Data" onclick="deleteAllBox('mainform','<?php echo site_url("wilayah_kerja_user/delete_all/$p/$o")?>')" class="uibutton tipsy south"><span class="fa fa-trash">&nbsp;</span>Hapus Data
              </div>
            </div>
            <div class="right">
                <input name="cari" id="cari" type="text" class="inputbox help tipped" size="20" value="<?php echo $cari?>" title="Cari.." onkeypress="if (event.keyCode == 13) {$('#'+'mainform').attr('action','<?php echo site_url('wilayah_kerja_user/search')?>');$('#'+'mainform').submit();}" />
                <button type="button" onclick="$('#'+'mainform').attr('action','<?php echo site_url('wilayah_kerja_user/search')?>');$('#'+'mainform').submit();" class="uibutton tipsy south"  title="Cari Data"><span class="fa fa-search">&nbsp;</span>Cari</button>
            </div>
        </div>
        <table class="list">
    <thead>
            <tr>
                <th>No</th>
                <th><input type="checkbox" class="checkall"/></th>
                <th width="200">Aksi</th>
                <?php  if($o==2): ?>
                <th align="left" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/1")?>">Username <span class="fa fa-sort-asc fa-sm"></span></a></th>
              <?php  elseif($o==1): ?>
                <th align="left" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/2")?>">Username <span class="fa fa-sort-desc fa-sm"></span></a></th>
              <?php  else: ?>
                <th align="left" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/1")?>">Username <span class="fa fa-sort fa-sm"></span></a></th>
              <?php  endif; ?>

              <?php  if($o==4): ?>
                <th align="left"><a href="<?php echo site_url("wilayah_kerja_user/index/$p/3")?>">Nama <span class="fa fa-sort-asc fa-sm">&nbsp;</span></a></th>
              <?php  elseif($o==3): ?>
                <th align="left"><a href="<?php echo site_url("wilayah_kerja_user/index/$p/4")?>">Nama <span class="fa fa-sort-desc fa-sm">&nbsp;</span></a></th>
              <?php  else: ?>
                <th align="left"><a href="<?php echo site_url("wilayah_kerja_user/index/$p/3")?>">Nama <span class="fa fa-sort fa-sm">&nbsp;</span></a></th>
              <?php  endif; ?>

              <?php  if($o==6): ?>
                <th align="center" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/5")?>">Group <span class="fa fa-sort-asc fa-sm">&nbsp;</span></a></th>
              <?php  elseif($o==5): ?>
                <th align="center" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/6")?>">Group <span class="fa fa-sort-desc fa-sm">&nbsp;</span></a></th>
              <?php  else: ?>
                <th align="center" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/5")?>">Group <span class="fa fa-sort fa-sm">&nbsp;</span></a></th>
              <?php  endif; ?>

              <?php  if($o==8): ?>
                <th align="center" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/7")?>">Wilayah <span class="fa fa-sort-asc fa-sm">&nbsp;</span></a></th>
              <?php  elseif($o==7): ?>
                <th align="center" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/8")?>">Wilayah <span class="fa fa-sort-desc fa-sm">&nbsp;</span></a></th>
              <?php  else: ?>
                <th align="center" width='100'><a href="<?php echo site_url("wilayah_kerja_user/index/$p/7")?>">Wilayah <span class="fa fa-sort fa-sm">&nbsp;</span></a></th>
              <?php  endif; ?>

      </tr>
    </thead>
    <tbody>
        <?php  foreach($main as $data): ?>
    <tr>
          <td align="center" width="2"><?php echo $data['no']?></td>
      <td align="center" width="5">
        <?php  if($data['username']!='siteman') :?>
          <input type="checkbox" name="id_cb[]" value="<?php echo $data['id_user']?>:<?php echo $data['id_cluster']?>" />
        <?php  endif; ?>
      </td>
          <td>
            <div class="uibutton-group">
            <?php if($data['username']!='admin'){?>
              <a href="<?php echo site_url("wilayah_kerja_user/delete/$p/$o/$data[id_user]/$data[id_cluster]")?>" class="uibutton tipsy south" title="Hapus Data" target="confirm" message="Apakah Anda Yakin?" header="Hapus Data"><span class="fa fa-trash"></span></a>
            <?php }?>
            </div>
          </td>
          <td><?php echo $data['username']?></td>
          <td><?php echo $data['nama']?></td>
          <td><?php echo $data['grup']?></td>
          <td><?php echo ununderscore($data['id_cluster'])?></td>
      </tr>
        <?php  endforeach; ?>
    </tbody>
        </table>
    </div>
  </form>
    <div class="ui-layout-south panel bottom">
        <div class="left">
    <div class="table-info">
          <form id="paging" action="<?php echo site_url('wilayah_kerja_user')?>" method="post">
      <label>Tampilkan</label>
            <select name="per_page" onchange="$('#paging').submit()" >
              <option value="20" <?php  selected($per_page,20); ?> >20</option>
              <option value="50" <?php  selected($per_page,50); ?> >50</option>
              <option value="100" <?php  selected($per_page,100); ?> >100</option>
            </select>
            <label>Dari</label>
            <label><strong><?php echo $paging->num_rows?></strong></label>
            <label>Total Data</label>
          </form>
          </div>
        </div>
        <div class="right">
            <div class="uibutton-group">
            <?php  if($paging->start_link): ?>
        <a href="<?php echo site_url("wilayah_kerja_user/index/$paging->start_link/$o")?>" class="uibutton"  ><span class="fa fa-fast-backward"></span> Awal</a>
      <?php  endif; ?>
      <?php  if($paging->prev): ?>
        <a href="<?php echo site_url("wilayah_kerja_user/index/$paging->prev/$o")?>" class="uibutton"  ><span class="fa fa-step-backward"></span> Prev</a>
      <?php  endif; ?>
            </div>
            <div class="uibutton-group">

        <?php  for($i=$paging->start_link;$i<=$paging->end_link;$i++): ?>
        <a href="<?php echo site_url("wilayah_kerja_user/index/$i/$o")?>" <?php  jecho($p,$i,"class='uibutton special'")?> class="uibutton"><?php echo $i?></a>
        <?php  endfor; ?>
            </div>
            <div class="uibutton-group">
      <?php  if($paging->next): ?>
        <a href="<?php echo site_url("wilayah_kerja_user/index/$paging->next/$o")?>" class="uibutton">Next <span class="fa fa-step-forward"></span></a>
      <?php  endif; ?>
      <?php  if($paging->end_link): ?>
                <a href="<?php echo site_url("wilayah_kerja_user/index/$paging->end_link/$o")?>" class="uibutton">Akhir <span class="fa fa-fast-forward"></span></a>
      <?php  endif; ?>
            </div>
        </div>
    </div>
</div>
</td></tr></table>
</div>
