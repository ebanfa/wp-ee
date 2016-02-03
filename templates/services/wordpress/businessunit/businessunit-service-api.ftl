<?php

/*
 *
 */
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

class ${entity.name}API {
    
    public static $entity_fields = array(
<#list entity.fields as field>
        '${field.name}' => array('name' => '${field.name}',
            'data_type' => '${field.dataType}',
            'is_required' => '${field.required}',
            'is_create_field' => '${field.createField}',
            'is_edit_field' => '${field.editField}',
            'is_form_field' => '${field.isFormField}',
            'is_relationship_field' => '${field.relationshipField}',),
</#list>   
   );
    /**
     *
     */
    public static function init_ajax_hooks() {
        add_action('wp_ajax_create_${entity.postName}_ajax', '${entity.name}API::create_${entity.postName}_ajax');
        add_action('wp_ajax_nopriv_create_${entity.postName}_ajax', '${entity.name}API::create_${entity.postName}_ajax');

        add_action('wp_ajax_edit_${entity.postName}_ajax', '${entity.name}API::edit_${entity.postName}_ajax');
        add_action('wp_ajax_nopriv_edit_${entity.postName}_ajax', '${entity.name}API::edit_${entity.postName}_ajax');

        add_action('wp_ajax_view_${entity.postName}_ajax', '${entity.name}API::view_${entity.postName}_ajax');
        add_action('wp_ajax_nopriv_view_${entity.postName}_ajax', '${entity.name}API::view_${entity.postName}_ajax');

        add_action('wp_ajax_find_${entity.postName}_ajax', '${entity.name}API::find_${entity.postName}_ajax');
        add_action('wp_ajax_nopriv_find_${entity.postName}_ajax', '${entity.name}API::find_${entity.postName}_ajax');

        add_action('wp_ajax_delete_${entity.postName}_ajax', '${entity.name}API::delete_${entity.postName}_ajax');
        add_action('wp_ajax_nopriv_delete_${entity.postName}_ajax', '${entity.name}API::delete_${entity.postName}_ajax');
    }
    
    /**
     *
     */
    public static function create_${entity.postName}_ajax() {
        // Check the ajax request
        $entity_data = ${entity.name}API::init_entity_data();
        CloderiaAPIUtils::do_before_ajax_edit($entity_data);
        $entity_data = CloderiaAPIUtils::build_entity_data_from_post($entity_data);
        $entity_data = CloderiaAPIUtils::validate_entity_data($entity_data);

        // Create the entity of we have no errors
        if(!$entity_data['has_errors']) {
            $entity_data = CloderiaAPIUtils::do_create_entity($entity_data);
        }
        // Run post edit hooks
        CloderiaAPIUtils::do_after_ajax_edit($entity_data);
    }

    /**
     *
     */
    public static function find_${entity.postName}_ajax() {
        $entity_data = ${entity.name}API::init_entity_data();
        CloderiaAPIUtils::do_before_ajax_find($entity_data);
        $search_results = CloderiaAPIUtils::do_find_entity($entity_data);
        CloderiaAPIUtils::do_after_ajax_find($entity_data, $search_results);
    }

    /**
     *
     */
    public static function delete_${entity.postName}_ajax() {
        $entity_data = ${entity.name}API::init_entity_data();
        CloderiaAPIUtils::do_before_ajax_delete($entity_data);
        $entity_data = CloderiaAPIUtils::do_delete_entity($entity_data);
        CloderiaAPIUtils::do_after_ajax_delete($entity_data);
    }

    /**
     *
     */
    public static function get_by_id($id){
        return CloderiaAPIUtils::get_entity_by_id(${entity.name}API::init_entity_data(), $id);
    }

    /**
     *
     */
    public static function get_by_code($entity_code){
        return CloderiaAPIUtils::get_entity_by_code(${entity.name}API::init_entity_data(), $entity_code);
    }

    /**
     *
     */
    public static function get_by_field($field_name, $field_value){
        return CloderiaAPIUtils::get_entity_by_meta(${entity.name}API::init_entity_data(), $field_name, $field_value);
    }

    /**
     * Get current user business role
     */
    public static function get_current_user_business_unit(){
        $business_unit = array();
        // Get the party of the current user
        $current_user_party = PartyAPI::get_current_user_party();
        if(isset($current_user_party['id'])){ 

            // Get the party profile of the current user
            $current_user_party_role = PartyProfileAPI::get_by_field('party', $current_user_party['id']);
            // The current business is gotten from the business unit set as default business unit
            // for the party profile of the current user
            if(isset($current_user_party_role['id']) && isset($current_user_party_role['default_unit'])) {
                $business_unit = BusinessUnitAPI::get_by_id($current_user_party_role['default_unit']);
            }
        }
        return $business_unit;
    }
    /**
     *
     */
    public static function init_entity_data() {
        // Check the ajax request
        $entity_data = array();
        $entity_data['entity_post_name'] = '${entity.postName}';
        $entity_data['entity_artifact_name'] = '${entity.name?lower_case}';
        $entity_data['entity_fields'] = ${entity.name}API::$entity_fields;
        $entity_data['is_global_entity'] = '${entity.global}';
        return $entity_data;
    }

}