<?php
    /*
     */
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }

    $view = $_REQUEST['page_info']['view'];
    $model = $view->get_model();

?>
    <ul class="tab-nav tn-justified tn-icon" role="tablist">
        <li role="presentation" class="active">
            <a class="col-sx-4" href="#tab-0" aria-controls="tab-0" role="tab" data-toggle="tab">
                <?php echo $model['entity_description']; ?>
            </a>
        </li>

        <?php 
            $count = 1;
            foreach ($model['related_child_entities'] as $related_child_entities) { ?>

        <li role="presentation">
            <a class="col-xs-4" 
                href="#tab-<?php echo $count; ?>" 
                aria-controls="tab-<?php echo $count; ?>" role="tab" data-toggle="tab">
                <?php echo $related_child_entities['entity_description']; $count++; ?>
            </a>
        </li>
        
        <?php } ?>
    </ul>

    <div class="tab-content p-20">
        <div role="tabpanel" class="tab-pane animated fadeIn in active" id="tab-a">
            <div id="success"></div>
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                    <tbody>
                        <tr>
                        <?php 
                            foreach ($model['entity_fields'] as $field_name => $field) { 
                                if($field['is_view_field']) {  ?>
                            <th><?php echo $field['description']; ?></th>
                        <?php   
                                }
                            } ?>
                        </tr>

                        <tr>
                        <?php 
                            foreach ($model['entity_fields'] as $field_name => $field) { 
                                if($field['is_view_field'] && !$field['is_relationship_field']) {  ?>
                            <td><?php echo $model[$field['name']]; ?></td>
                        <?php   } if ($field['is_view_field'] && $field['is_relationship_field']) { ?>
                            <td><?php echo $model[$field['name'] . '_txt']; ?></td>
                        <?php   } } ?>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn-demo m-t-10">
                <a href="<?php echo get_site_url() . '/page?type=entity&artifact=' . $view->get_artifact_name() . '&id=' . $model['id'] . $view->get_parent_url(); ?>&page_action=edit" 
                   class="btn btn-primary waves-effect">
                   <?php _e('Edit', 'framework') ?>
                </a>
                <form id="delete-entity-form" style="display:none" action=""  method="POST">
                    <input type="hidden" name="id" value="<?php echo $model['id']; ?>">
                    <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
                    <input type="hidden" name="submitted" id="submitted" value="true" />
                </form>
                <a id="delete-entity-btn" href="<?php echo get_site_url() . '/page?type=entity&artifact=' . $view->get_artifact_name() . '&id=' . $model['id']. $view->get_parent_url(); ?>&page_action=delete" class="btn btn-warning waves-effect">
                   <?php _e('Delete', 'framework') ?>
                </a>
                <?php if(!is_null($view->get_parent_artifact_name())) { ?>
                <a href="<?php echo get_site_url() . '/page?type=entity&artifact=' . $view->get_artifact_name() . '&id=' . $view->get_parent_id() . $view->get_parent_param(); ?>&page_action=view" 
                   class="btn btn-primary waves-effect">
                   <?php _e('Done', 'framework') ?>
                </a>
                <?php } ?>
            </div>
        </div>

        <?php 
            $ifield_count = 1;
            foreach ($model['related_child_entities'] as $related_child_entity) { ?>

            <div role="tabpanel" class="tab-pane animated fadeIn" id="tab-<?php echo $ifield_count; ?>">
                <!-- <div id="success"></div> -->

                <form id="<?php echo $related_child_entity['data_type']?>-list-form">
                    <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
                    <input type="hidden" name="submitted" id="submitted" value="true" /> 
                    <input type="hidden" name="<?php echo $related_child_entity['name'];?>" value="<?php echo $model['id']; ?>"/>
                </form>
                <div class="table-responsive">
                    <table id="<?php echo $related_child_entity['data_type']?>-table" class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <?php foreach ($related_child_entity['fields'] as $child_field) { 
                                        if($child_field['is_list_field']) {?>
                                <th><?php echo $child_field['description']; ?></th>
                                <?php } } ?>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="btn-demo m-t-10">
                    <a id="create-<?php echo strtolower($child_field['entity_name']); ?>-btn" href="<?php echo get_site_url();?>/page?type=entity&artifact=<?php echo strtolower($child_field['entity_name']); ?>&page_action=create&parent_id=<?php echo $model['id']; ?>&parent_artifact=<?php echo $view->get_artifact_name(); ?>&parent_field=<?php echo $related_child_entity['name']?>" class="btn btn-success waves-effect">
                       <?php _e('Add ${entity.relatedChildEntities[key].description}', 'framework') ?>
                    </a>
                    <?php $child_parent_url = '&parent_id=' . $model['id'] . '&parent_artifact=<?php echo $view->get_artifact_name(); ?>&parent_field='; ?>
                    <input type="hidden" name="<?php echo strtolower($child_field['entity_name']); ?>_parent_params" id="<?php echo strtolower($child_field['entity_name']); ?>_parent_params" value="<?php echo $child_parent_url; ?>" /> 
                </div>
                
            </div>
    
            
        <?php $ifield_count++; } ?>
    </div>