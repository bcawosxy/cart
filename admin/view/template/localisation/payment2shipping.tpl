<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-html" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-html" class="form-horizontal">      
          <div class="tab-pane">
            <div class="tab-content">
              <fieldset>
               <legend class="col-sm-2"><?php echo $text_payment; ?></legend>
               <legend class="col-sm-10"><?php echo $text_shipping; ?></legend>
              </fieldset>
              <?php foreach($payment_method as $k0 => $v0) { ?>               
              <fieldset>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $v0['title']; ?> :</label>
                  <div class="col-sm-10">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($shipping_method['quote'] as $k1 => $v1) { ?>
                      <div class="checkbox">
                        <label class="col-sm-4">
                          <?php if ( in_array($v1['code'], $payment2shippings[$v0['code']]) &&  !${'error_'.$v0['code']}) { ?>
                          <input id="<?php echo $k0.'_'.$k1 ;?>" type="checkbox" name="<?php echo $v0['code']; ?>[]" value="<?php echo $v1['code']; ?>" checked="checked" />
                          <?php echo $v1['title']; ?>
                          <?php } else { ?>
                          <input id="<?php echo $k0.'_'.$k1 ;?>" type="checkbox" name="<?php echo $v0['code']; ?>[]" value="<?php echo $v1['code']; ?>" />
                          <?php echo $v1['title']; ?>
                          <?php } ?>
                        </label>
                        <label class="col-sm-4" for="<?php echo $k0.'_'.$k1 ; ?>">
                          ( 費用 : <?php echo $v1['cost'] ?> )
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if (${'error_'.$v0['code']}) { ?>
                    <div class="text-danger"><?php echo ${'error_'.$v0['code']}; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
              <?php } ?>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/lang/summernote-zh-TW.js"></script>
  <script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>  
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>