
<%@ page import="racetrack.Race" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
	<g:javascript library="racetrack" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
       	<div class="nav">
			<g:render template="/adminmenubar" />
		</div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.cost.label" default="Cost" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "cost")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.distance.label" default="Distance" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "distance")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.maxRunners.label" default="Max Runners" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "maxRunners")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.registrations.label" default="Registrations" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${raceInstance.registrations}" var="r">
                                    <li><g:link controller="registration" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.startDateTime.label" default="Start Date Time" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${raceInstance?.startDateTime}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="race.state.label" default="State" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: raceInstance, field: "state")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${raceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return warmBeforeRaceDelete();" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
