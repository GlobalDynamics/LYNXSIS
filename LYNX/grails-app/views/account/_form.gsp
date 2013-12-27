<%@ page import="net.celestialdynamics.lynx.modules.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="account.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${accountInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'hash', 'error')} required">
	<label for="hash">
		<g:message code="account.hash.label" default="Hash" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hash" required="" value="${accountInstance?.hash}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'salt', 'error')} required">
	<label for="salt">
		<g:message code="account.salt.label" default="Salt" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="salt" required="" value="${accountInstance?.salt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'lastLogin', 'error')} required">
	<label for="lastLogin">
		<g:message code="account.lastLogin.label" default="Last Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastLogin" precision="day"  value="${accountInstance?.lastLogin}"  />
</div>

