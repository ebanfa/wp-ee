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
        'is_visible' => '${field.isVisible}',
        'is_create_field' => '${field.createField}',
        'is_edit_field' => '${field.editField}',
        'is_view_field' => '${field.viewField}',
        'is_list_field' => '${field.listField}',
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

        add_filter('shadowbanker_modify_agreement_action_links', '${entity.name}API::shadowbanker_modify_agreement_action_links', 10, 1);
    }
    
    /**
     *
     */
    public static function create_${entity.postName}_ajax() {
        // Check the ajax request
        $entity_data = ${entity.name}API::init_entity_data();
        $entity_data = CloderiaAPIUtils::do_before_ajax_edit($entity_data);
        // Create the entity of we have no errors
        if(!$entity_data['has_errors']) {
            // Create the agreement and 
            $agreement_data = self::create_agreement($entity_data);
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
        $entity_data = CloderiaAPIUtils::do_before_ajax_find($entity_data);
        $search_results = CloderiaAPIUtils::do_find_entity($entity_data);
        CloderiaAPIUtils::do_after_ajax_find($entity_data, $search_results);
    }

    /**
     *
     */
    public static function delete_${entity.postName}_ajax() {
        $entity_data = ${entity.name}API::init_entity_data();
        $entity_data = CloderiaAPIUtils::do_before_ajax_delete($entity_data);
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
     * Get all parts with id's in the list provided
     */
    public static function find_by_ids($party_ids) {
        return CloderiaAPIUtils::find_by_ids(${entity.name}API::init_entity_data(), $party_ids);
    }

    /**
     * 
     */
    public static function find_by_criteria($criteria_data) {
        $entity_data = ${entity.name}API::init_entity_data();
        return CloderiaAPIUtils::find_by_criteria($entity_data, $criteria_data);
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

    /**
     *
     */
    public static function shadowbanker_modify_agreement_action_links($entity_action_links) {
        $entity_action_links['create_entity_link'] = '/page?type=entity&page_action=create&artifact=tenantagreement';
        return $entity_action_links;
    }

    /**
     * Create the agreement
     */
    public static function create_agreement($entity_data) {
        $agreement_data = AgreementAPI::init_entity_data();

        $rent_agreement_type = AgreementTypeAPI::get_by_code('RENT_AGREEMENT');

        if(isset($rent_agreement_type['id'])) {
            $agreement_data['type'] = $rent_agreement_type['id'];
            $agreement_data['name'] = $entity_data['name'];
            $agreement_data['tenant'] = $entity_data['a_tenant'];
            $agreement_data['property'] = $entity_data['a_property'];
            $agreement_data['end_date'] = $entity_data['date_end'];
            $agreement_data['start_date'] = $entity_data['date_start'];
            $agreement_data['description'] = $entity_data['description'];

            $agreement_data = CloderiaAPIUtils::do_create_entity($agreement_data);
            // Create the agreement units
            self::create_agreement_units($agreement_data);
            // Create the agreement charges
            self::create_agreement_charges($agreement_data);
            // Create the agreement terms
            self::create_agreement_terms($agreement_data);
            // Create the rent stucture
            self::create_agreement_rent_structure($agreement_data);
        }
        return $agreement_data;
    }

    /**
     * Create the agreement units
     */
    public static function create_agreement_units($agreement_data) {
        if(!empty($_POST['unit_id'])) {
            foreach($_POST['unit_id'] as $unit_id) {
                $id = sanitize_text_field($unit_id);
                $agreementunit_data = AgreementUnitAPI::init_entity_data();
                $agreementunit_data['name'] = $agreement_data['name'];
                $agreementunit_data['au_unit'] = $id;
                $agreementunit_data['au_agreement'] = $agreement_data['id'];
                $agreementunit_data['description'] = $agreement_data['description'];
                $agreementunit_data = CloderiaAPIUtils::do_create_entity($agreementunit_data);
            }
        }
    }

    /**
     * Create the agreement charges
     */
    public static function create_agreement_charges($agreement_data) {}

    /**
     * Create the agreement terms
     */
    public static function create_agreement_terms($agreement_data) {}

    /**
     * Create the agreement rent structure
     */
    public static function create_agreement_rent_structure($agreement_data) {
        // Get all applicable charges
        $total_charges = self::get_total_applicable_charges($agreement_data);
        // Get all applicable expenses
        // Get number of months
        // Create rent entity for each month

    }


    /**
     * Get the total of the charges that apply to this agreement
     */
    public static function get_total_applicable_charges($agreement_data) {
        // 1. Get all property charges for this property
        // 2. Get all Building Charge -
        // 2. Get all Floor Charge -
        // 2. Get all Unit Type Charge -
        // 2. Get all Unit Charge -
        // 2. Get all Agreement Type Charge -
        // 2. Get all Agreement Charge -
        // 2. Get all Parking Facility Charge -
        // 2. Get all Parking Slot Type Charge -
    }

}
