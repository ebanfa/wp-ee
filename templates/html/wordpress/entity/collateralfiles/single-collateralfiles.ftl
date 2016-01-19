<?php
    /*
     */
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }
    global $entity_data;
    if (isset($_REQUEST['id'])) {
        $entity_data = CollateralFilesAPI::get_by_id(sanitize_text_field($_REQUEST['id']));
    }

?>

<?php 
    do_action('shadowbanker_before_main_content');
    
    do_action('shadowbanker_before_single_entity');
?>
                        <div class="row mg-btm-30">
                            <div class="col-sm-12">
                                <div class="body-section">
                                    <div id="success"></div>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                                            <tbody>
                                                <th><h5 class="no-margin-bottom">Collateral</h5></th>
                                                <th><h5 class="no-margin-bottom">Name</h5></th>
                                                <th><h5 class="no-margin-bottom">Description</h5></th>
                                                <th><h5 class="no-margin-bottom">URL</h5></th>
                                                <th><h5 class="no-margin-bottom">Size</h5></th>
                                                <tr>

                <td><?php echo $entity_data['collateral_txt']; ?></td>
                <td><?php echo $entity_data['name']; ?></td>

                <td><?php echo $entity_data['description']; ?></td>

                <td><?php echo $entity_data['file_url']; ?></td>

                <td><?php echo $entity_data['file_size']; ?></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                <div class="btn-demo m-t-10">
                                    <a href="<?php echo get_site_url() . '/page?type=entity&artifact=' . $entity_name . '&id=' . $entity_data['id']; ?>&page_action=edit" 
                                       class="btn btn-primary waves-effect">
                                       <?php _e('Edit', 'framework') ?>
                                    </a>
                                    <form id="delete-entity-form" style="display:none" action=""  method="POST">
                                        <input type="hidden" name="id" value="<?php echo $entity_data['id']; ?>">
                                        <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
                                        <input type="hidden" name="submitted" id="submitted" value="true" />
                                    </form>
                                    <a id="delete-entity-btn" href="<?php echo get_site_url() . '/page?type=entity&artifact=' . $entity_name . '&id=' . $entity_data['id']; ?>&page_action=delete" class="btn btn-warning waves-effect">
                                       <?php _e('Delete', 'framework') ?>
                                    </a>
                                    <a href="<?php echo get_site_url() . '/page?type=entity&artifact=collateral&id=' . $entity_data['collateral']; ?>&page_action=view" 
                                       class="btn btn-primary waves-effect">
                                       <?php _e('Done', 'framework') ?>
                                    </a>

                                </div>

                                </div>
                            </div>
                        </div>

<?php 
//    do_action('shadowbanker_after_single_entity'); 
    
    do_action('shadowbanker_after_main_content');
?>
<script type="text/javascript">
            
        /*
         * Dialogs
         */
        //Warning Message
        $('#delete-entity-btn').click(function(e){
            e.preventDefault();
            swal({   
                title: "Are you sure?",   
                text: "You will not be able to undo this action!",   
                type: "warning",   
                showCancelButton: true,   
                confirmButtonColor: "#DD6B55",   
                confirmButtonText: "Yes, delete it!",   
                closeOnConfirm: false 
            }, function(){   
                var form = $('#delete-entity-form').ajaxSubmit(
                {/* options */
                    url: shadowcore_ajax_script.ajaxurl,
                    data: ({action: 'delete_sb_colfiles_ajax'}),
                    success: function (response)
                    {
                        var success_msg = '';
                        if (response.success) {
                            swal({   
                                title: "Deleted!",   
                                text: "The record has been deleted",   
                                type: "success",   
                                showCancelButton: false,   
                                confirmButtonText: "OK",   
                                closeOnConfirm: true 
                            }, function(){   
                                $('#success').html(response.data.message);
                            });
                        }
                        else {
                            swal("Error!", response.data.message, "warning"); 
                        }
                    }
                });
                
            });
        });
            

</script>
