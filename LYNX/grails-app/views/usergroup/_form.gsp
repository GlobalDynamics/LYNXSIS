<%@ page import="net.celestialdynamics.lynx.Roles.Usergroup" %>



<div class="fieldcontain ${hasErrors(bean: usergroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="usergroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${usergroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usergroupInstance, field: 'defaultGroup', 'error')} required">
	<label for="defaultGroup">
		<g:message code="usergroup.defaultGroup.label" default="Default Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="defaultGroup" required="" value="${usergroupInstance?.defaultGroup}"/>
</div>
<p>Permissions</p>
<table>
					<thead>
						<tr>
							<th style="width: 60px;" scope="col">Module</th>
							<th style="width: 60px;" scope="col">View</th>
							<th style="width: 60px;" scope="col">Update</th>
							<th style="width: 60px;" scope="col">Create</th>
							<th style="width: 60px;" scope="col">Delete</th>
						</tr>
					</thead>
						
					<tbody>
						<g:each var="module" in="${moduleList}">
						    <tr>
						    	<td>${ module.name }</td>
						    	<td><g:checkBox style = "width:20px;" name="${ module.name }View" value="${false}" /></td>
						    	<td><g:checkBox style = "width:20px;" name="${ module.name }Update" value="${false}" /></td>
						    	<td><g:checkBox style = "width:20px;" name="${ module.name }Create" value="${false}" /></td>
						    	<td><g:checkBox style = "width:20px;" name="${ module.name }Delete" value="${false}" /></td>
						    </tr>
						</g:each>
					</tbody>
				</table>

