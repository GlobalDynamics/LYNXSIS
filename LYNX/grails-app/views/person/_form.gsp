<%@ page import="net.celestialdynamics.lynx.modules.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'account', 'error')} required">
	<label for="account">
		<g:message code="person.account.label" default="Account" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="account" name="account.id" from="${net.celestialdynamics.lynx.modules.Account.list()}" optionKey="id" required="" value="${personInstance?.account?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="person.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${net.celestialdynamics.lynx.modules.Address.list()}" optionKey="id" required="" value="${personInstance?.address?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="person.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="middleName" required="" value="${personInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'suffix', 'error')} required">
	<label for="suffix">
		<g:message code="person.suffix.label" default="Suffix" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="suffix" required="" value="${personInstance?.suffix}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="person.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gender" required="" value="${personInstance?.gender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="person.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="birthDate" required="" value="${personInstance?.birthDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'language', 'error')} required">
	<label for="language">
		<g:message code="person.language.label" default="Language" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="language" required="" value="${personInstance?.language}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'ethinicity', 'error')} required">
	<label for="ethinicity">
		<g:message code="person.ethinicity.label" default="Ethinicity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ethinicity" required="" value="${personInstance?.ethinicity}"/>
</div>

