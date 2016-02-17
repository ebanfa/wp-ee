/**
 * 
 */
package com.cloderia.ide.app;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.xml.bind.annotation.XmlElement;

/**
 * @author adrian
 *
 */
public class Entity {

	private String name;
	private String global;
	private String postName;
	private String isVirtual;
	private String displayName;
	private String description;
	private String viewTemplate;
	private String apiTemplate;
	private String relatedEntityFieldName;
	private List<Field> fields = new ArrayList<Field>();
	private Map<String, Entity> relatedChildEntities = new HashMap<String, Entity>();

	/**
	 * 
	 */
	public Entity() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	@XmlElement
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the viewTemplate
	 */
	public String getViewTemplate() {
		return viewTemplate;
	}

	/**
	 * @param viewTemplate the viewTemplate to set
	 */
	@XmlElement
	public void setViewTemplate(String viewTemplate) {
		this.viewTemplate = viewTemplate;
	}

	
	/**
	 * @return the apiTemplate
	 */
	public String getApiTemplate() {
		return apiTemplate;
	}

	/**
	 * @param apiTemplate the apiTemplate to set
	 */
	@XmlElement
	public void setApiTemplate(String apiTemplate) {
		this.apiTemplate = apiTemplate;
	}

	/**
	 * @return the name
	 */
	public String getGlobal() {
		return global;
	}

	/**
	 * @param name the name to set
	 */
	@XmlElement
	public void setGlobal(String global) {
		this.global = global;
	}

	/**
	 * @return the name
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param name the name to set
	 */
	@XmlElement
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the displayName
	 */
	public String getDisplayName() {
		return displayName;
	}

	/**
	 * @param displayName the displayName to set
	 */
	@XmlElement
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	/**
	 * @return the name
	 */
	public String getPostName() {
		return postName;
	}

	/**
	 * @param name the name to set
	 */
	@XmlElement
	public void setPostName(String postName) {
		this.postName = postName;
	}

	/**
	 * @return the isVirtual
	 */
	public String getIsVirtual() {
		return isVirtual;
	}

	/**
	 * @param isVirtual the isVirtual to set
	 */
	@XmlElement
	public void setIsVirtual(String isVirtual) {
		this.isVirtual = isVirtual;
	}

	/**
	 * @return the relatedEntityFieldName
	 */
	public String getRelatedEntityFieldName() {
		return relatedEntityFieldName;
	}

	/**
	 * @param relatedEntityFieldName the relatedEntityFieldName to set
	 */
	public void setRelatedEntityFieldName(String relatedEntityFieldName) {
		this.relatedEntityFieldName = relatedEntityFieldName;
	}

	/**
	 * @return the relatedChildEntities
	 */
	public List<Field> getFields() {
		return fields;
	}

	/**
	 * @param fields the fields to set
	 */
	@XmlElement(name="field")
	public void setFields(List<Field> fields) {
		this.fields = fields;
	}

	/**
	 * @return the relatedChildEntities
	 */
	public Map<String, Entity> getRelatedChildEntities() {
		return relatedChildEntities;
	}

	/**
	 * @param relatedChildEntities the relatedChildEntities to set
	 */
	public void setRelatedChildEntities(Map<String, Entity> relatedChildEntities) {
		this.relatedChildEntities = relatedChildEntities;
	}

}
