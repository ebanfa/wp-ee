<?php 

class BuildingFilesCPT {

    public static $prefix = ''; 

    public static $post_name = 'sb_buildfiles'; 
    public static $is_global_entity = false; 


    public static $is_virtual_entity = false; 
    


    /**
     * These are the wordpress custom post type 
     * specific fields
     */
    public static $custom_fields =  array(
        array('name' => 'entity_code',
            'title' => 'Code',
            'description' => 'The Code field',
            'type' => 'text',
        ),
        array('name' => 'building',
            'title' => 'Building',
            'description' => 'The Building field',
            'type' => 'text',
        ),
        array('name' => 'name',
            'title' => 'Name',
            'description' => 'The Name field',
            'type' => 'text',
        ),
        array('name' => 'description',
            'title' => 'Description',
            'description' => 'The Description field',
            'type' => 'text',
        ),
        array('name' => 'file_type',
            'title' => 'File Type',
            'description' => 'The File Type field',
            'type' => 'text',
        ),
        array('name' => 'file_url',
            'title' => 'URL',
            'description' => 'The URL field',
            'type' => 'text',
        ),
        array('name' => 'file_size',
            'title' => 'Size',
            'description' => 'The Size field',
            'type' => 'text',
        ),
        array('name' => 'mime_type',
            'title' => 'Mime Type',
            'description' => 'The Mime Type field',
            'type' => 'text',
        ),
        array('name' => 'uploaded_date',
            'title' => 'Date',
            'description' => 'The Date field',
            'type' => 'text',
        ),
        array('name' => 'business_unit',
            'title' => 'Business Unit',
            'description' => 'The Business Unit field',
            'type' => 'text',
        ),
    );

    /**
     * These are the shadow banker framework 
     * specific fields. These represent the actual fields
     * defined in the entity mapping.
     */
 public static $entity_fields = array(
        'entity_code' => array('name' => 'entity_code',
            'description' => 'Code',
            'size' => 'medium',
            'data_type' => 'alphanumeric',
            'is_required' => false,
            'is_visible' => false,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => false,
            'is_list_field' => false,
            'is_form_field' => false,
            'is_relationship_field' => false,),
        'building' => array('name' => 'building',
            'description' => 'Building',
            'size' => 'large',
            'entity_name' => 'Building',
            'entity_description' => 'Building',
            'data_type' => 'sb_building',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => false,
            'is_list_field' => false,
            'is_form_field' => false,
            'is_relationship_field' => true,),
        'name' => array('name' => 'name',
            'description' => 'Name',
            'size' => 'large',
            'data_type' => 'name',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => true,
            'is_edit_field' => true,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => true,
            'is_relationship_field' => false,),
        'description' => array('name' => 'description',
            'description' => 'Description',
            'size' => 'large',
            'data_type' => 'text-lg',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => true,
            'is_edit_field' => true,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => true,
            'is_relationship_field' => false,),
        'file_type' => array('name' => 'file_type',
            'description' => 'File Type',
            'size' => 'large',
            'data_type' => 'text',
            'is_required' => false,
            'is_visible' => false,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => false,
            'is_relationship_field' => false,),
        'file_url' => array('name' => 'file_url',
            'description' => 'URL',
            'size' => 'large',
            'data_type' => 'text',
            'is_required' => false,
            'is_visible' => false,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => false,
            'is_relationship_field' => false,),
        'file_size' => array('name' => 'file_size',
            'description' => 'Size',
            'size' => 'medium',
            'data_type' => 'text',
            'is_required' => false,
            'is_visible' => false,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => false,
            'is_relationship_field' => false,),
        'mime_type' => array('name' => 'mime_type',
            'description' => 'Mime Type',
            'size' => 'medium',
            'data_type' => 'text',
            'is_required' => false,
            'is_visible' => false,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => false,
            'is_relationship_field' => false,),
        'uploaded_date' => array('name' => 'uploaded_date',
            'description' => 'Date',
            'size' => 'medium',
            'data_type' => 'date',
            'is_required' => false,
            'is_visible' => false,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => false,
            'is_relationship_field' => false,),
        'business_unit' => array('name' => 'business_unit',
            'description' => 'Business Unit',
            'size' => 'large',
            'entity_name' => 'BusinessUnit',
            'entity_description' => 'Business Unit',
            'data_type' => 'sb_businessunit',
            'is_required' => true,
            'is_visible' => false,
            'is_create_field' => false,
            'is_edit_field' => false,
            'is_view_field' => false,
            'is_list_field' => false,
            'is_form_field' => false,
            'is_relationship_field' => true,),
   );

    /**
     * These are the shadow banker framework 
     * specific fields. Inferred fields are fields that are not
     * directly defined in the entity mapping of a given entity, but are instead
     * inferred from other entities. As an example a Party entity has a field that
     * points to the PartyType of a party, ie Party points to PartyType but not vice versa.
     * So an array of Party entities will be an inferred field on PartyType.
     */
 public static $related_child_entities = array(
   );
 
    /**
     * Register the custom post type so it shows up in menus
     */
    public static function register_custom_post_type()
    {
       register_post_type('sb_buildfiles', 
            array(
                'label' => 'Building Files',
                'labels' => array(
                'add_new'           => 'Add New',
                'add_new_item'      => 'Add New Building Files',
                'edit_item'         => 'Edit Building Files',
                'new_item'          => 'New Building Files',
                'view_item'         => 'View Building Files',
                'search_items'      => 'Search Building Files',
                'not_found'         => 'No Building Files Found ',
                'not_found_in_trash'=> 'Not Found in Trash',
                ),
                'description' => 'Reusable Building Files',
                'public' => true,
                'show_ui' => true,
                'menu_position' => 5,
                'supports' => array('title', 'custom-fields'),
                'has_archive'   => true,
                'rewrite'   => true,
            )
        );      
    }


    /*------------------------------------------------------------------------------
    Save the new Custom Fields values
    INPUT:
        $post_id (int) id of the post these custom fields are associated with
        $post (obj) the post object
  ------------------------------------------------------------------------------*/
    public static function save_custom_fields( $post_id, $post) 
    {
        if ( $post->post_type == 'sb_buildfiles') 
        {
            // The 2nd arg here is important because there are multiple nonces on the page
            if ( !empty($_POST))// && check_admin_referer('update_custom_content_fields','custom_content_fields_nonce') )
            {     
                CloderiaCustomFieldsUtils::save_custom_fields($post_id, $post, self::$custom_fields);
            }
        }
    }

    public static function get_field_value($content_type, $post_id, $field){
        return $field['value'];
    }

    public static function sb_buildfiles_table_head($defaults){
        $defaults['name']  = 'name';
        $defaults['description']  = 'Description';
        $defaults['file_type']  = 'File Type';
        $defaults['file_url']  = 'URL';
        $defaults['file_size']  = 'Size';
        $defaults['mime_type']  = 'Mime Type';
        $defaults['uploaded_date']  = 'Date';
        return $defaults;
    }

    public static function sb_buildfiles_table_content($column_name, $post_id){
        if ($column_name == 'entity_code') {
            $field_value = get_post_meta($post_id, 'entity_code', true );
            echo $field_value;
        }
        if ($column_name == 'building') {
            $field_value = get_post_meta($post_id, 'building', true );
            echo $field_value;
        }
        if ($column_name == 'name') {
            $field_value = get_post_meta($post_id, 'name', true );
            echo $field_value;
        }
        if ($column_name == 'description') {
            $field_value = get_post_meta($post_id, 'description', true );
            echo $field_value;
        }
        if ($column_name == 'file_type') {
            $field_value = get_post_meta($post_id, 'file_type', true );
            echo $field_value;
        }
        if ($column_name == 'file_url') {
            $field_value = get_post_meta($post_id, 'file_url', true );
            echo $field_value;
        }
        if ($column_name == 'file_size') {
            $field_value = get_post_meta($post_id, 'file_size', true );
            echo $field_value;
        }
        if ($column_name == 'mime_type') {
            $field_value = get_post_meta($post_id, 'mime_type', true );
            echo $field_value;
        }
        if ($column_name == 'uploaded_date') {
            $field_value = get_post_meta($post_id, 'uploaded_date', true );
            echo $field_value;
        }
        if ($column_name == 'business_unit') {
            $field_value = get_post_meta($post_id, 'business_unit', true );
            echo $field_value;
        }
    }

}

?>