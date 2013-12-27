
<%@ page import="net.celestialdynamics.lynx.modules.Account" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-account" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-account" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list account">
			
				<g:if test="${accountInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="account.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${accountInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.hash}">
				<li class="fieldcontain">
					<span id="hash-label" class="property-label"><g:message code="account.hash.label" default="Hash" /></span>
					
						<span class="property-value" aria-labelledby="hash-label"><g:fieldValue bean="${accountInstance}" field="hash"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.salt}">
				<li class="fieldcontain">
					<span id="salt-label" class="property-label"><g:message code="account.salt.label" default="Salt" /></span>
					
						<span class="property-value" aria-labelledby="salt-label"><g:fieldValue bean="${accountInstance}" field="salt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accountInstance?.lastLogin}">
				<li class="fieldcontain">
					<span id="lastLogin-label" class="property-label"><g:message code="account.lastLogin.label" default="Last Login" /></span>
					
						<span class="property-value" aria-labelledby="lastLogin-label"><g:formatDate date="${accountInstance?.lastLogin}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${accountInstance?.id}" />
					<g:link class="edit" action="edit" id="${accountInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
