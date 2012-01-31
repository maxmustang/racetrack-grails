

<%@ page import="racetrack.Registration" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registration.label', default: 'Registration')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        	<div class="nav">
			<g:render template="/adminmenubar" />
		</div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${registrationInstance}">
            <div class="errors">
                <g:renderErrors bean="${registrationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${registrationInstance?.id}" />
                <g:hiddenField name="version" value="${registrationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="registration.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${registrationInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateOfBirth"><g:message code="registration.dateOfBirth.label" default="Date Of Birth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'dateOfBirth', 'errors')}">
                                    <g:datePicker name="dateOfBirth" precision="day" value="${registrationInstance?.dateOfBirth}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gender"><g:message code="registration.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'gender', 'errors')}">
                                    <g:select name="gender" from="${registrationInstance.constraints.gender.inList}" value="${registrationInstance?.gender}" valueMessagePrefix="registration.gender"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postalAddress"><g:message code="registration.postalAddress.label" default="Postal Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'postalAddress', 'errors')}">
                                    <g:textField name="postalAddress" value="${registrationInstance?.postalAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="emailAddress"><g:message code="registration.emailAddress.label" default="Email Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'emailAddress', 'errors')}">
                                    <g:textField name="emailAddress" value="${registrationInstance?.emailAddress}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="race"><g:message code="registration.race.label" default="Race" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'race', 'errors')}">
                                    <g:select name="race.id" from="${racetrack.Race.list()}" optionKey="id" value="${registrationInstance?.race?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="createdAt"><g:message code="registration.createdAt.label" default="Created At" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: registrationInstance, field: 'createdAt', 'errors')}">
                                    <g:datePicker name="createdAt" precision="day" value="${registrationInstance?.createdAt}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
