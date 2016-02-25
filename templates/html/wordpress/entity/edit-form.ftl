<?php
    /*
     */
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }

    $view = $_REQUEST['page_info']['view'];
    $model = $view->get_model();
?>
    <form role="form" name="<?php echo $model['entity_post_name'];?>_form" 
        id="<?php echo $model['entity_post_name'];?>_form" action="" 
        method="POST" enctype="multipart/form-data" 
        data-bv-framework="bootstrap"
        data-bv-excluded = ":disabled"
        data-bv-message="This value is not valid"
        data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
        data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
        data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">

        <?php do_entity_form_fields($model, false) ; ?>
        
        <div class="btn-demo m-t-10">   
            <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
            <input type="hidden" name="edit_mode" value="edit" />  
            <input type="hidden" name="id" value="<?php echo $model['id'];?>" /> 
            <input type="hidden" name="submitted" id="submitted" value="true" />  
            <input type="hidden" name="artifact" id="artifact" value="<?php echo $view->get_artifact_name(); ?>" />

            <button id="<?php echo $view->get_artifact_name(); ?>-form-btn" type="submit" class="btn btn-primary waves-effect">
                <?php _e('Update', 'framework') ?>
            </button>
            
            <a href="<?php echo get_site_url() . '/page?type=entity&artifact=' . $view->get_artifact_name() . '&id=' . $model['id']; ?>&page_action=view" 
               class="btn bgm-indigo waves-effect"><?php _e('Back', 'framework') ?>
            </a>
    </div>
    
</form>
