<script>
var config = <?php echo $json_config; ?>;
if(typeof(ga) == "undefined")
   config.general.analytics_event = 0;
</script>
<style>
<?php echo $config['design']['custom_style']; ?>
<?php if($config['design']['only_quickcheckout']){ ?>
body > *{
	display: none
}
body > #d_quickcheckout{
	display: block;
} 
#d_quickcheckout.container #d_logo{
	margin: 20px 0px;
}
<?php } ?>
</style>
<div id="d_quickcheckout">
	<?php if($config['design']['only_quickcheckout']){ ?>
	<div id="d_logo" class="center-block text-center"></div>
	<?php } ?>
	<?php echo $field; ?>
	<div class="row">
		<div class="col-md-12"></div>
	</div>
	<div class="qc-col-0">
		<?php echo $login; ?>
		<?php echo $payment_address; ?>
		<?php echo $shipping_address; ?>
		<?php echo $shipping_method; ?>
		<?php echo $payment_method; ?>
		<?php echo $cart; ?>
		<?php echo $payment; ?>
		<?php echo $confirm; ?>
	</div>
	<div class="row">
		<div class="qc-col-1 col-md-<?php echo $config['design']['column_width'][1] ?>">
		</div>
		<div class="col-md-<?php echo $config['design']['column_width'][4] ?>">
			<div class="row">
				<div class="qc-col-2 col-md-<?php echo  ($config['design']['column_width'][4]) ? round(($config['design']['column_width'][2] / $config['design']['column_width'][4])*12) : 0;  ?>">
    			</div>
    			<div class="qc-col-3 col-md-<?php echo ($config['design']['column_width'][4]) ? 12 - round(($config['design']['column_width'][2] / $config['design']['column_width'][4])*12) : 0; ?>">
    			</div>
				<div class="qc-col-4 col-md-12">
				</div>
			</div>
		</div>
	</div>
</div>
<script>

function clearShippingList() {
	$('#shipping_method_list').find('div').remove();
}

function reBuildShippingList(payment_method) {
	$.post('<?php echo $payment2shippingUrl ;?>', {
		payment_method: payment_method,
	}, function(r) {
		for(var i in r[payment_method]) {
			var html = `<div class="radio-input radio">
					    <label for="${r[payment_method][i]['code']}">
					      <input type="radio" name="shipping_method" value="${r[payment_method][i]['code']}" id="${r[payment_method][i]['code']}" data-refresh="5" class="styled"> 
					    <span class="text">${r[payment_method][i]['title']}</span><span class="price">${r[payment_method][i]['text']}</span></label>
					</div>`;

			$('#shipping_method_list').append(html);
		}

		$('#shipping_method_list input[name="shipping_method"]:first').prop('checked', true).trigger('change');
	});
}

$(function() {
	$('.qc-step').each(function(){
		$(this).appendTo('.qc-col-' + $(this).attr('data-col'));	
	})
	$('.qc-step').tsort({attr:'data-row'});
	<?php if($config['design']['only_quickcheckout']){ ?>
		$('body').prepend($('#d_quickcheckout'));
		$('#d_quickcheckout').addClass('container')
		$('#d_quickcheckout #d_logo ').prepend($('header #logo').html())
	<?php } ?>
	<?php if(!$config['design']['breadcrumb']) { ?>
		$('.qc-breadcrumb').hide();
	<?php } ?>

	clearShippingList();
	reBuildShippingList($('input[name=payment_method]:checked').val());

})

$(document).on('change', 'input[name="payment_method"]', function(){
	clearShippingList();
	reBuildShippingList($(this).val());
})

</script>