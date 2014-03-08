<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="page-header">
    <div class="container">
      <div class="pull-right">
        <button type="submit" form="form-option" class="btn btn-success"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a></div>
      <h1><i class="fa fa-pencil-square fa-lg"></i> <?php echo $heading_title; ?></h1>
    </div>
  </div>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-option" class="form-horizontal">
    <div class="form-group required">
      <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
      <div class="col-sm-10">
        <?php foreach ($languages as $language) { ?>
        <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
          <input type="text" name="option_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_description[$language['language_id']]) ? $option_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
        </div>
        <?php if (isset($error_name[$language['language_id']])) { ?>
        <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
        <?php } ?>
        <?php } ?>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
      <div class="col-sm-10">
        <select name="type" id="input-type" class="form-control">
          <optgroup label="<?php echo $text_choose; ?>">
          <?php if ($type == 'select') { ?>
          <option value="select" selected="selected"><?php echo $text_select; ?></option>
          <?php } else { ?>
          <option value="select"><?php echo $text_select; ?></option>
          <?php } ?>
          <?php if ($type == 'radio') { ?>
          <option value="radio" selected="selected"><?php echo $text_radio; ?></option>
          <?php } else { ?>
          <option value="radio"><?php echo $text_radio; ?></option>
          <?php } ?>
          <?php if ($type == 'checkbox') { ?>
          <option value="checkbox" selected="selected"><?php echo $text_checkbox; ?></option>
          <?php } else { ?>
          <option value="checkbox"><?php echo $text_checkbox; ?></option>
          <?php } ?>
          <?php if ($type == 'image') { ?>
          <option value="image" selected="selected"><?php echo $text_image; ?></option>
          <?php } else { ?>
          <option value="image"><?php echo $text_image; ?></option>
          <?php } ?>
          </optgroup>
          <optgroup label="<?php echo $text_input; ?>">
          <?php if ($type == 'text') { ?>
          <option value="text" selected="selected"><?php echo $text_text; ?></option>
          <?php } else { ?>
          <option value="text"><?php echo $text_text; ?></option>
          <?php } ?>
          <?php if ($type == 'textarea') { ?>
          <option value="textarea" selected="selected"><?php echo $text_textarea; ?></option>
          <?php } else { ?>
          <option value="textarea"><?php echo $text_textarea; ?></option>
          <?php } ?>
          </optgroup>
          <optgroup label="<?php echo $text_file; ?>">
          <?php if ($type == 'file') { ?>
          <option value="file" selected="selected"><?php echo $text_file; ?></option>
          <?php } else { ?>
          <option value="file"><?php echo $text_file; ?></option>
          <?php } ?>
          </optgroup>
          <optgroup label="<?php echo $text_date; ?>">
          <?php if ($type == 'date') { ?>
          <option value="date" selected="selected"><?php echo $text_date; ?></option>
          <?php } else { ?>
          <option value="date"><?php echo $text_date; ?></option>
          <?php } ?>
          <?php if ($type == 'time') { ?>
          <option value="time" selected="selected"><?php echo $text_time; ?></option>
          <?php } else { ?>
          <option value="time"><?php echo $text_time; ?></option>
          <?php } ?>
          <?php if ($type == 'datetime') { ?>
          <option value="datetime" selected="selected"><?php echo $text_datetime; ?></option>
          <?php } else { ?>
          <option value="datetime"><?php echo $text_datetime; ?></option>
          <?php } ?>
          </optgroup>
        </select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
      <div class="col-sm-10">
        <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
      </div>
    </div>
    <table id="option-value" class="table table-striped table-bordered table-hover">
      <thead>
        <tr>
          <td class="text-left required"><?php echo $entry_option_value; ?></td>
          <td class="text-left"><?php echo $entry_image; ?></td>
          <td class="text-right"><?php echo $entry_sort_order; ?></td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <?php $option_value_row = 0; ?>
        <?php foreach ($option_values as $option_value) { ?>
        <tr id="option-value-row<?php echo $option_value_row; ?>">
          <td class="text-left"><input type="hidden" name="option_value[<?php echo $option_value_row; ?>][option_value_id]" value="<?php echo $option_value['option_value_id']; ?>" />
            <?php foreach ($languages as $language) { ?>
            <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
              <input type="text" name="option_value[<?php echo $option_value_row; ?>][option_value_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($option_value['option_value_description'][$language['language_id']]) ? $option_value['option_value_description'][$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_option_value; ?>" class="form-control" />
            </div>
            <?php if (isset($error_option_value[$option_value_row][$language['language_id']])) { ?>
            <div class="text-danger"><?php echo $error_option_value[$option_value_row][$language['language_id']]; ?></div>
            <?php } ?>
            <?php } ?></td>
          <td class="text-left"><?php if ($option_value['thumb']) { ?>
            <a href="" id="thumb-image<?php echo $option_value_row; ?>" class="img-thumbnail img-edit"><img src="<?php echo $option_value['thumb']; ?>" alt="" title="" /></a>
            <?php } else { ?>
            <a href="" id="thumb-image<?php echo $option_value_row; ?>" class="img-thumbnail img-edit"><i class="fa fa-camera fa-5x"></i></a>
            <?php } ?>
            <input type="hidden" name="option_value[<?php echo $option_value_row; ?>][image]" value="<?php echo $option_value['image']; ?>" id="input-image<?php echo $option_value_row; ?>" /></td>
          <td class="text-right"><input type="text" name="option_value[<?php echo $option_value_row; ?>][sort_order]" value="<?php echo $option_value['sort_order']; ?>" class="form-control" /></td>
          <td class="text-left"><button type="button" onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i> <?php echo $button_remove; ?></button></td>
        </tr>
        <?php $option_value_row++; ?>
        <?php } ?>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="3"></td>
          <td class="text-left"><button type="button" onclick="addOptionValue();" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_option_value_add; ?></button></td>
        </tr>
      </tfoot>
    </table>
  </form>
</div>
<script type="text/javascript"><!--
$('select[name=\'type\']').on('change', function() {
	if (this.value == 'select' || this.value == 'radio' || this.value == 'checkbox' || this.value == 'image') {
		$('#option-value').show();
	} else {
		$('#option-value').hide();
	}
});

$('select[name=\'type\']').trigger('change');

var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue() {
	html  = '<tr id="option-value-row' + option_value_row + '">';	
    html += '  <td class="text-left"><input type="hidden" name="option_value[' + option_value_row + '][option_value_id]" value="" />';
	<?php foreach ($languages as $language) { ?>
	html += '    <div class="input-group">';
	html += '      <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="option_value[' + option_value_row + '][option_value_description][<?php echo $language['language_id']; ?>][name]" value="" placeholder="<?php echo $entry_option_value; ?>" class="form-control" />';
    html += '    </div>';
	<?php } ?>
	html += '  </td>';
    html += '  <td class="text-left"><a href="" id="thumb-image' + option_value_row + '" class="img-thumbnail img-edit"><i class="fa fa-camera fa-5x"></i></a><input type="hidden" name="option_value[' + option_value_row + '][image]" value="" id="input-image' + option_value_row + '" /></td>';
	html += '  <td class="text-right"><input type="text" name="option_value[' + option_value_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="btn btn-danger"><i class="fa fa-minus-circle"></i> <?php echo $button_remove; ?></button></td>';
	html += '</tr>';	
	
	$('#option-value tbody').append(html);
	
	option_value_row++;
}
//--></script> 
<?php echo $footer; ?>