<?php 

class WorkEffortPartyAssignmentCPT {

    public static $prefix = ''; 

    public static $post_name = 'sb_wepatyassign'; 
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
        array('name' => 'wepa_party',
            'title' => 'Party',
            'description' => 'The Party field',
            'type' => 'text',
        ),
        array('name' => 'wepa_roletype',
            'title' => 'Role Type',
            'description' => 'The Role Type field',
            'type' => 'text',
        ),
        array('name' => 'wepa_bu',
            'title' => 'Business Unit',
            'description' => 'The Business Unit field',
            'type' => 'text',
        ),
        array('name' => 'wepa_we',
            'title' => 'Work Effort',
            'description' => 'The Work Effort field',
            'type' => 'text',
        ),
        array('name' => 'name',
            'title' => 'Name',
            'description' => 'The Name field',
            'type' => 'text',
        ),
        array('name' => 'from_date',
            'title' => 'From Date',
            'description' => 'The From Date field',
            'type' => 'text',
        ),
        array('name' => 'to_date',
            'title' => 'To Date',
            'description' => 'The To Date field',
            'type' => 'text',
        ),
        array('name' => 'description',
            'title' => 'Description',
            'description' => 'The Description field',
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
        'wepa_party' => array('name' => 'wepa_party',
            'description' => 'Party',
            'size' => 'large',
            'entity_name' => 'Party',
            'entity_description' => 'Party',
            'data_type' => 'sb_party',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => true,
            'is_edit_field' => true,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => true,
            'is_relationship_field' => true,),
        'wepa_roletype' => array('name' => 'wepa_roletype',
            'description' => 'Role Type',
            'size' => 'large',
            'entity_name' => 'WorkEffortRoleType',
            'entity_description' => 'Work Effort Role Type',
            'data_type' => 'sb_wertype',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => true,
            'is_edit_field' => true,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => true,
            'is_relationship_field' => true,),
        'wepa_bu' => array('name' => 'wepa_bu',
            'description' => 'Business Unit',
            'size' => 'large',
            'entity_name' => 'BusinessUnit',
            'entity_description' => 'Business Unit',
            'data_type' => 'sb_businessunit',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => true,
            'is_edit_field' => true,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => true,
            'is_relationship_field' => true,),
        'wepa_we' => array('name' => 'wepa_we',
            'description' => 'Work Effort',
            'size' => 'large',
            'entity_name' => 'WorkEffort',
            'entity_description' => 'Work Effort',
            'data_type' => 'sb_workeffort',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => true,
            'is_edit_field' => true,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => true,
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
        'from_date' => array('name' => 'from_date',
            'description' => 'From Date',
            'size' => 'medium',
            'data_type' => 'date',
            'is_required' => true,
            'is_visible' => true,
            'is_create_field' => true,
            'is_edit_field' => true,
            'is_view_field' => true,
            'is_list_field' => true,
            'is_form_field' => true,
            'is_relationship_field' => false,),
        'to_date' => array('name' => 'to_date',
            'description' => 'To Date',
            'size' => 'medium',
            'data_type' => 'date',
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
        'business_unit' => array('name' => 'business_unit',
            'description' => 'Business Unit',
            'size' => 'large',
            'entity_name' => 'BusinessUnit',
            'entity_description' => 'Business Unit',
            'data_type' => 'sb_businessunit',
            'is_required' => true,
            'is_visible' => false,
            'is_create_field' => true,
            'is_edit_field' => false,
            'is_view_field' => true,
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
        'weassignment' => array('name' => 'weassignment',
            'entity_name' => 'WorkEffortAssignmentRate',
            'data_type' => 'sb_wearate',
            'artifact_name' => 'workeffortassignmentrate',
            'entity_description' => 'Work Effort Assignment Rate',
            'is_relationship_field' => true,
            'fields' => array(
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
                'weassignment' => array('name' => 'weassignment',
                    'description' => 'Work Effort Assignment',
                    'size' => 'large',
                    'entity_name' => 'WorkEffortPartyAssignment',
                    'entity_description' => 'Work Effort Party Assignment',
                    'data_type' => 'sb_wepatyassign',
                    'is_required' => true,
                    'is_visible' => true,
                    'is_create_field' => true,
                    'is_edit_field' => true,
                    'is_view_field' => true,
                    'is_list_field' => true,
                    'is_form_field' => true,
                    'is_relationship_field' => true,),
                'rate_type' => array('name' => 'rate_type',
                    'description' => 'Rate Type',
                    'size' => 'large',
                    'entity_name' => 'RateType',
                    'entity_description' => 'Rate Type',
                    'data_type' => 'sb_ratetype',
                    'is_required' => true,
                    'is_visible' => true,
                    'is_create_field' => true,
                    'is_edit_field' => true,
                    'is_view_field' => true,
                    'is_list_field' => true,
                    'is_form_field' => true,
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
                'from_date' => array('name' => 'from_date',
                    'description' => 'From Date',
                    'size' => 'medium',
                    'data_type' => 'date',
                    'is_required' => true,
                    'is_visible' => true,
                    'is_create_field' => true,
                    'is_edit_field' => true,
                    'is_view_field' => true,
                    'is_list_field' => true,
                    'is_form_field' => true,
                    'is_relationship_field' => false,),
                'to_date' => array('name' => 'to_date',
                    'description' => 'To Date',
                    'size' => 'medium',
                    'data_type' => 'date',
                    'is_required' => true,
                    'is_visible' => true,
                    'is_create_field' => true,
                    'is_edit_field' => true,
                    'is_view_field' => true,
                    'is_list_field' => true,
                    'is_form_field' => true,
                    'is_relationship_field' => false,),
                'rate' => array('name' => 'rate',
                    'description' => 'Rate',
                    'size' => 'large',
                    'data_type' => 'money',
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
                'business_unit' => array('name' => 'business_unit',
                    'description' => 'Business Unit',
                    'size' => 'large',
                    'entity_name' => 'BusinessUnit',
                    'entity_description' => 'Business Unit',
                    'data_type' => 'sb_businessunit',
                    'is_required' => true,
                    'is_visible' => false,
                    'is_create_field' => true,
                    'is_edit_field' => false,
                    'is_view_field' => true,
                    'is_list_field' => false,
                    'is_form_field' => false,
                    'is_relationship_field' => true,),
            ),
        ),
   );
 
    /**
     * Register the custom post type so it shows up in menus
     */
    public static function register_custom_post_type()
    {
       register_post_type('sb_wepatyassign', 
            array(
                'label' => 'Work Effort Party Assignment',
                'labels' => array(
                'add_new'           => 'Add New',
                'add_new_item'      => 'Add New Work Effort Party Assignment',
                'edit_item'         => 'Edit Work Effort Party Assignment',
                'new_item'          => 'New Work Effort Party Assignment',
                'view_item'         => 'View Work Effort Party Assignment',
                'search_items'      => 'Search Work Effort Party Assignment',
                'not_found'         => 'No Work Effort Party Assignment Found ',
                'not_found_in_trash'=> 'Not Found in Trash',
                ),
                'description' => 'Reusable Work Effort Party Assignment',
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
        if ( $post->post_type == 'sb_wepatyassign') 
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

    public static function sb_wepatyassign_table_head($defaults){
        $defaults['wepa_party']  = 'Party';
        $defaults['wepa_roletype']  = 'Role Type';
        $defaults['wepa_bu']  = 'Business Unit';
        $defaults['wepa_we']  = 'Work Effort';
        $defaults['name']  = 'name';
        $defaults['from_date']  = 'From Date';
        $defaults['to_date']  = 'To Date';
        $defaults['description']  = 'Description';
        return $defaults;
    }

    public static function sb_wepatyassign_table_content($column_name, $post_id){
        if ($column_name == 'entity_code') {
            $field_value = get_post_meta($post_id, 'entity_code', true );
            echo $field_value;
        }
        if ($column_name == 'wepa_party') {
            $field_value = get_post_meta($post_id, 'wepa_party', true );
            echo $field_value;
        }
        if ($column_name == 'wepa_roletype') {
            $field_value = get_post_meta($post_id, 'wepa_roletype', true );
            echo $field_value;
        }
        if ($column_name == 'wepa_bu') {
            $field_value = get_post_meta($post_id, 'wepa_bu', true );
            echo $field_value;
        }
        if ($column_name == 'wepa_we') {
            $field_value = get_post_meta($post_id, 'wepa_we', true );
            echo $field_value;
        }
        if ($column_name == 'name') {
            $field_value = get_post_meta($post_id, 'name', true );
            echo $field_value;
        }
        if ($column_name == 'from_date') {
            $field_value = get_post_meta($post_id, 'from_date', true );
            echo $field_value;
        }
        if ($column_name == 'to_date') {
            $field_value = get_post_meta($post_id, 'to_date', true );
            echo $field_value;
        }
        if ($column_name == 'description') {
            $field_value = get_post_meta($post_id, 'description', true );
            echo $field_value;
        }
        if ($column_name == 'business_unit') {
            $field_value = get_post_meta($post_id, 'business_unit', true );
            echo $field_value;
        }
    }

}

?>