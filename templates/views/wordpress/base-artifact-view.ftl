<?php

/*
 *
 */
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

class ArtifactView {

    public $page_info;
    public $artifact;
    public $page_name;
    public $page_action;
    public $page_action_txt;
    public $page_action_description;


    /**
     *
     */
    function __construct() {
        $this->set_up();
    }

    /**
     * Register hooks
     */
    public function set_up() {
        $this->page_info = $_REQUEST['page_info'];
        $this->page_info['view'] = $this;

        $this->add_actions();
        $this->artifact = sanitize_text_field($this->page_info['artifact']);
        $this->page_name = sanitize_text_field($this->page_info['artifact_display_name']);
        $this->page_action = sanitize_text_field($this->page_info['page_action']);
        $this->page_action_description = sanitize_text_field($this->page_info['page_action_description']);

        $this->set_page_action_txt();
    }

    /**
     * Register hooks
     */
    public function add_actions() {
        add_action('wp_footer', array($this, 'enqueue_scripts'));
    }

    /**
     * Action method to enqueue the required scripts
     */
    public function enqueue_scripts() {
       
    }

    /**
     * Action method to enqueue the required scripts
     */
    public function get_artifact_name() {
       return $this->artifact;
    }

    /**
     * Action method to enqueue the required scripts
     */
    public function get_page_action() {
       return $this->page_action;
    }

    /**
     * Action method to enqueue the required scripts
     */
    public function get_page_action_description() {
       return $this->page_action_description;
    }

    /**
     * Action method to enqueue the required scripts
     */
    public function get_page_action_txt() {
       return $this->page_action_txt;
    }

    /**
     * Action method to enqueue the required scripts
     */
    public function set_page_action_txt() {
        $page_action = sanitize_text_field($_REQUEST['page_info']['page_action']);

        if($page_action == 'create')
            $this->page_action_txt = 'Create a new '. strtolower($this->page_name ) . ' by filling in the form below';
        if($page_action == 'edit')
            $this->page_action_txt = 'Edit the '. strtolower($this->page_name ) . ' by updating the form below';
        if($page_action == 'view')
            $this->page_action_txt = 'To update or delete the ' . strtolower($this->page_name ) . ', click on the control buttons below.';
        if($page_action == 'list')
            $this->page_action_txt = 'The '. strtolower($this->page_name ) . ' list. To view a single record, click on the highlighted column.';
    }

    /**
     * Render this view
     */
    public function render() {
        if(isset($_REQUEST['page_info'])) {
            $artifact = $_REQUEST['page_info']['artifact'];
            $custom_render_action = 'shadowbanker_render_create_' . $artifact . '_view';

            if(has_action($custom_render_action)) {
                // action exists so execute it
                do_action($custom_render_action);
            } else {
                // action has not been registered
                // execute default render operation
                do_action('shadowbanker_render_create_entity_view');
            }
        }
    }

}

?>