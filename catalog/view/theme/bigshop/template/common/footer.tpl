</div>

<?php $lang = (int)$config_language_id;?>
<?php if($bigshop_feature_box_per_row== 'pr1') { ?>
<?php $class_fbox = 'col-xs-12'; ?>
<?php } elseif($bigshop_feature_box_per_row == 'pr2') { ?>
<?php $class_fbox = 'col-sm-6 col-xs-12'; ?>
<?php } elseif($bigshop_feature_box_per_row == 'pr3') { ?>
<?php $class_fbox = 'col-sm-4 col-xs-12'; ?>
<?php } elseif($bigshop_feature_box_per_row == 'pr4') { ?>
<?php $class_fbox = 'col-md-3 col-sm-6 col-xs-12'; ?>
<?php } ?>
<?php if(($bigshop_feature_box_homepage_only == 1) && (isset($ishome)) || ($bigshop_feature_box_homepage_only == 2)) { ?>
<?php if($bigshop_feature_box_show_header_footer == 2) {

if((isset($bigshop_feature_box1_title[$lang]) && $bigshop_feature_box1_title[$lang] != '') || (isset($bigshop_feature_box1_subtitle[$lang]) && $bigshop_feature_box1_subtitle[$lang] != '') || (isset($bigshop_feature_box2_title[$lang]) && $bigshop_feature_box2_title[$lang] != '') || (isset($bigshop_feature_box2_subtitle[$lang]) && $bigshop_feature_box2_subtitle[$lang] != '') || (isset($bigshop_feature_box3_title[$lang]) && $bigshop_feature_box3_title[$lang] != '') || (isset($bigshop_feature_box3_subtitle[$lang]) && $bigshop_feature_box3_subtitle[$lang] != '') || (isset($bigshop_feature_box4_title[$lang]) && $bigshop_feature_box4_title[$lang] != '') || (isset($bigshop_feature_box4_subtitle[$lang]) && $bigshop_feature_box4_subtitle[$lang] != '')) { ?>
<div class="container">
  <div class="custom-feature-box row">
    <?php if($bigshop_feature_box1_status == 1) { if((isset($bigshop_feature_box1_title[$lang]) && $bigshop_feature_box1_title[$lang] != '') || (isset($bigshop_feature_box1_subtitle[$lang]) && $bigshop_feature_box1_subtitle[$lang] != '')) { ?>
    <div class="<?php echo $class_fbox; ?>">
      <div class="feature-box fbox_1">
        <div class="title"><?php echo $bigshop_feature_box1_title[$lang]; ?></div>
        <p><?php echo $bigshop_feature_box1_subtitle[$lang]; ?></p>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php if($bigshop_feature_box2_status == 1) { if((isset($bigshop_feature_box2_title[$lang]) && $bigshop_feature_box2_title[$lang] != '') || (isset($bigshop_feature_box2_subtitle[$lang]) && $bigshop_feature_box2_subtitle[$lang] != '')) { ?>
    <div class="<?php echo $class_fbox; ?>">
      <div class="feature-box fbox_2">
        <div class="title"><?php echo $bigshop_feature_box2_title[$lang]; ?></div>
        <p><?php echo $bigshop_feature_box2_subtitle[$lang]; ?></p>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php if($bigshop_feature_box3_status == 1) { if((isset($bigshop_feature_box3_title[$lang]) && $bigshop_feature_box3_title[$lang] != '') || (isset($bigshop_feature_box3_subtitle[$lang]) && $bigshop_feature_box3_subtitle[$lang] != '')) { ?>
    <div class="<?php echo $class_fbox; ?>">
      <div class="feature-box fbox_3">
        <div class="title"><?php echo $bigshop_feature_box3_title[$lang]; ?></div>
        <p><?php echo $bigshop_feature_box3_subtitle[$lang]; ?></p>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
    <?php if($bigshop_feature_box4_status == 1) { if((isset($bigshop_feature_box4_title[$lang]) && $bigshop_feature_box4_title[$lang] != '') || (isset($bigshop_feature_box4_subtitle[$lang]) && $bigshop_feature_box4_subtitle[$lang] != '')) { ?>
    <div class="<?php echo $class_fbox; ?>">
      <div class="feature-box fbox_4">
        <div class="title"><?php echo $bigshop_feature_box4_title[$lang]; ?></div>
        <p><?php echo $bigshop_feature_box4_subtitle[$lang]; ?></p>
      </div>
    </div>
    <?php } ?>
    <?php } ?>
  </div>
</div>
<?php } ?>
<?php } ?>
<?php } ?>

<footer id="footer">
  <div class="fpart-first">
    <div class="container">
      <div class="row">
        <?php if ($informations) { ?>
        <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
          <h5><?php echo $text_information; ?></h5>
          <ul>
            <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
        <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
          <h5><?php echo $text_service; ?></h5>
          <ul>
            <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
            <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          </ul>
        </div>
        <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
          <h5><?php echo $text_extra; ?></h5>
          <ul>
            <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
            <!-- <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li> -->
            <?php if($bigshop_affiliate_status == 1) { ?>
            <!-- <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>-->
            <?php } ?>
            <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
          </ul>
        </div>
        <div class="column col-lg-2 col-md-2 col-sm-3 col-xs-12">
          <h5><?php echo $text_account; ?></h5>
          <ul>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
            <!-- <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>-->
          </ul>
        </div>
        <?php if($bigshop_about_contact_details == 1) {

if((isset($bigshop_address[$lang]) && $bigshop_address[$lang] != '') || (isset($bigshop_contact[$lang]) && $bigshop_contact[$lang] != '') || (isset($bigshop_mobile[$lang]) && $bigshop_mobile[$lang] != '') || (isset($bigshop_email[$lang]) && $bigshop_email[$lang] != '')) { ?>
        <div class="contact col-lg-4 col-md-4 col-sm-12 col-xs-12">
          <?php if($bigshop_contact_status == 1) { if(isset($bigshop_contact[$lang]) && $bigshop_contact[$lang] != '') { ?>
          <h5><?php echo $bigshop_contact[$lang]; ?></h5>
          <?php } ?>
          <?php } ?>
          <?php if($bigshop_address_status == 1 || $bigshop_mobile_status == 1 || $bigshop_email_status == 1) { ?>
          <ul>
            <?php if($bigshop_address_status == 1) { if(isset($bigshop_address[$lang]) && $bigshop_address[$lang] != '') { ?>
            <li class="address"><i class="fa fa-map-marker"></i><?php echo $bigshop_address[$lang]; ?></li>
            <?php } ?>
            <?php } ?>
            <?php if($bigshop_mobile_status == 1) { if(isset($bigshop_mobile[$lang]) && $bigshop_mobile[$lang] != '') { ?>
            <li class="mobile"><i class="fa fa-phone"></i><?php echo $bigshop_mobile[$lang]; ?></li>
            <?php } ?>
            <?php } ?>
            <?php if($bigshop_email_status == 1) { if(isset($bigshop_email[$lang]) && $bigshop_email[$lang] != '') { ?>
            <li class="email"><i class="fa fa-envelope"></i><a href="mailto:<?php echo $bigshop_email[$lang]; ?>"><?php echo $bigshop_email[$lang]; ?></a>
              <?php } ?>
              <?php } ?>
          </ul>
          <?php } ?>
        </div>
        <?php } ?>
        <?php } ?>
        <?php if($bigshop_about_contact_details == 0) {

if((isset($bigshop_contact[$lang]) && $bigshop_contact[$lang] != '') || (isset($bigshop_about_details[$lang]['description']) && $bigshop_about_details[$lang]['description'] != '')) { ?>
        <div class="about_details col-lg-4 col-md-4 col-sm-12 col-xs-12">
          <?php if($bigshop_contact_status == 1) { if(isset($bigshop_contact[$lang]) && $bigshop_contact[$lang] != '') { ?>
          <h5><?php echo $bigshop_contact[$lang]; ?></h5>
          <?php } ?>
          <?php } ?>
            <?php echo html_entity_decode($bigshop_about_details[$lang]['description'], ENT_QUOTES, 'UTF-8'); ?>
        </div>
        <?php } ?>
        <?php } ?>
      </div>
    </div>
  </div>
  <div class="fpart-second">
    <div class="container">
      <div id="powered" class="clearfix">
        <div class="row">
          <div class="col-md-4">
            <?php if($bigshop_custom_payment_image_status != '' || $bigshop_paypal != '' || $bigshop_american != '' || $bigshop_2checkout != '' || $bigshop_discover != '' || $bigshop_maestro != '' || $bigshop_mastercard != '' || $bigshop_sagepay != '' || $bigshop_visa != '' || $bigshop_moneybookers != '' || $bigshop_cirrus != '' || $bigshop_delta != '' || $bigshop_direct != '' || $bigshop_google != '' || $bigshop_western_union != '' || $bigshop_ebay != '' || $bigshop_solo != '' || $bigshop_switch != '') { ?>
            <div class="payments_types">
              <?php if ($bigshop_custom_payment_image_status != '') { ?>
              <?php if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') {
	        $path_image = $config_ssl . 'image/';
        } else {
        	$path_image = $config_url . 'image/';
        }
        if ($bigshop_custom_payment_image != ''){ ?>
              <?php if($bigshop_custom_payment_image_url != ''): ?>
              <a href="<?php echo $bigshop_custom_payment_image_url; ?>" target="_blank"> <img src="<?php echo $path_image . $bigshop_custom_payment_image ?>" alt="Payment" title="Payment"></a>
              <?php else: ?>
              <img src="<?php echo $path_image . $bigshop_custom_payment_image ?>" alt="Payment" title="Payment">
              <?php endif; ?>
              <?php } ?>
              <?php } ?>
              <?php if ($bigshop_paypal != '') { ?>
              <?php if($bigshop_paypal_url != ''): ?>
              <a href="<?php echo $bigshop_paypal_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_paypal.png" alt="paypal" title="PayPal"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_paypal.png" alt="paypal" title="PayPal">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_american != '') { ?>
              <?php if($bigshop_american_url != ''): ?>
              <a href="<?php echo $bigshop_american_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_american.png" alt="american-express" title="American Express"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_american.png" alt="american-express" title="American Express">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_2checkout != '') { ?>
              <?php if($bigshop_2checkout_url != ''): ?>
              <a href="<?php echo $bigshop_2checkout_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_2checkout.png" alt="2checkout" title="2checkout"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_2checkout.png" alt="2checkout" title="2checkout">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_maestro != '') { ?>
              <?php if($bigshop_maestro_url != ''): ?>
              <a href="<?php echo $bigshop_maestro_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_maestro.png" alt="maestro" title="Maestro"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_maestro.png" alt="maestro" title="Maestro">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_discover != '') { ?>
              <?php if($bigshop_discover_url != ''): ?>
              <a href="<?php echo $bigshop_discover_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_discover.png" alt="discover" title="Discover"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_discover.png" alt="discover" title="Discover">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_mastercard != '') { ?>
              <?php if($bigshop_mastercard_url != ''): ?>
              <a href="<?php echo $bigshop_mastercard_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_mastercard.png" alt="mastercard" title="MasterCard"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_mastercard.png" alt="mastercard" title="MasterCard">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_visa != '') { ?>
              <?php if($bigshop_visa_url != ''): ?>
              <a href="<?php echo $bigshop_visa_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_visa.png" alt="visa" title="Visa"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_visa.png" alt="visa" title="Visa">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_sagepay != '') { ?>
              <?php if($bigshop_sagepay_url != ''): ?>
              <a href="<?php echo $bigshop_sagepay_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_sagepay.png" alt="sagepay" title="sagepay"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_sagepay.png" alt="sagepay" title="sagepay">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_moneybookers != '') { ?>
              <?php if($bigshop_moneybookers_url != ''): ?>
              <a href="<?php echo $bigshop_moneybookers_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_moneybookers.png" alt="moneybookers" title="Moneybookers"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_moneybookers.png" alt="moneybookers" title="Moneybookers">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_cirrus != '') { ?>
              <?php if($bigshop_cirrus_url != ''): ?>
              <a href="<?php echo $bigshop_cirrus_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_cirrus.png" alt="cirrus" title="Cirrus"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_cirrus.png" alt="cirrus" title="Cirrus">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_delta != '') { ?>
              <?php if($bigshop_delta_url != ''): ?>
              <a href="<?php echo $bigshop_delta_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_delta.png" alt="delta" title="Delta"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_delta.png" alt="delta" title="Delta">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_direct != '') { ?>
              <?php if($bigshop_direct_url != ''): ?>
              <a href="<?php echo $bigshop_direct_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_direct.png" alt="direct" title="direct"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_direct.png" alt="direct" title="direct">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_google != '') { ?>
              <?php if($bigshop_google_url != ''): ?>
              <a href="<?php echo $bigshop_google_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_google.png" alt="google" title="google"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_google.png" alt="google" title="google">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_solo != '') { ?>
              <?php if($bigshop_solo_url != ''): ?>
              <a href="<?php echo $bigshop_solo_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_solo.png" alt="solo" title="solo"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_solo.png" alt="solo" title="solo">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_switch != '') { ?>
              <?php if($bigshop_switch_url != ''): ?>
              <a href="<?php echo $bigshop_switch_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_switch.png" alt="switch" title="switch"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_switch.png" alt="switch" title="switch">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_western_union != '') { ?>
              <?php if($bigshop_western_union_url != ''): ?>
              <a href="<?php echo $bigshop_western_union_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_western_union.png" alt="western_union" title="western union"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_western_union.png" alt="western_union" title="western union">
              <?php endif; ?>
              <?php } ?>
              <?php if ($bigshop_ebay != '') { ?>
              <?php if($bigshop_ebay_url != ''): ?>
              <a href="<?php echo $bigshop_ebay_url; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_ebay.png" alt="ebay" title="ebay"></a>
              <?php else: ?>
              <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/payment_ebay.png" alt="ebay" title="ebay">
              <?php endif; ?>
              <?php } ?>
            </div>
            <?php } ?>
          </div>
          <div class="powered_text pull-left flip col-md-4">
          <?php if(isset($bigshop_powered[$lang]['description']) && $bigshop_powered[$lang]['description']!=""){?>
            <?php echo html_entity_decode($bigshop_powered[$lang]['description'], ENT_QUOTES, 'UTF-8'); ?>
          <?php } ?>
          </div>
          <div class="col-md-4">
            <?php if($bigshop_facebook_id != '' || $bigshop_twitter_username != '' || $bigshop_gplus_id != '' || $bigshop_pint_id != '' || $bigshop_rss != '' || $bigshop_blogger != '' || $bigshop_myspace != '' || $bigshop_linkedin != '' || $bigshop_evernote != '' || $bigshop_dopplr != '' || $bigshop_ember != '' || $bigshop_flickr != '' || $bigshop_picasa_web != '' || $bigshop_youtube != '' || $bigshop_technorati != '' || $bigshop_grooveshark != '' || $bigshop_vimeo != '' || $bigshop_sharethis != '' || $bigshop_yahoobuzz != '' || $bigshop_viddler != '' || $bigshop_skype != '' || $bigshop_google_googletalk != '' || $bigshop_digg != '' || $bigshop_reddit != '' || $bigshop_delicious != '' || $bigshop_stumbleupon != '' || $bigshop_friendfeed != '' || $bigshop_tumblr != '' || $bigshop_yelp != '' || $bigshop_posterous != '' || $bigshop_bebo != '' || $bigshop_virb != '' || $bigshop_last_fm != '' || $bigshop_pandora != '' || $bigshop_mixx != '' || $bigshop_newsvine != '' || $bigshop_openid != '' || $bigshop_readernaut != '' || $bigshop_xing_me != '' || $bigshop_instagram != '' || $bigshop_spotify != '' || $bigshop_forrst != '' || $bigshop_viadeo != '' || $bigshop_vk_com != '') { ?>
            <div class="social pull-right flip">
              <?php if($bigshop_facebook_id != '') { ?>
              <a href="<?php echo $bigshop_facebook_id; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/facebook.png" alt="Facebook" title="Facebook"></a>
              <?php } ?>
              <?php if($bigshop_twitter_username != '') { ?>
              <a href="<?php echo $bigshop_twitter_username; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/twitter.png" alt="Twitter" title="Twitter"> </a>
              <?php } ?>
              <?php if($bigshop_gplus_id != '') { ?>
              <a href="<?php echo $bigshop_gplus_id; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/google_plus.png" alt="Google+" title="Google+"> </a>
              <?php } ?>
              <?php if($bigshop_pint_id != '') { ?>
              <a href="<?php echo $bigshop_pint_id; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/pinterest.png" alt="Pinterest" title="Pinterest"> </a>
              <?php } ?>
              <?php if($bigshop_rss != '') { ?>
              <a href="<?php echo $bigshop_rss; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/rss.png" alt="RSS" title="RSS"> </a>
              <?php } ?>
              <?php if($bigshop_blogger != '') { ?>
              <a href="<?php echo $bigshop_blogger; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/blogger.png" alt="Blogger" title="Blogger"> </a>
              <?php } ?>
              <?php if($bigshop_myspace != '') { ?>
              <a href="<?php echo $bigshop_myspace; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/myspace.png" alt="myspace" title="MySpace"> </a>
              <?php } ?>
              <?php if($bigshop_linkedin != '') { ?>
              <a href="<?php echo $bigshop_linkedin; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/linkedin.png" alt="linkedin" title="LinkedIn"> </a>
              <?php } ?>
              <?php if($bigshop_evernote != '') { ?>
              <a href="<?php echo $bigshop_evernote; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/evernote.png" alt="evernote" title="evernote"> </a>
              <?php } ?>
              <?php if($bigshop_dopplr != '') { ?>
              <a href="<?php echo $bigshop_dopplr; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/dopplr.png" alt="dopplr" title="dopplr"> </a>
              <?php } ?>
              <?php if($bigshop_ember != '') { ?>
              <a href="<?php echo $bigshop_ember; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/ember.png" alt="ember" title="ember"> </a>
              <?php } ?>
              <?php if($bigshop_flickr != '') { ?>
              <a href="<?php echo $bigshop_flickr; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/flickr.png" alt="flickr" title="Flickr"> </a>
              <?php } ?>
              <?php if($bigshop_picasa_web != '') { ?>
              <a href="<?php echo $bigshop_picasa_web; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/picasa.png" alt="picasa" title="Picasa"> </a>
              <?php } ?>
              <?php if($bigshop_youtube != '') { ?>
              <a href="<?php echo $bigshop_youtube; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/youtube.png" alt="YouTube" title="YouTube"> </a>
              <?php } ?>
              <?php if($bigshop_technorati != '') { ?>
              <a href="<?php echo $bigshop_technorati; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/technorati.png" alt="technorati" title="technorati"> </a>
              <?php } ?>
              <?php if($bigshop_grooveshark != '') { ?>
              <a href="<?php echo $bigshop_grooveshark; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/grooveshark.png" alt="grooveshark" title="grooveshark"> </a>
              <?php } ?>
              <?php if($bigshop_vimeo != '') { ?>
              <a href="<?php echo $bigshop_vimeo; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/vimeo.png" alt="Vimeo" title="Vimeo"> </a>
              <?php } ?>
              <?php if($bigshop_sharethis != '') { ?>
              <a href="<?php echo $bigshop_sharethis; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/sharethis.png" alt="sharethis" title="ShareThis"> </a>
              <?php } ?>
              <?php if($bigshop_yahoobuzz != '') { ?>
              <a href="<?php echo $bigshop_yahoobuzz; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/yahoobuzz.png" alt="yahoobuzz" title="yahoobuzz"> </a>
              <?php } ?>
              <?php if($bigshop_viddler != '') { ?>
              <a href="<?php echo $bigshop_viddler; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/viddler.png" alt="viddler" title="viddler"> </a>
              <?php } ?>
              <?php if($bigshop_skype != '') { ?>
              <a href="<?php echo $bigshop_skype; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/skype.png" alt="skype" title="Skype"> </a>
              <?php } ?>
              <?php if($bigshop_google_googletalk != '') { ?>
              <a href="<?php echo $bigshop_google_googletalk; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/googletalk.png" alt="googletalk" title="Google googletalk"> </a>
              <?php } ?>
              <?php if($bigshop_digg != '') { ?>
              <a href="<?php echo $bigshop_digg; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/digg.png" alt="digg" title="Digg"> </a>
              <?php } ?>
              <?php if($bigshop_reddit != '') { ?>
              <a href="<?php echo $bigshop_reddit; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/reddit.png" alt="reddit" title="Reddit"> </a>
              <?php } ?>
              <?php if($bigshop_delicious != '') { ?>
              <a href="<?php echo $bigshop_delicious; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/delicious.png" alt="delicious" title="Delicious"> </a>
              <?php } ?>
              <?php if($bigshop_stumbleupon != '') { ?>
              <a href="<?php echo $bigshop_stumbleupon; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/stumbleupon.png" alt="stumbleupon" title="StumbleUpon"> </a>
              <?php } ?>
              <?php if($bigshop_friendfeed != '') { ?>
              <a href="<?php echo $bigshop_friendfeed; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/friendfeed.png" alt="friendfeed" title="FriendFeed"> </a>
              <?php } ?>
              <?php if($bigshop_tumblr != '') { ?>
              <a href="<?php echo $bigshop_tumblr; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/tumblr.png" alt="tumblr" title="Tumblr"> </a>
              <?php } ?>
              <?php if($bigshop_yelp != '') { ?>
              <a href="<?php echo $bigshop_yelp; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/yelp.png" alt="yelp" title="Yelp"> </a>
              <?php } ?>
              <?php if($bigshop_posterous != '') { ?>
              <a href="<?php echo $bigshop_posterous; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/posterous.png" alt="posterous" title="posterous"> </a>
              <?php } ?>
              <?php if($bigshop_bebo != '') { ?>
              <a href="<?php echo $bigshop_bebo; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/bebo.png" alt="bebo" title="Bebo"> </a>
              <?php } ?>
              <?php if($bigshop_virb != '') { ?>
              <a href="<?php echo $bigshop_virb; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/virb.png" alt="virb" title="virb"> </a>
              <?php } ?>
              <?php if($bigshop_last_fm != '') { ?>
              <a href="<?php echo $bigshop_last_fm; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/lastfm.png" alt="lastfm" title="Last.fm"> </a>
              <?php } ?>
              <?php if($bigshop_pandora != '') { ?>
              <a href="<?php echo $bigshop_pandora; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/pandora.png" alt="pandora" title="pandora"> </a>
              <?php } ?>
              <?php if($bigshop_mixx != '') { ?>
              <a href="<?php echo $bigshop_mixx; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/mixx.png" alt="mixx" title="mixx"> </a>
              <?php } ?>
              <?php if($bigshop_newsvine != '') { ?>
              <a href="<?php echo $bigshop_newsvine; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/newsvine.png" alt="newsvine" title="Newsvine"> </a>
              <?php } ?>
              <?php if($bigshop_openid != '') { ?>
              <a href="<?php echo $bigshop_openid; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/openid.png" alt="openid" title="openid"> </a>
              <?php } ?>
              <?php if($bigshop_readernaut != '') { ?>
              <a href="<?php echo $bigshop_readernaut; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/readernaut.png" alt="readernaut" title="readernaut"> </a>
              <?php } ?>
              <?php if($bigshop_xing_me != '') { ?>
              <a href="<?php echo $bigshop_xing_me; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/xing.png" alt="xing" title="xing.me"> </a>
              <?php } ?>
              <?php if($bigshop_instagram != '') { ?>
              <a href="<?php echo $bigshop_instagram; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/instagram.png" alt="instagram" title="Instagram"> </a>
              <?php } ?>
              <?php if($bigshop_spotify != '') { ?>
              <a href="<?php echo $bigshop_spotify; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/spotify.png" alt="spotify" title="Spotify"> </a>
              <?php } ?>
              <?php if($bigshop_forrst != '') { ?>
              <a href="<?php echo $bigshop_forrst; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/forrst.png" alt="forrst" title="Forrst"> </a>
              <?php } ?>
              <?php if($bigshop_viadeo != '') { ?>
              <a href="<?php echo $bigshop_viadeo; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/viadeo.png" alt="viadeo" title="Viadeo"> </a>
              <?php } ?>
              <?php if($bigshop_vk_com != '') { ?>
              <a href="<?php echo $bigshop_vk_com; ?>" target="_blank"> <img data-toggle="tooltip" src="catalog/view/theme/bigshop/image/socialicons/vk.png" alt="vk" title="VK.com"> </a>
              <?php } ?>
            </div>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php if($bigshop_custom_column_footer_status == 1) {    
 	if(isset($bigshop_custom_column_footer[$lang]['description']) && $bigshop_custom_column_footer[$lang]['description']!=""){?>
      <div class="custom-text">
        <?php echo html_entity_decode($bigshop_custom_column_footer[$lang]['description'], ENT_QUOTES, 'UTF-8'); ?>
      </div>
      <?php } ?>
      <?php } ?>
    </div>
  </div>
  <?php if($bigshop_back_to_top == 1) { ?>
  <div id="back-top"><a data-toggle="tooltip" title="Back to Top" href="javascript:void(0)" class="backtotop"><i class="fa fa-chevron-up"></i></a></div>
  <?php } ?>
</footer>
<?php if($bigshop_facebook_block_status == 1) { ?>
<div id="facebook" class="<?php if($bigshop_facebook_box_align == 1){ ?>fb-left<?php } ?><?php if($bigshop_facebook_box_align == 2){ ?>fb-right<?php } ?>" style="<?php if($bigshop_facebook_block_sort_order == 1){ ?>top:210px; z-index:10000;<?php } ?><?php if($bigshop_facebook_block_sort_order == 2){ ?>top:255px; z-index:9999;<?php } ?><?php if($bigshop_facebook_block_sort_order == 3){ ?>top:300px; z-index:9998;<?php } ?><?php if($bigshop_facebook_block_sort_order == 4){ ?>top:345px; z-index:9997;<?php } ?>">
  <div id="facebook_icon"><i class="fa fa-facebook"></i></div>
  <div class="fb-page" data-href="<?php echo $bigshop_facebook_id_box ; ?>" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="true" data-show-posts="false">
  </div>
  <div id="fb-root"></div>
  <script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
  <?php if($bigshop_facebook_box_align == 1){ ?>
  <script>
$(function(){        
        $("#facebook.fb-left").hover(function(){            
        $("#facebook.fb-left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $("#facebook.fb-left").stop(true, false).animate({left: "-241px" }, 800, 'easeInQuint' );        
        },1000);    
  });
	  </script>
  <?php } else { ?>
  <script>
	  $(function(){        
        $("#facebook.fb-right").hover(function(){            
        $("#facebook.fb-right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $("#facebook.fb-right").stop(true, false).animate({right: "-241px" }, 800, 'easeInQuint' );        
        },1000);    
  });
  </script>
  <?php } ?>
</div>
<?php } ?>
<?php if($bigshop_twitter_block_status == 1) { ?>
<div id="twitter_footer" class="<?php if($bigshop_twitter_box_align == 1){ ?>twit-left<?php } ?><?php if($bigshop_twitter_box_align == 2){ ?>twit-right<?php } ?>" style="<?php if($bigshop_twitter_block_sort_order == 1){ ?>top:210px; z-index:10000;<?php } ?><?php if($bigshop_twitter_block_sort_order == 2){ ?>top:255px; z-index:9999;<?php } ?><?php if($bigshop_twitter_block_sort_order == 3){ ?>top:300px; z-index:9998;<?php } ?><?php if($bigshop_twitter_block_sort_order == 4){ ?>top:345px; z-index:9997;<?php } ?>">
  <div class="twitter_icon"><i class="fa fa-twitter"></i></div>
  <a class="twitter-timeline" href="https://twitter.com/<?php echo $twitter_username ; ?>" data-chrome="nofooter noscrollbar transparent" data-theme="light" data-tweet-limit="2" data-related="twitterapi,twitter" data-aria-polite="assertive" data-widget-id="<?php echo $bigshop_widget_id; ?>">Tweets by @<?php echo $twitter_username; ?></a>
  <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>
<?php if($bigshop_twitter_box_align == 1){ ?>
<script>
$(function(){        
        $("#twitter_footer.twit-left").hover(function(){            
        $("#twitter_footer.twit-left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $("#twitter_footer.twit-left").stop(true, false).animate({left: "-215px" }, 800, 'easeInQuint' );        
        },1000);    
  });  
	  </script>
<?php } else { ?>
<script>
	  $(function(){        
        $("#twitter_footer.twit-right").hover(function(){            
        $("#twitter_footer.twit-right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $("#twitter_footer.twit-right").stop(true, false).animate({right: "-215px" }, 800, 'easeInQuint' );        
        },1000);    
  });
  </script>
<?php } ?>
<?php } ?>
<?php if($bigshop_video_box_status == 1){ ?>
<div id="video_box" class="<?php if($bigshop_video_box_align == 1){ ?>vb-left<?php } ?><?php if($bigshop_video_box_align == 2){ ?>vb-right<?php } ?>" style="<?php if($bigshop_video_box_sort_order == 1){ ?>top:210px; z-index:10000;<?php } ?><?php if($bigshop_video_box_sort_order == 2){ ?>top:255px; z-index:9999;<?php } ?><?php if($bigshop_video_box_sort_order == 3){ ?>top:300px; z-index:9998;<?php } ?><?php if($bigshop_video_box_sort_order == 4){ ?>top:345px; z-index:9997;<?php } ?>">
  <div id="video_box_icon"><i class="fa fa-play"></i></div>
  <?php if(isset($bigshop_video_box_content[$lang]['description']) && $bigshop_video_box_content[$lang]['description']!=""){?>
                      <?php echo html_entity_decode($bigshop_video_box_content[$lang]['description'], ENT_QUOTES, 'UTF-8'); ?>
                      <?php } ?>
</div>
<?php if($bigshop_video_box_align== 1){ ?>
<script>
  $(function(){        
        $("#video_box.vb-left").hover(function(){            
        $("#video_box.vb-left").stop(true, false).animate({left: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $("#video_box.vb-left").stop(true, false).animate({left: "-560px" }, 800, 'easeInQuint' );        
        },1000);    
  });
	  </script>
<?php } else { ?>
<script>
	  $(function(){        
        $("#video_box.vb-right").hover(function(){            
        $("#video_box.vb-right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $("#video_box.vb-right").stop(true, false).animate({right: "-560px" }, 800, 'easeInQuint' );        
        },1000);    
  });
	  </script>
<?php } ?>
<?php } ?>
<?php if($bigshop_custom_column_status == 1) {    
 	if((isset($bigshop_custom_column[$lang]['description']) && $bigshop_custom_column[$lang]['description'] != '') || (isset($bigshop_custom_side_block_align[$lang]) && $bigshop_custom_side_block_align[$lang] != '')) { ?>
<div id="custom_side_block" class="<?php if($bigshop_custom_side_block_align == 1){ ?>custom_side_block_left<?php } ?><?php if($bigshop_custom_side_block_align == 2){ ?>custom_side_block_right<?php } ?>" style="<?php if($bigshop_custom_side_block_sort_order == 1){ ?>top:210px; z-index:10000;<?php } ?><?php if($bigshop_custom_side_block_sort_order == 2){ ?>top:255px; z-index:9999;<?php } ?><?php if($bigshop_custom_side_block_sort_order == 3){ ?>top:300px; z-index:9998;<?php } ?><?php if($bigshop_custom_side_block_sort_order == 4){ ?>top:345px; z-index:9997;<?php } ?>">
  <div class="custom_side_block_icon">
    <?php if($bigshop_custom_side_block_align == 1){ ?>
    <i class="fa fa-chevron-right"></i>
    <?php } else { ?>
    <i class="fa fa-chevron-left"></i>
    <?php } ?>
  </div>
<?php echo html_entity_decode($bigshop_custom_column[$lang]['description'], ENT_QUOTES, 'UTF-8'); ?>
</div>
<?php if($bigshop_custom_side_block_align == 1){ ?>
<script>
$(function(){        
        $('#custom_side_block.custom_side_block_left').hover(function(){            
        $('#custom_side_block.custom_side_block_left').stop(true, false).animate({left: '0' }, 800, 'easeOutQuint' );        
        },
  function(){            
        $('#custom_side_block.custom_side_block_left').stop(true, false).animate({left: '-215px' }, 800, 'easeInQuint' );        
        },1000);    
  });  
	  </script>
<?php } else { ?>
<script>
$(function(){        
        $("#custom_side_block.custom_side_block_right").hover(function(){            
        $("#custom_side_block.custom_side_block_right").stop(true, false).animate({right: "0" }, 800, 'easeOutQuint' );        
        },
  function(){            
        $("#custom_side_block.custom_side_block_right").stop(true, false).animate({right: "-215px" }, 800, 'easeInQuint' );        
        },1000);    
  });
  </script>
<?php } ?>
<?php } ?>
<?php } ?>
</section>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-584535d7ef0586d2"></script> 
</body></html>