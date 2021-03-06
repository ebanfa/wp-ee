<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}


class PortalPageModel extends AbstractPageModel { 

    /**
     * A session scoped list of page per
     * browser tab/window 
     */
    private $page_list;

    /**
     * Data values for the current page
     * stored in the session scope page chain 
     */
    private $session_data;
    
    /**
     * Get the fields associated with the current artifact
     */
    public function get_artifact_fields() {
        return array();
    }

    /**
     * 
     */
    public function filter_artifact_fields($artifact_fields) {
        // Pass the fields through the filter if any
        $fields_filter = 'shadowbanker_' . $this->ui_component->get_artifact() . '_artifact_fields';
        if (has_filter($fields_filter)) {
            return apply_filters($fields_filter, $this, $artifact_fields);
        }
        return $artifact_fields; 
    }
}
?>