<?php 

class ${entity.name}CPT {

    public static $prefix = ''; 

    public static $post_name = '${entity.postName}'; 
<#if entity.global == "Y">
    public static $is_global_entity = true; 
<#else>
    public static $is_global_entity = false; 
</#if>


<#if entity.isVirtual == "Y">
    public static $is_virtual_entity = true; 
    public static $parent_name = '${entity.parentName?lower_case}'; 
<#else>
    public static $is_virtual_entity = false; 
</#if>
    


    /**
     * These are the wordpress custom post type 
     * specific fields
     */
    public static $custom_fields =  array(
<#list entity.fields as field>
        array('name' => '${field.name}',
            'title' => '${field.description}',
            'description' => 'The ${field.description} field',
            'type' => 'text',
        ),
</#list>
    );

    /**
     * These are the shadow banker framework 
     * specific fields. These represent the actual fields
     * defined in the entity mapping.
     */
 public static $entity_fields = array(
<#list entity.fields as field>
        '${field.name}' => array('name' => '${field.name}',
            'description' => '${field.description}',
            'nick_name' => '${field.nickName}',
            'size' => '${field.size}',
        <#list module.entities as modEntity>
            <#if field.dataType == modEntity.postName>
            'entity_name' => '${modEntity.name}',
            'entity_description' => '${modEntity.description}',
            </#if>
        </#list>
            'data_type' => '${field.dataType}',
            'is_required' => <#if field.required == "Y">true<#else>false</#if>,
            'is_visible' => <#if field.isVisible == "Y">true<#else>false</#if>,
            'is_create_field' => <#if field.createField == "Y">true<#else>false</#if>,
            'is_edit_field' => <#if field.editField == "Y">true<#else>false</#if>,
            'is_view_field' => <#if field.viewField == "Y">true<#else>false</#if>,
            'is_list_field' => <#if field.listField == "Y">true<#else>false</#if>,
            'is_form_field' => <#if field.isFormField == "Y">true<#else>false</#if>,
            'is_relationship_field' => <#if field.relationshipField == "Y">true<#else>false</#if>,),
</#list>   
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
<#list entity.relatedChildEntities?keys as child_field_name>
        '${child_field_name}' => array('name' => '${child_field_name}',
            'entity_name' => '${entity.relatedChildEntities[child_field_name].name}',
            'data_type' => '${entity.relatedChildEntities[child_field_name].postName}',
            'artifact_name' => '${entity.relatedChildEntities[child_field_name].name?lower_case}',
            'entity_description' => '${entity.relatedChildEntities[child_field_name].description}',
            'is_relationship_field' => true,
            'fields' => array(
                <#list entity.relatedChildEntities[child_field_name].fields as field>
                '${field.name}' => array('name' => '${field.name}',
                    'description' => '${field.description}',
                    'size' => '${field.size}',
                <#list module.entities as modEntity>
                    <#if field.dataType == modEntity.postName>
                    'entity_name' => '${modEntity.name}',
                    'entity_description' => '${modEntity.description}',
                    </#if>
                </#list>
                    'data_type' => '${field.dataType}',
                    'is_required' => <#if field.required == "Y">true<#else>false</#if>,
                    'is_visible' => <#if field.isVisible == "Y">true<#else>false</#if>,
                    'is_create_field' => <#if field.createField == "Y">true<#else>false</#if>,
                    'is_edit_field' => <#if field.editField == "Y">true<#else>false</#if>,
                    'is_view_field' => <#if field.viewField == "Y">true<#else>false</#if>,
                    'is_list_field' => <#if field.listField == "Y">true<#else>false</#if>,
                    'is_form_field' => <#if field.isFormField == "Y">true<#else>false</#if>,
                    'is_relationship_field' => <#if field.relationshipField == "Y">true<#else>false</#if>,),
                </#list>   
            ),
        ),
</#list>   
   );
 
    /**
     * Register the custom post type so it shows up in menus
     */
    public static function register_custom_post_type()
    {
       register_post_type('${entity.postName}', 
            array(
                'label' => '${entity.description}',
                'labels' => array(
                'add_new'           => 'Add New',
                'add_new_item'      => 'Add New ${entity.description}',
                'edit_item'         => 'Edit ${entity.description}',
                'new_item'          => 'New ${entity.description}',
                'view_item'         => 'View ${entity.description}',
                'search_items'      => 'Search ${entity.description}',
                'not_found'         => 'No ${entity.description} Found ',
                'not_found_in_trash'=> 'Not Found in Trash',
                ),
                'description' => 'Reusable ${entity.description}',
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
        if ( $post->post_type == '${entity.postName}') 
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

    public static function ${entity.postName}_table_head($defaults){
<#list entity.fields as field>
    <#if field.listField == "Y">
        $defaults['${field.name}']  = '${field.displayName}';
    </#if>
</#list>
        return $defaults;
    }

    public static function ${entity.postName}_table_content($column_name, $post_id){
<#list entity.fields as field>
        if ($column_name == '${field.name}') {
            $field_value = get_post_meta($post_id, '${field.name}', true );
            echo $field_value;
        }
</#list>
    }

}

?>