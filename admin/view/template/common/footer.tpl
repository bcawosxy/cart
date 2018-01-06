<script type="text/javascript">
function setLog(act, target, target_id) {
  <?php 
     parse_str($_SERVER['QUERY_STRING'], $query);
     $_token = empty($query['token']) ? '' : $query['token'];
  ?>
  var _token = "<?php echo $_token; ?>",
      url = 'index.php?route=common/log&token=' + _token + '&order_id=' + $('input[name=\'order_id\']').val();

  $.post(url, {
    act : act,
    target : target,
    target_id : target_id,
  }, function(r) {

  });
}
</script>
<footer id="footer"><?php echo $text_footer; ?><br /><?php echo $text_version; ?></footer></div>
</body></html>
