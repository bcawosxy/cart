<?php echo $header; ?>
<script type="text/javascript" src="../catalog/view/javascript/chosen/chosen.jquery.min.js"></script>
<link rel=stylesheet type="text/css" href="../catalog/view/javascript/chosen/chosen.min.css">
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <h3><?php echo $text_subTitle; ?></h3>

      <!--上半部區塊 -->
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            <div class="col-sm-8">
              <input type="button" class="btn btn-primary btn-lg" value="<?php echo $text_PrimarySchool; ?>" id="PrimarySchool">
              <input type="button" class="btn btn-primary btn-lg" value="<?php echo $text_JuniorHighSchool; ?>" id="JuniorHighSchool">
              <input type="button" class="btn btn-primary btn-lg" value="<?php echo $text_SeniorHighSchool; ?>" id="SeniorHighSchool">
            </div>
          </div>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-sm-8">
              <!-- 縣市 -->
              <div class="btn-group col-sm-3 col-xs-12" style="margin: 5px 0px;">
                <span class="visible-xs-block visible-md-block"><?php echo $text_county; ?> : </span>
                <select id="countyList">
                  <option value="default"></option>
                  <?php 
                    foreach($zones as $k0 => $v0) {
                      echo '<option value="'.$v0['zone_id'].'">'.$v0['name'].'</option>';
                    }
                  ?>
                </select>
              </div>
              
              <!-- 行政區 -->
              <div class="btn-group col-sm-3 col-xs-12" style="margin: 5px 0px;">
                <span class="visible-xs-block visible-md-block"><?php echo $text_area; ?> : </span>
                <select id="areaList">
                  <option value="default"></option>
                  <option value="1">東區</option>
                  <option value="2">西區</option>
                  <option value="3">南區</option>
                  <option value="4">中央區</option>
                </select>
              </div>

              <!-- 學校 -->
              <div class="btn-group col-sm-3 col-xs-12" style="margin: 5px 0px;">
                <span class="visible-xs-block visible-md-block"><?php echo $text_school; ?> : </span>
                <select id="schoolList">
                  <option value="default"></option>
                  <option value="1">A國小</option>
                  <option value="2">B國小</option>
                  <option value="3">C國小</option>
                </select>
              </div>      
            </div>
          </div>
        </div>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
function setArea(data) {
  var item='';
  for (var i = data.length - 1; i >= 0; i--) {
    item += '<option value="'+data[i].area_id+'">'+data[i].name+'</option>';
  }
  itemList.init();
  $('#areaList').append(item).trigger('chosen:updated');
}

$(document).ready(function(){
  $('#countyList').chosen({
    placeholder_text_single : '<?php echo $text_county; ?>',
    no_results_text: '<?php echo $text_no_results_text; ?>',
    search_contains :true,
    width:'100%',
  }).on('change', function(evt, params) {
    $.post("<?php echo $fetchAreaUrl ?>", {
      data : params.selected,
    }, function(r) {
      r = $.parseJSON(r);
      setArea(r);
    });
  });

  $('#areaList').chosen({
    placeholder_text_single : '<?php echo $text_area; ?>',
    no_results_text: '<?php echo $text_no_results_text; ?>',
    search_contains :true,
    width:'100%',
  });

  $('#schoolList').chosen({
    placeholder_text_single : '<?php echo $text_school; ?>',
    no_results_text: '<?php echo $text_no_results_text; ?>',
    search_contains :true,
    width:'100%',
  });

  var itemList = {
    init : function(){  $('#areaList, #schoolList').empty(); },
    initCountyList : function() {
      this.init();
      $('#countyList').val('default');
      $('#countyList, #areaList, #schoolList').trigger('chosen:updated');
    },
  }

  window.itemList = itemList;
})

$(document).on('click', '#PrimarySchool, #JuniorHighSchool, #SeniorHighSchool', function(){
  itemList.initCountyList();
});

</script>
<?php echo $footer; ?>
