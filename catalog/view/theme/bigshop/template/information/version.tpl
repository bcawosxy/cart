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
              <input type="button" class="btn btn-primary btn-lg active" value="<?php echo $text_PrimarySchool; ?>" id="PrimarySchool" name="schoolbtn" data-school="primary">
              <input type="button" class="btn btn-primary btn-lg" value="<?php echo $text_JuniorHighSchool; ?>" id="JuniorHighSchool" name="schoolbtn" data-school="junior">
              <input type="button" class="btn btn-primary btn-lg" value="<?php echo $text_SeniorHighSchool; ?>" id="SeniorHighSchool" name="schoolbtn" data-school="senior">
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
                <select id="areaList" data-school="primary">
                  <option value="default"></option>
                </select>
              </div>

              <!-- 學校 -->
              <div class="btn-group col-sm-4 col-xs-12" style="margin: 5px 0px;">
                <span class="visible-xs-block visible-md-block"><?php echo $text_school; ?> : </span>
                <select id="schoolList">
                  <option value="default"></option>
                </select>
              </div>      
            </div>
          </div>
        </div>
      </div>

      <!--下半部區塊 (搜尋結果)-->
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            <div class="col-sm-12 search">
              <div class="table-responsive">
                <table id="display" class="table table-striped"> </table>
                <div style="display :none;" class="alert alert-danger" role="alert"><?php echo $text_no_results_text; ?></div>
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
  var item='<option value="default"></option>';
  for (var i = data.length - 1; i >= 0; i--) {
    item += '<option value="'+data[i].area_id+'">'+data[i].name+'</option>';
  }
  itemList.init();
  $('#areaList').append(item).trigger('chosen:updated');
}

function setSchool(data=[]) {
  var item='<option value="default"></option>';
  for (var i = data.length - 1; i >= 0; i--) {
    item += '<option value="'+data[i].primary_id+'">'+data[i].name+'</option>';
  }
  itemList.initPrimaryList();
  $('#schoolList').append(item).trigger('chosen:updated');
}

$(document).ready(function(){

  $('#countyList').chosen({
    placeholder_text_single : '<?php echo $text_county; ?>',
    no_results_text: '<?php echo $text_no_results_text; ?>',
    search_contains :true,
    width:'100%',
  }).on('change', function(evt, params) {
    $('div.alert').hide();
    var v = $('#countyList :selected').val();
    $.post("<?php echo $fetchAreaUrl ?>", {
      data : v,
    }, function(r) {
      r = $.parseJSON(r);
      setArea(r);
      setSchool();
    });
  });

  $('#areaList').chosen({
    placeholder_text_single : '<?php echo $text_area; ?>',
    no_results_text: '<?php echo $text_no_results_text; ?>',
    search_contains :true,
    width:'100%',
  }).on('change', function(evt, params) {
    $('div.alert').hide();
    var grade = $(this).data('school'),
        v = $('#areaList :selected').val();
    if(typeof grade == 'undefined') grade = 'primary';
    $.post("<?php echo $fetchJsonUrl ?>get"+grade+"byarea", {
      data : v,
    }, function(r) {
      r = $.parseJSON(r);
      setSchool(r);
    });
  });

  $('#schoolList').chosen({
    placeholder_text_single : '<?php echo $text_school; ?>',
    no_results_text: '<?php echo $text_no_results_text; ?>',
    search_contains :true,
    width:'100%',
  }).on('change', function(evt, params) {
    $('div.alert').hide();
    var type = $('#areaList').data('school'),
        school = $('#schoolList :selected').val(),
        schoolName = $('#schoolList :selected').html(),
        county = $('#countyList :selected').val(),
        countyName = $('#countyList :selected').html();
    $.post("<?php echo $fetchJsonUrl ?>getversionbyschool", {
      type : type,
      county : county,
      countyName : countyName,
      school : school,
      schoolName : schoolName,
    }, function(r) {
      r = $.parseJSON(r);
      $('#display').empty();
      
      if(r.result){
        colsNum = (Object.keys(r.data.grades[1]).length); 
        rowsNum = (Object.keys(r.data.grades).length+1);
        var html = ''
            colsAdd ='';
            content ='';
        html += `<tr class="waring" id="firstRow">                  
                  <td style="vertical-align: middle;color: #117dda; font-weight: bold;font-size:1.3em;" colspan="${colsNum+1}">${r.data.zone} - ${r.data.name}</td>
                </tr>
                <tr id="titleRow">
                  <td style="text-align:center;">年級</td>
                </tr>`;
        $('#display').append(html);

        for (var i in(r.data.grades[1])) { colsAdd += `<td style="font-weight:bold;">${i}</td>`; }
        $('#titleRow').append(colsAdd);

        for (var i in r.data.grades) {
          content += `<tr><td style="text-align:center;">${i}</td>`;
          for (var j in r.data.grades[i]) {
           content += `<td>${r.data.grades[i][j]}</td>`;
          }        
          content += `</tr>`;      
        }
        $('#display').append(content);
      } else {
        $('div.alert').show();
      }
    });
  });

  //init itemSelector
  var itemList = {
    init : function(){  $('#areaList, #schoolList').empty(); },
    initPrimaryList : function() {
      $('#schoolList').empty().trigger('chosen:updated');
    },
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
  $(this).addClass('active').siblings('input[type="button"]').removeClass('active');
  $('#areaList').data('school', $(this).data('school'));
  $('#display').empty();
  $('div.alert').hide();
});



</script>
<?php echo $footer; ?>
