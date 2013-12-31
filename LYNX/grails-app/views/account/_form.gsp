<%@ page import="net.celestialdynamics.lynx.modules.Account" %>



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

<%--<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'lastLogin', 'error')} required">--%>
<%--	<label for="lastLogin">--%>
<%--		<g:message code="account.lastLogin.label" default="Last Login" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:datePicker name="lastLogin" precision="day"  value="${accountInstance?.lastLogin}"  />--%>
<%--</div>--%>

