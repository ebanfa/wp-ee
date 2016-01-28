<?php
    /*
     */
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }
    global $entity_data;
    if (isset($_REQUEST['id'])) {
        $entity_data = ${entity.name}API::get_by_id(sanitize_text_field($_REQUEST['id']));
    }
?>

<?php 
    do_action('shadowbanker_before_main_content');
    
    do_action('shadowbanker_before_single_entity');
?>

                        <ul class="tab-nav tn-justified tn-icon" role="tablist">
                            <li role="presentation" class="active">
                                <a class="col-sx-4" href="#tab-0" aria-controls="tab-0" role="tab" data-toggle="tab">
                                    ${entity.description}
                                </a>
                            </li>
                             <li role="presentation">
                                <a class="col-xs-4" href="#tab-5" aria-controls="tab-5" role="tab" data-toggle="tab">
                                    Address
                                </a>
                            </li>
                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-6" aria-controls="tab-6" role="tab" data-toggle="tab">
                                    Files
                                </a>
                            </li>
                            <?php if($entity_data['party_type_code'] === 'ORGANIZATION') { ?>
                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-7" aria-controls="tab-7" role="tab" data-toggle="tab">
                                    Business Unit
                                </a>
                            </li>
                            <?php } ?>
                            <?php 
                                foreach ($entity_data['roles'] as $role) {
                                    if($role['entity_code'] === 'CLIENT') {
                            ?>
                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-8" aria-controls="tab-8" role="tab" data-toggle="tab">
                                    Property
                                </a>
                            </li>
                            <?php  } else if($entity_data['entity_code'] === 'TENANT') { ?>

                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-10" aria-controls="tab-10" role="tab" data-toggle="tab">
                                    Agreement
                                </a>
                            </li>

                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-11" aria-controls="tab-11" role="tab" data-toggle="tab">
                                    Rent
                                </a>
                            </li>

                            <?php  } else if($entity_data['entity_code'] === 'SERVICE_PROVIDER') { ?>
                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-12" aria-controls="tab-12" role="tab" data-toggle="tab">
                                    Inspection
                                </a>
                            </li>
                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-13" aria-controls="tab-13" role="tab" data-toggle="tab">
                                    Maintenance
                                </a>
                            </li>
                            <?php  } } ?>
                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-16" aria-controls="tab-16" role="tab" data-toggle="tab">
                                    Payments
                                </a>
                            </li>
                            <li role="presentation">
                                <a class="col-xs-4" href="#tab-17" aria-controls="tab-17" role="tab" data-toggle="tab">
                                    Disputes
                                </a>
                            </li>
                            
                        </ul>

                        <div class="tab-content p-20">
                            <div role="tabpanel" class="tab-pane animated fadeIn in active" id="tab-0">
                                <div id="success"></div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                                        <tbody>
    <#list entity.fields as field>
        <#if field.listField == "Y">
                                            <th><h5 class="no-margin-bottom">${field.description}</h5></th>
        </#if>
    </#list>
                                            <tr>
    <#list entity.fields as field>
        <#if field.listField == "Y">
            <#if field.relationshipField == "N">
                <td><?php echo $entity_data['${field.name}']; ?></td>
            </#if>

            <#if field.relationshipField == "Y">
                <td><?php echo $entity_data['${field.name}_txt']; ?></td>
            </#if>
        </#if>
    </#list>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="btn-demo m-t-10">
                                    <a href="<?php echo get_site_url() . '/page?type=entity&artifact=${entity.name?lower_case}&id=' . $entity_data['id']; ?>&page_action=edit" 
                                       class="btn btn-primary waves-effect">
                                       <?php _e('Edit', 'framework') ?>
                                    </a>
                                    <form id="delete-entity-form" style="display:none" action=""  method="POST">
                                        <input type="hidden" name="id" value="<?php echo $entity_data['id']; ?>">
                                        <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
                                        <input type="hidden" name="submitted" id="submitted" value="true" />
                                    </form>
                                    <a id="delete-entity-btn" href="<?php echo get_site_url() . '/page?type=entity&artifact=${entity.name?lower_case}&id=' . $entity_data['id']; ?>&page_action=delete" class="btn btn-warning waves-effect">
                                       <?php _e('Delete', 'framework') ?>
                                    </a>
                                </div>

                            </div>

                            



                        </div>

<?php 
    //do_action('shadowbanker_after_single_entity'); 
    
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
                    url: ${application.name?lower_case}_ajax_script.ajaxurl,
                    data: ({action: 'delete_${entity.postName}_ajax'}),
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
