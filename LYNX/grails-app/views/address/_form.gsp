<%@ page import="net.celestialdynamics.lynx.modules.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="address.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${addressInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zipcode', 'error')} required">
	<label for="zipcode">
		<g:message code="address.zipcode.label" default="Zipcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zipcode" required="" value="${addressInstance?.zipcode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'apt', 'error')} required">
	<label for="apt">
		<g:message code="address.apt.label" default="Apt" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apt" required="" value="${addressInstance?.apt}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'houseNumber', 'error')} required">
	<label for="houseNumber">
		<g:message code="address.houseNumber.label" default="House Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="houseNumber" required="" value="${addressInstance?.houseNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'direction', 'error')} required">
	<label for="direction">
		<g:message code="address.direction.label" default="Direction" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direction" required="" value="${addressInstance?.direction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="address.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${addressInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${addressInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="address.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${addressInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" required="" value="${addressInstance?.country}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="address.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${addressInstance?.email}"/>
</div>

