
<%@ page import="net.celestialdynamics.lynx.modules.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-address" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="street" title="${message(code: 'address.street.label', default: 'Street')}" />
					
						<g:sortableColumn property="zipcode" title="${message(code: 'address.zipcode.label', default: 'Zipcode')}" />
					
						<g:sortableColumn property="apt" title="${message(code: 'address.apt.label', default: 'Apt')}" />
					
						<g:sortableColumn property="houseNumber" title="${message(code: 'address.houseNumber.label', default: 'House Number')}" />
					
						<g:sortableColumn property="direction" title="${message(code: 'address.direction.label', default: 'Direction')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'address.state.label', default: 'State')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${addressInstanceList}" status="i" var="addressInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "street")}</g:link></td>
					
						<td>${fieldValue(bean: addressInstance, field: "zipcode")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "apt")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "houseNumber")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "direction")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "state")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${addressInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
