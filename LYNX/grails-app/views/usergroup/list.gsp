
<%@ page import="net.celestialdynamics.lynx.Roles.Usergroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usergroup.label', default: 'Usergroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usergroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'usergroup.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="defaultGroup" title="${message(code: 'usergroup.defaultGroup.label', default: 'Default Group')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usergroupInstanceList}" status="i" var="usergroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usergroupInstance.id}">${fieldValue(bean: usergroupInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: usergroupInstance, field: "defaultGroup")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usergroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
