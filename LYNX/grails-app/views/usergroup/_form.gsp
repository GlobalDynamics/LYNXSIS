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

