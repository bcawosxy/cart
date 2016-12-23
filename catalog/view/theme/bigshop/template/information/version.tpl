<?php echo $header; ?>
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
<div class="dropdown">
  <a id="dLabel" data-target="#" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">
    Dropdown trigger
    <span class="caret"></span>
  </a>

  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
    ...
  </ul>
</div>

            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <?php echo $text_county; ?> <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu" id="countyList">
                <li><a href="#">Action</a></li>
                <li class="divider"></li>
              </ul>
            </div> 

            <!-- 行政區 -->
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <?php echo $text_area; ?> <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu" id="areaList">
                <li role="presentation" class="dropdown-header">請先選擇城市</li>
              </ul>
            </div> 

            <!-- 學校 -->
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <?php echo $text_school; ?> <span class="caret"></span>
              </button>
              <ul class="dropdown-menu" role="menu" id="schoolList">
                <li role="presentation" class="dropdown-header">請先選擇行政區</li>
              </ul>
            </div> 

           </div>
          </div>
        </div>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
$(document).ready(function(){
  $('.dropdown-toggle').dropdown();

  var itemList = {
    init : function(){  $('#countyList, #areaList, #schoolList').empty(); },
    initCountyList : function() {
      this.init();
      var a_countyList = ['台北市', '新北市', '桃園市'], html='';
      for (var i = a_countyList.length - 1; i >= 0; i--) {
        html += '<li><a href="javascript:void(0)">'+a_countyList[i]+'</a></li>';
      };

      $('#countyList').append(html);
    },
  }

  window.itemList = itemList;
})

$(document).on('click', '#PrimarySchool', function(){
  itemList.initCountyList();
}).on('click', '#JuniorHighSchool', function(){
  console.log('J');
}).on('click', '#SeniorHighSchool', function(){
  console.log('S');
});

</script>
<?php echo $footer; ?>
