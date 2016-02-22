<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}


class ArtifactRequestProcessor {

    static $page_actions = array(
        'create' => 'Create',
        'edit' => 'Edit',
        'view' => 'View',
        'list' => 'List',
        'list_modal' => 'List Modal',
    );
    /**
     */
    public static function process_artifact_request() {

        if (!isset($_REQUEST['artifact']) && !isset($_REQUEST['page_action'])) {
            echo '<h2>Invalid request!</h2>';
        }
        $page_info = array();
        $page_info['artifact'] = sanitize_text_field($_REQUEST['artifact']);
        $page_info['page_action'] = sanitize_text_field($_REQUEST['page_action']);
        $page_info['page_action_description'] = self::$page_actions[$page_info['page_action']];
        $page_info['artifact_name'] = ArtifactUtils::$artifacts[$page_info['artifact']]['name'];
        $page_info['artifact_type'] = ArtifactUtils::$artifacts[$page_info['artifact']]['artifact_type'];
        $page_info['artifact_display_name'] = ArtifactUtils::$artifacts[$page_info['artifact']]['description'];

        $view_class = self::get_view_class($page_info['artifact']);
        $view_instance = new $view_class($page_info['artifact']);
        $page_info['view'] = $view_instance;

        $_REQUEST['page_info'] = $page_info;

        $view_instance->render();
        /*
        if($page_info['artifact_type'] === 'entity'){
            $page_info['artifact_class'] = EntityAPIUtils::init_entity_data($page_info['artifact']);
            self::display_entity($page_info);
        }
        else {
            CloderiaUIDisplayAPI::display_page($page_info);
        }*/
    }

    /**
     */
    /*public static function display_entity($page_info) {
        if($page_info['page_action'] == 'create') {
            CloderiaUIDisplayAPI::display_entity_create_form($page_info);
        }
        elseif ($page_info['page_action'] == 'edit'){
            CloderiaUIDisplayAPI::display_entity_edit_form($page_info);
        }
        elseif ($page_info['page_action'] == 'view'){
            CloderiaUIDisplayAPI::display_single_entity($page_info);
        }
        elseif ($page_info['page_action'] == 'list'){
            CloderiaUIDisplayAPI::display_entity_archive($page_info);
        }
        else {
          echo '<h1>Invalid entity page action!</h1>';
        }
    }*/

    public static function get_view_class($artifact) {
        $artifact_object_nm = ArtifactUtils::$artifacts[$artifact]['name'];
        return $artifact_object_nm . 'View'

    }
}
// End Class
?>