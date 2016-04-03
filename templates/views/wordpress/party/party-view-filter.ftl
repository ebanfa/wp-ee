<?php

/*
 *
 */
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}


class PartyViewFilter extends ViewFilter {

    public static $view_title_map = array(
        'client' => 'Client',
        'tenant' => 'Tenant',
        'service_provider' => 'Service Provider',
        'utility_company' => 'Utility Company',
        'prospective_tenant' => 'Prospective Tenant',
        'property_personnel' => 'Property Personnel');

    /**
     *
     */
    public static function init_hooks() { 
        add_filter('shadowbanker_party_view_title', array('PartyViewFilter', 'filter_view_title'), 10, 2);
        add_filter('shadowbanker_party_form_fields', array('PartyViewFilter', 'filter_form_fields'), 10, 2);
        add_filter('shadowbanker_party_action_links', array('PartyViewFilter', 'filter_view_action_links'), 10, 2);
        add_filter('shadowbanker_partygroup_action_links', array('PartyViewFilter', 'filter_view_action_links'), 10, 2);
        add_filter('shadowbanker_person_action_links', array('PartyViewFilter', 'filter_view_action_links'), 10, 2);
    }

    /**
     *
     */
    public static function filter_form_fields($view, $form_fields) {
        $page_action = $view->get_page_action();
        $form_fields = parent::filter_form_fields($view, $form_fields);
        if(isset($_REQUEST['role']) && $page_action == 'list') {
            $form_fields = array();
            $field = array();
            $field['options_criteria'] = array('name' => 'role', 'value' => sanitize_text_field($_REQUEST['role']));
            array_push($form_fields, $field);
        }
        
        return $form_fields;
    }

    /**
     *
     */
    public static function filter_view_title($view, $title) {
        $title = parent::filter_view_title($view, $title);
        if(isset($_REQUEST['role'])) {
            $role = sanitize_text_field($_REQUEST['role']);
            if(isset(self::$view_title_map[$role]))
                $title = self::$view_title_map[$role];
        }
        return $title;
    }

    /**
     *
     */
    public static function filter_view_action_links($view, $action_links) {
        $page_action = $view->get_page_action();
        $party_role_param = '';
        $role = '';
        if(isset($_REQUEST['role'])) {
            $role = sanitize_text_field($_REQUEST['role']);
            $party_role_param = '&role=' . $role;
        }
        //$action_links = parent::filter_view_action_links($view, $action_links);
        $action_links = array();
        if($page_action == 'create') {
            // Add Person link
            $action_links['list_entity_link'] = array('name' => 'View All', 
                'link' => EntityActionProcessor::get_base_url() . 'page_action=list&artifact='. $view->get_artifact_name() . $party_role_param);
        }
        if($page_action == 'list') {
            if($role != 'utility_company')
            // Add Person link
            $action_links['create_person_link'] = array('name' => 'Add New Person', 
                'link' => EntityActionProcessor::get_base_url() . 'page_action=create&artifact=person' . $party_role_param);
            // Add Organization link
            $action_links['create_organization_link'] = array('name' => 'Add New Organization', 
                'link' => EntityActionProcessor::get_base_url() . 'page_action=create&artifact=partygroup' . $party_role_param);
        }
        if($page_action == 'view') {
            // Add Person link
            $action_links['create_person_link'] = array('name' => 'Add New Person', 
                'link' => EntityActionProcessor::get_base_url() . 'page_action=create&artifact=person' . $party_role_param);
            // Add Organization link
            $action_links['create_organization_link'] = array('name' => 'Add New Organization', 
                'link' => EntityActionProcessor::get_base_url() . 'page_action=create&artifact=partygroup' . $party_role_param);

            $action_links['list_party_link'] = array('name' => 'View All', 
                'link' => EntityActionProcessor::get_base_url() . 'page_action=list&artifact=party' . $party_role_param);
        }
        return $action_links;
    }

}

?>