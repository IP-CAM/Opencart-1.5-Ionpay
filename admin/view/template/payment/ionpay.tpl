<?php echo $header; ?>
<div id="content">
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<table class="form">
					<tr>
						<td><?php echo $entry_env; ?></td>
						<td>
							<select name="ionpay_environment">
							<?php $options = array('development' => 'Sandbox', 'production' => 'Production') ?>
							<?php foreach ($options as $key => $value): ?>
								<option value="<?php echo $key ?>" <?php if ($key == $ionpay_environment) echo 'selected' ?> ><?php echo $value ?></option>
								<?php endforeach ?>
							</select>
						</td>
					</tr>
					<tr>
						<td><span class="required">*</span> <?php echo $entry_merchant; ?></td>
						<td><input type="text" name="ionpay_merchant" value="<?php echo $ionpay_merchant; ?>" />
							<?php if ($error_merchant) { ?>
							<span class="error"><?php echo $error_merchant; ?></span>
							<?php } ?></td>
					</tr>
					<tr>
						<td><span class="required">*</span> <?php echo $entry_security; ?></td>
						<td><input type="text" name="ionpay_security" value="<?php echo $ionpay_security; ?>" />
							<?php if ($error_security) { ?>
							<span class="error"><?php echo $error_security; ?></span>
							<?php } ?></td>
					</tr>

					<tr>
						<td><?php echo $entry_ionpay_rate; ?></td>
						<td><input type="text" name="ionpay_rate" value="<?php echo $ionpay_rate; ?>" />
							<?php /* if ($error_ionpay_rate) { ?>
							<span class="error"><?php echo $error_ionpay_rate; ?></span>
							<?php } */ ?></td>
					</tr>
					<tr>
						<td><?php echo $entry_invoice; ?></td>
						<td><input type="text" name="ionpay_inv_payment" value="<?php echo $ionpay_inv_payment; ?>" />
							<?php if ($error_inv_payment) { ?>
							<span class="error"><?php echo $error_inv_payment; ?></span>
							<?php } ?></td>
					</tr>
					<tr>
						<td><?php echo $entry_callback; ?></td>
						<td><label><?php echo $callback; ?></label></td>
					</tr>
					<tr>
						<td><?php echo $entry_order_status; ?></td>
						<td><select name="ionpay_order_status_id">
								<?php foreach ($order_statuses as $order_status) { ?>
								<?php if ($order_status['order_status_id'] == $ionpay_order_status_id) { ?>
								<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
								<?php } ?>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_order_success_status; ?></td>
						<td><select name="ionpay_success_status">
								<?php foreach ($order_statuses as $order_status) { ?>
								<?php if ($order_status['order_status_id'] == $ionpay_success_status) { ?>
								<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
								<?php } ?>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_geo_zone; ?></td>
						<td><select name="ionpay_geo_zone_id">
								<option value="0"><?php echo $text_all_zones; ?></option>
								<?php foreach ($geo_zones as $geo_zone) { ?>
								<?php if ($geo_zone['geo_zone_id'] == $ionpay_geo_zone_id) { ?>
								<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
								<?php } ?>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_status; ?></td>
						<td><select name="ionpay_status">
								<?php if ($ionpay_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select></td>
					</tr>
					<tr>
						<td><?php echo $entry_sort_order; ?></td>
						<td><input type="text" name="ionpay_sort_order" value="<?php echo $ionpay_sort_order; ?>" size="1" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?> 