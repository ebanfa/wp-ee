<?php
    /*
     */
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }

?>


        <form id="${entity.postName}-list-form">
            <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
            <input type="hidden" name="submitted" id="submitted" value="true" /> 
        </form>
        <div class="table-responsive">
            <table id="${entity.postName}-table" class="table table-striped table-bordered table-hover" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
<#list entity.fields as field>
    <#if field.listField == "Y">
        <#if field.relationshipField == "N">
            <th>${field.description}</th>
        </#if>

        <#if field.relationshipField == "Y">
            <th>${field.description}</th>
        </#if>

                        
    </#if>
</#list>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            
        </div>