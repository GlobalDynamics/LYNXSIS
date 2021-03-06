
<%@ page import="net.celestialdynamics.lynx.modules.Account" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-account" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="account.id" title="${message(code: 'person.account.id.label', default: 'ID')}" />
						<g:sortableColumn property="account.username" title="${message(code: 'person.account.username.label', default: 'Username')}" />
						<g:sortableColumn property="lastName" title="Associated Person" />
					
<%--						<g:sortableColumn property="hash" title="${message(code: 'account.hash.label', default: 'Hash')}" />--%>
<%--					--%>
<%--						<g:sortableColumn property="salt" title="${message(code: 'account.salt.label', default: 'Salt')}" />--%>
					
						<g:sortableColumn property="account.lastLogin" title="${message(code: 'account.lastLogin.label', default: 'Last Login')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${accountInstanceList}" status="i" var="accountInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${accountInstance.account.id}">${fieldValue(bean: accountInstance, field: "account.id")}</g:link></td>
						<td>${fieldValue(bean: accountInstance, field: "account.username")}</td>
						<td>${fieldValue(bean: accountInstance, field: "lastName")}, ${fieldValue(bean: accountInstance, field: "firstName")}</td>
<%--						<td>${fieldValue(bean: accountInstance, field: "hash")}</td>--%>
<%--					--%>
<%--						<td>${fieldValue(bean: accountInstance, field: "salt")}</td>--%>
					
						<td><g:formatDate date="${accountInstance.account.lastLogin}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accountInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
