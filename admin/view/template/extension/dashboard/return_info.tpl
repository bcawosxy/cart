<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $heading_title; ?></h3>
  </div>
  <div class="table-responsive">
    <table class="table">
      <thead>
        <tr>
          <td class="text-right"><?php echo $column_return_id; ?></td>
          <td><?php echo $column_order_id; ?></td>
          <td><?php echo $column_customer; ?></td>
          <td><?php echo $column_product; ?></td>
          <td><?php echo $column_status; ?></td>
          <td><?php echo $column_date_added; ?></td>
          <td class="text-right"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php if ($returns) { ?>
        <?php foreach ($returns as $return) { ?>
        <tr>
          <td class="text-right"><?php echo $return['return_id']; ?></td>
          <td><?php echo $return['order_id']; ?></td>
          <td><?php echo $return['customer']; ?></td>
          <td><?php echo $return['product']; ?></td>
          <td><?php echo $return['status']; ?></td>
          <td><?php echo $return['date_added']; ?></td>
          <td class="text-right"><a href="<?php echo $return['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
        </tr>
        <?php } ?>
        <?php } else { ?>
        <tr>
          <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
</div>
