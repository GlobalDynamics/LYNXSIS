<%@ page import="net.celestialdynamics.lynx.modules.Account" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'usergroup', 'error')} required">
	<label for="account">
		<g:message code="account.usergroup.label" default="Usergroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usergroup" name="usergroup.id" from="${net.celestialdynamics.lynx.Roles.Usergroup.list()}" optionKey="id" required="" value="${accountInstance?.usergroup?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="account.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${accountInstance?.username}"/>
</div>

<div class="fieldcontain required">
	<label for="password">
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" />
</div>

<div class="fieldcontain required">
	<label for="passwordConfirm">
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="passwordConfirm" required="" />
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'lastLogin', 'error')} ">
	<label for="lastLogin">
		<g:message code="account.lastLogin.label" default="Last Login" />
		
	</label>
	<g:datePicker name="lastLogin" precision="day"  value="${accountInstance?.lastLogin}" default="none" noSelection="['': '']" />
</div>

