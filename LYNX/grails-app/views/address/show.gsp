
<%@ page import="net.celestialdynamics.lynx.modules.Address" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-address" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list address">
			
				<g:if test="${addressInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="address.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${addressInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.zipcode}">
				<li class="fieldcontain">
					<span id="zipcode-label" class="property-label"><g:message code="address.zipcode.label" default="Zipcode" /></span>
					
						<span class="property-value" aria-labelledby="zipcode-label"><g:fieldValue bean="${addressInstance}" field="zipcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.apt}">
				<li class="fieldcontain">
					<span id="apt-label" class="property-label"><g:message code="address.apt.label" default="Apt" /></span>
					
						<span class="property-value" aria-labelledby="apt-label"><g:fieldValue bean="${addressInstance}" field="apt"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.houseNumber}">
				<li class="fieldcontain">
					<span id="houseNumber-label" class="property-label"><g:message code="address.houseNumber.label" default="House Number" /></span>
					
						<span class="property-value" aria-labelledby="houseNumber-label"><g:fieldValue bean="${addressInstance}" field="houseNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.direction}">
				<li class="fieldcontain">
					<span id="direction-label" class="property-label"><g:message code="address.direction.label" default="Direction" /></span>
					
						<span class="property-value" aria-labelledby="direction-label"><g:fieldValue bean="${addressInstance}" field="direction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="address.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${addressInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="address.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${addressInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="address.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${addressInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="address.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${addressInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${addressInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="address.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${addressInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${addressInstance?.id}" />
					<g:link class="edit" action="edit" id="${addressInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
