/**
 * 
 */
package com.cloderia.helion.client.shared.endpoint;

import javax.ws.rs.Path;

import com.cloderia.helion.client.shared.model.${entity.name};

/**
 * @author Edward Banfa
 *
 */
@Path("/${entity.name?lower_case}")
public interface ${entity.name}EndPoint extends BaseEntityEndPoint<${entity.name}> {


}
