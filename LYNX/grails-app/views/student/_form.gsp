<%@ page import="net.celestialdynamics.lynx.modules.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="student.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${net.celestialdynamics.lynx.modules.Person.list()}" optionKey="id" required="" value="${studentInstance?.person?.id}" class="many-to-one"/>
</div>

