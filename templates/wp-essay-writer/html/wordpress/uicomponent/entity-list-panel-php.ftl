<?php
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }

    $view = $_REQUEST['page_info']['view'];
    $model = $view->get_model();
?>
<div class="card-body card-padding">
    <div class="row mg-btm-30">
        <div class="col-sm-12">
            <div class="body-section">
                <div id="success"></div>
              	<form id="<?php echo $model['entity_post_name']; ?>-list-form">
			        <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
			        <input type="hidden" name="submitted" id="submitted" value="true" /> 
			    </form>
			    <div class="table-responsive c-overflow">
			        <table id="<?php echo $model['entity_post_name']; ?>-table" class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
			            <thead>
			                <tr>
			                    <th>ID</th>
			                    <?php foreach ($model['entity_fields'] as $field_name => $field) { if($field['is_list_field']) { ?>
			                    <th><?php echo $field['description']; ?></th>
			                    <?php }} ?>
			                </tr>
			            </thead>
			            <tbody>
			            </tbody>
			            <tfoot>
			                <tr>
			                    <th>ID</th>
			                    <?php foreach ($model['entity_fields'] as $field_name => $field) { if($field['is_list_field']) { ?>
			                    <th><?php echo $field['description']; ?></th>
			                    <?php }} ?>
			                </tr>
			            </tfoot>
			        </table>
			    </div>
            </div>
        </div>
    </div>
</div>
      
  