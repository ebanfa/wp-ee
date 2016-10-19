<?php

/*
 *
 */
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

class StudentDisplayView extends ArtifactDisplayView {
    
    public $student_data;

    /**
     *
     */
    function __construct() {
        $this->set_up();
        $this->get_enqueue_resources();
        $this->student_data = $this->get_student();
    }

    /**
     * Render this view
     */
    public function get_student() {
        $student_data = array();
        if(!isset($_REQUEST['id'])) return EntityAPIUtils::init_error($student_data, 'Invalid student identifier specified');

        $student_data = StudentAPI::get_by_id(sanitize_text_field($_REQUEST['id']));
        if(!isset($student_data['id'])) return EntityAPIUtils::init_error($student_data, 'student not found');
        // Load the profile image
        $student_data['image_url'] =  ${application.name}::plugin_url() . '/images/user.png';
        $student_image = EntityAPI::get_by_field('partyimage', 'file_party', $student_data['id']);
        if(isset($student_image['id'])) $student_data['image_url'] = $student_image['file_url'];
        return $student_data;
    }

    /**
     * Render this view
     */
    public function get_enqueue_resources() {
        wp_register_style('fileupload_css', get_stylesheet_directory_uri() . '/css/portal/jquery.fileupload.css');
	    wp_enqueue_style('fileupload_css');

	    wp_register_script('widget_js', get_stylesheet_directory_uri() . '/js/portal/jquery.ui.widget.js', array('jquery'), true);
	    wp_register_script('transport_js', get_stylesheet_directory_uri() . '/js/portal/jquery.iframe-transport.js', array('jquery'), true);
	    wp_register_script('fileupload_js', get_stylesheet_directory_uri() . '/js/portal/jquery.fileupload.js', array('jquery'), true);

	    wp_enqueue_script('widget_js');
	    wp_enqueue_script('transport_js');
	    wp_enqueue_script('fileupload_js');
    }

    /**
     * Render this view
     */
    public function render() {
            
        do_action('shadowbanker_before_main_content');

        UIDisplayAPI::display_page($_REQUEST['page_info']);

        do_action('shadowbanker_after_main_content');
    }

    /**
     * 
     */
    public function can_edit_student_profile() {
        // 1. Get the current user party
        $party_data = UserPartyAPI::get_current_user_party();
        if(!isset($party_data['id'])) return false;
        // 2. If the party is the owner or is admin then return true
        if($this->student_data['id'] == $party_data['id'] || UserPartyAPI::is_portal_admin($party_data)) return true;
        // 3. Return false
        return false;
    }

    /**
     * 
     */
    public function can_rate_student() {
        // 1. Get the current user party
        $party_data = UserPartyAPI::get_current_user_party();
        if(!isset($party_data['id'])) return false;
        // 2. If the party is a student or is admin then return true
        if(PartyRoleAPI::has_role($party_data['id'], 'student') || UserPartyAPI::is_portal_admin($party_data)) return true;
        return false;
    }

    /**
     * 
     */
    public function can_deactive_account() {
        if(UserPartyAPI::is_current_user_portal_admin()) return true;
        return false;
    }

}

?>