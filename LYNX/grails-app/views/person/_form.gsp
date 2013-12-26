<%@ page import="net.celestialdynamics.lynx.test.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="person.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" value="${personInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'section', 'error')} ">
	<label for="section">
		<g:message code="person.section.label" default="Section" />
		
	</label>
	<g:textField name="section" value="${personInstance?.section}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'studentID', 'error')} ">
	<label for="studentID">
		<g:message code="person.studentID.label" default="Student ID" />
		
	</label>
	<g:textField name="studentID" value="${personInstance?.studentID}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="person.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${personInstance.year}" required=""/>
</div>

