
<%@ page import="net.celestialdynamics.lynx.modules.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-person" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th><g:message code="person.id.label" default="ID" /></th>
						
						<th><g:message code="person.account.label" default="Account" /></th>
					
						<th><g:message code="person.address.label" default="Address" /></th>
					
						<g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'person.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="middleName" title="${message(code: 'person.middleName.label', default: 'Middle Name')}" />
					
						<g:sortableColumn property="suffix" title="${message(code: 'person.suffix.label', default: 'Suffix')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "id")}</g:link></td>
						
						<td><g:link controller = "account" action="show" id="${personInstance.account.id}">${fieldValue(bean: personInstance, field: "account.username")}</g:link></td>
					
						<td><g:link controller = "address" action="show" id="${personInstance.address.id}">${fieldValue(bean: personInstance, field: "address")}</g:link></td>
					
						<td>${fieldValue(bean: personInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "middleName")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "suffix")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
