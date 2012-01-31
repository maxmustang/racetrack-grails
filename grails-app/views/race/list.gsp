
<%@ page import="racetrack.Race" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        	<div class="nav">
			<g:render template="/adminmenubar" />
		</div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="city" title="${message(code: 'race.city.label', default: 'City')}" />
                        
                            <g:sortableColumn property="cost" title="${message(code: 'race.cost.label', default: 'Cost')}" />
                        
                            <g:sortableColumn property="distance" title="${message(code: 'race.distance.label', default: 'Distance')}" />
                        
                            <g:sortableColumn property="maxRunners" title="${message(code: 'race.maxRunners.label', default: 'Max Runners')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'race.name.label', default: 'Name')}" />
			   <th></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${raceInstanceList}" status="i" var="race">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${race.city}</td>
                        
                            <td><g:formatNumber number="${race.cost}" format="\$##0.00"/> </td>
                        
                           <td><g:formatNumber number="${race.distance}" format="##0.0 mi"/> </td>
                        
                            <td><g:formatNumber number="${race.maxRunners}" format="###,##0"/></td>
                        
                            <td>${race.name}</td>

	                    <td><g:link action="show" id="${race.id}">show</g:link></td>
                        <!--  ps aux | grep grails -->
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
         
        </div>
    </body>
</html>
