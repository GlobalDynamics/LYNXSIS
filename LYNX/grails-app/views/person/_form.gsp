<%@ page import="net.celestialdynamics.lynx.modules.Person" %>



<%--<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'account', 'error')} required">--%>
<%--	<label for="account">--%>
<%--		<g:message code="person.account.label" default="Account" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="account" name="account.id" from="${net.celestialdynamics.lynx.modules.Account.list()}" optionKey="id" required="" value="${personInstance?.account?.id}" class="many-to-one"/>--%>
<%--</div>--%>
<fieldset style = "width:800px;">
<legend>Address Information</legend>
	<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} required">
		<label for="street">
			<g:message code="address.street.label" default="Street" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField maxlength = "100" class="input bigfield" name="street" required="" value="${addressInstance?.street}"/>
	</div>

	
<%--<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} required">--%>
<%--	<label for="street">--%>
<%--		<g:message code="address.street.label" default="Street" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:textField name="street" required="" value="${addressInstance?.street}"/>--%>
<%--</div>--%>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'zipcode', 'error')} required">
	<label for="zipcode">
		<g:message code="address.zipcode.label" default="Zipcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "10" class="input bigfield" name="zipcode" required="" value="${addressInstance?.zipcode}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'apt', 'error')} required">
	<label for="apt">
		<g:message code="address.apt.label" default="Apt" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "10" class="input bigfield" name="apt" required="" value="${addressInstance?.apt}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'houseNumber', 'error')} required">
	<label for="houseNumber">
		<g:message code="address.houseNumber.label" default="House Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "10" class="input bigfield" name="houseNumber" required="" value="${addressInstance?.houseNumber}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'direction', 'error')} required">
	<label for="direction">
		<g:message code="address.direction.label" default="Direction" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "1" class="input smallfield" name="direction" required="" value="${addressInstance?.direction}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "15" class="input bigfield" name="state" required="" value="${addressInstance?.state}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "20" class="input bigfield" name="city" required="" value="${addressInstance?.city}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="address.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "10" class="input bigfield" name="phone" required="" value="${addressInstance?.phone}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "20" class="input bigfield" name="country" required="" value="${addressInstance?.country}"/>
</div>

<div class="fieldcontain  ${hasErrors(bean: addressInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="address.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField maxlength = "50" class="input bigfield" name="email" required="" value="${addressInstance?.email}"/>
</div>
<div class = "clear"></div>
</fieldset>

<div class="entry">
<div class="sep"></div>
</div>

<%--<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address', 'error')} required">--%>
<%--	<label for="address">--%>
<%--		<g:message code="person.address.label" default="Address" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	</label>--%>
<%--	<g:select id="address" name="address.id" from="${net.celestialdynamics.lynx.modules.Address.list()}" optionKey="id" required="" value="${personInstance?.address?.id}" class="many-to-one"/>--%>
<%--</div>--%>

<fieldset style = "width:800px;">
<legend>Person Information</legend>
<div class="input_field ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="lastName" required="" value="${personInstance?.lastName}"/>
</div>

<div class="input_field ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="firstName" required="" value="${personInstance?.firstName}"/>
</div>

<div class="input_field ${hasErrors(bean: personInstance, field: 'middleName', 'error')} required">
	<label for="middleName">
		<g:message code="person.middleName.label" default="Middle Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="middleName" required="" value="${personInstance?.middleName}"/>
</div>

<div class="input_field ${hasErrors(bean: personInstance, field: 'suffix', 'error')} required">
	<label for="suffix">
		<g:message code="person.suffix.label" default="Suffix" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="suffix" required="" value="${personInstance?.suffix}"/>
</div>

<div class="input_field ${hasErrors(bean: personInstance, field: 'gender', 'error')} required">
	<label for="gender">
		<g:message code="person.gender.label" default="Gender" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="gender" required="" value="${personInstance?.gender}"/>
</div>

<div class="input_field ${hasErrors(bean: personInstance, field: 'birthDate', 'error')} required">
	<label for="birthDate">
		<g:message code="person.birthDate.label" default="Birth Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="birthDate" required="" value="${personInstance?.birthDate}"/>
</div>

<div class="input_field ${hasErrors(bean: personInstance, field: 'language', 'error')} required">
	<label for="language">
		<g:message code="person.language.label" default="Language" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="language" required="" value="${personInstance?.language}"/>
</div>

<div class="input_field ${hasErrors(bean: personInstance, field: 'ethinicity', 'error')} required">
	<label for="ethinicity">
		<g:message code="person.ethinicity.label" default="Ethinicity" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="input bigfield" name="ethinicity" required="" value="${personInstance?.ethinicity}"/>
</div>
</fieldset>
<div class="entry">
<div class="sep"></div>
</div>

<fieldset style = "width:800px;">
<legend>Account Information</legend>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'usergroup', 'error')} required">
	<label for="account">
		<g:message code="account.usergroup.label" default="Usergroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usergroup" name="usergroup.id" optionValue ="name" from="${net.celestialdynamics.lynx.Roles.Usergroup.list()}" optionKey="id" required="" value="${accountInstance?.usergroup?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="account.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${accountInstance?.username}"/>
</div>

<div class="fieldcontain required">
	<label for="password">
		Password
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" />
</div>

<div class="fieldcontain required">
	<label for="passwordConfirm">
		Confirm Password
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="passwordConfirm" required="" />
</div>
<div class = "clear"></div>
</fieldset>
