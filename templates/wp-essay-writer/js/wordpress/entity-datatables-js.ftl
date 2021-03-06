
jQuery(document).ready(function($)
{
<#list module.entities as entity>

    var baseUrl = ${application.name?lower_case}_base_url.baseUrl;

    <#if entity.name == "Party">
    $('#${entity.postName}-table').dataTable({
        "ajax": {
            'type': 'POST',
            'url': ${application.name?lower_case}_ajax_script.ajaxurl,
            'data': function(d){
               d.action = 'find_entity_ajax';
               d.artifact = '${entity.name?lower_case}';
               d.form = $("#${entity.postName}-list-form").serializeArray();
            },
        },
        columns: [
            { data: "id" }, 
<#list entity.fields as field>
    <#if field.listField == "Y">
        <#if field.relationshipField == "N">
            { data: "${field.name}" },
        </#if>

        <#if field.relationshipField == "Y">
            { data: "${field.name}_txt" },
        </#if>
    </#if>
</#list>
        ],
        columnDefs: [
            { "visible": false,  "targets": 0 },
            {
                // The `data` parameter refers to the data for the cell (defined by the
                // `data` option, which defaults to the column being worked with, in
                // this case `data: 0`.
                "render": function ( data, type, row ) {
                    var role = '';
                    if($('#role').length) { role = '&role=' + $('#role').val(); }

                    var parent_params = '';
                    if($('#${entity.name?lower_case}_parent_params').length) {
                        parent_params = parent_params + $('#${entity.name?lower_case}_parent_params').val(); 
                    }

                    return '<a class="data-table-link" href="' + baseUrl + 'artifact=${entity.name?lower_case}&id=' + row.id + role + '&page_action=view' + '" data-related-artifact-name="${entity.name?lower_case}" data-related-instance-name="' + row.name + '" data-related-instance-id="' + row.id + '">' + data +  '</a>';
                },
                "targets": 1
            }
        ]
    });

    <#else>
    
    $('#${entity.postName}-table').dataTable({
        "ajax": {
            'type': 'POST',
            'url': ${application.name?lower_case}_ajax_script.ajaxurl,
            'data': function(d){
               d.action = 'find_entity_ajax';
               d.artifact = '${entity.name?lower_case}';
               d.form = $("#${entity.postName}-list-form").serializeArray();
            },
        },
        columns: [
            { data: "id" }, 
<#if entity.isVirtual == "Y">
    <#list entity.virtualFields as field>
        <#if field.listField == "Y">
            <#if field.relationshipField == "N">
                { data: "${field.name}" },
            </#if>

            <#if field.relationshipField == "Y">
                { data: "${field.name}_txt" },
            </#if>
        </#if>
    </#list>
<#else>
    <#list entity.fields as field>
        <#if field.listField == "Y">
            <#if field.relationshipField == "N">
                { data: "${field.name}" },
            </#if>

            <#if field.relationshipField == "Y">
                { data: "${field.name}_txt" },
            </#if>
        </#if>
    </#list>
</#if>
        ],
        columnDefs: [
            { "visible": false,  "targets": 0 },
            {
                // The `data` parameter refers to the data for the cell (defined by the
                // `data` option, which defaults to the column being worked with, in
                // this case `data: 0`.
                "render": function ( data, type, row ) {
                    var parent_params = '';
                    if($('#${entity.name?lower_case}_parent_params').length) {
                        parent_params = parent_params + $('#${entity.name?lower_case}_parent_params').val(); 
                    }
                    return '<a class="data-table-link" href="' + baseUrl + 'artifact=${entity.name?lower_case}&id=' + row.id + '&page_action=view' + parent_params + '" data-related-artifact-name="${entity.name?lower_case}" data-related-instance-name="' + row.name + '" data-related-instance-id="' + row.id + '">' + data +  '</a>';
                },
                "targets": 1
            }
        ]
    });
    </#if>
</#list>



});
