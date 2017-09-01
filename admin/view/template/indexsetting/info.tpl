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
                <legend><?php echo $text_header; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label">聯絡電話</span></label>
                  <div class="col-sm-2">
                    <select name="bigshop_top_bar_contact_status" class="form-control">
                      <option value="0"<?php if($bigshop_top_bar_contact_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                      <option value="1"<?php if($bigshop_top_bar_contact_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                    </select>
                  </div>
                  <div class="col-sm-7">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                      <input class="form-control" type="text" name="bigshop_top_bar_contact[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_top_bar_contact[$language['language_id']]) ? $bigshop_top_bar_contact[$language['language_id']] : ''; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label">E-mail</span></label>
                  <div class="col-sm-2">
                    <select name="bigshop_top_bar_email_status" class="form-control">
                      <option value="0"<?php if($bigshop_top_bar_email_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                      <option value="1"<?php if($bigshop_top_bar_email_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                    </select>
                  </div>
                  <div class="col-sm-7">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                      <input class="form-control" type="text" name="bigshop_top_bar_email[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_top_bar_email[$language['language_id']]) ? $bigshop_top_bar_email[$language['language_id']] : ''; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>

              <fieldset>
                <legend>底部設定</legend>
                
                <div class="form-group">
                  <label class="col-sm-2 control-label" >地址</label>
                  <div class="col-sm-5">
                    <select class="form-control" name="bigshop_address_status">
                      <option value="0"<?php if($bigshop_address_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                      <option value="1"<?php if($bigshop_address_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                    </select>
                  </div>
                  <div class="col-sm-5">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                      <input class="form-control" type="text" name="bigshop_address[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_address[$language['language_id']]) ? $bigshop_address[$language['language_id']] : ''; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" >連絡電話</label>
                  <div class="col-sm-5">
                    <select class="form-control" name="bigshop_mobile_status">
                      <option value="0"<?php if($bigshop_mobile_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                      <option value="1"<?php if($bigshop_mobile_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                    </select>
                  </div>
                  <div class="col-sm-5">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                      <input class="form-control" type="text" name="bigshop_mobile[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_mobile[$language['language_id']]) ? $bigshop_mobile[$language['language_id']] : ''; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" >E-mail</label>
                  <div class="col-sm-5">
                    <select class="form-control" name="bigshop_email_status">
                      <option value="0"<?php if($bigshop_email_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                      <option value="1"<?php if($bigshop_email_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                    </select>
                  </div>
                  <div class="col-sm-5">
                    <?php foreach ($languages as $language) { ?>
                    <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                      <input class="form-control" type="text" name="bigshop_email[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_email[$language['language_id']]) ? $bigshop_email[$language['language_id']] : ''; ?>" />
                    </div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>

              <fieldset>
                <legend>商店特色</legend>
                <ul id="custom_feature_box" class="nav nav-tabs">
                  <li class="active"><a data-toggle="tab" href="#feature_box_1">Feature Box 1</a></li>
                  <li><a data-toggle="tab" href="#feature_box_2">Feature Box 2</a></li>
                  <li><a data-toggle="tab" href="#feature_box_3">Feature Box 3</a></li>
                </ul>
                <div class="tab-content">
                  <div id="feature_box_1" class="tab-pane active">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" ><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select class="form-control" name="bigshop_feature_box1_status">
                          <option value="0"<?php if($bigshop_feature_box1_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                          <option value="1"<?php if($bigshop_feature_box1_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" >標題</label>
                      <div class="col-sm-10">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                          <input class="form-control" type="text" name="bigshop_feature_box1_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_feature_box1_title[$language['language_id']]) ? $bigshop_feature_box1_title[$language['language_id']] : ''; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" >標題</label>
                      <div class="col-sm-10">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                          <input class="form-control" type="text" name="bigshop_feature_box1_subtitle[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_feature_box1_subtitle[$language['language_id']]) ? $bigshop_feature_box1_subtitle[$language['language_id']] : ''; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                  <div id="feature_box_2" class="tab-pane">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" ><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select class="form-control" name="bigshop_feature_box2_status">
                          <option value="0"<?php if($bigshop_feature_box2_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                          <option value="1"<?php if($bigshop_feature_box2_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" >標題</label>
                      <div class="col-sm-10">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                          <input class="form-control" type="text" name="bigshop_feature_box2_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_feature_box2_title[$language['language_id']]) ? $bigshop_feature_box2_title[$language['language_id']] : ''; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" >標題</label>
                      <div class="col-sm-10">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                          <input class="form-control" type="text" name="bigshop_feature_box2_subtitle[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_feature_box2_subtitle[$language['language_id']]) ? $bigshop_feature_box2_subtitle[$language['language_id']] : ''; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                  <div id="feature_box_3" class="tab-pane">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" ><?php echo $entry_status; ?></label>
                      <div class="col-sm-10">
                        <select class="form-control" name="bigshop_feature_box3_status">
                          <option value="0"<?php if($bigshop_feature_box3_status == '0') echo ' selected="selected"';?>><?php echo $text_disabled; ?></option>
                          <option value="1"<?php if($bigshop_feature_box3_status == '1') echo ' selected="selected"';?>><?php echo $text_enabled; ?></option>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" >標題</label>
                      <div class="col-sm-10">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                          <input class="form-control" type="text" name="bigshop_feature_box3_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_feature_box3_title[$language['language_id']]) ? $bigshop_feature_box3_title[$language['language_id']] : ''; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" >標題</label>
                      <div class="col-sm-10">
                        <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"> <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                          <input class="form-control" type="text" name="bigshop_feature_box3_subtitle[<?php echo $language['language_id']; ?>]" value="<?php echo isset($bigshop_feature_box3_subtitle[$language['language_id']]) ? $bigshop_feature_box3_subtitle[$language['language_id']] : ''; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                </div>
              </fieldset>
            

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