
<%@ page import="racetrack.Registration"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'registration.label', default: 'Registration')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="nav">
		<g:render template="/adminmenubar" />
	</div>
	<div class="body">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<div class="list">
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="id"
							title="${message(code: 'registration.id.label', default: 'Id')}" />

						<g:sortableColumn property="name"
							title="${message(code: 'registration.name.label', default: 'Name')}" />

						<g:sortableColumn property="dateOfBirth"
							title="${message(code: 'registration.dateOfBirth.label', default: 'Date Of Birth')}" />

						<g:sortableColumn property="gender"
							title="${message(code: 'registration.gender.label', default: 'Gender')}" />

						<g:sortableColumn property="postalAddress"
							title="${message(code: 'registration.postalAddress.label', default: 'Postal Address')}" />

						<g:sortableColumn property="emailAddress"
							title="${message(code: 'registration.emailAddress.label', default: 'Email Address')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${registrationInstanceList}" status="i"
						var="registrationInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><g:link action="show" id="${registrationInstance.id}">
									${fieldValue(bean: registrationInstance, field: "id")}
								</g:link></td>

							<td>
								${fieldValue(bean: registrationInstance, field: "name")}
							</td>

							<td>
								<g:formatAge birthDay="${registrationInstance.dateOfBirth}" /> - <g:formatDate date="${registrationInstance.dateOfBirth}" />
							</td>

							<td>
								${fieldValue(bean: registrationInstance, field: "gender")}
							</td>

							<td>
								${fieldValue(bean: registrationInstance, field: "postalAddress")}
							</td>

							<td>
								${fieldValue(bean: registrationInstance, field: "emailAddress")}
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="paginateButtons">
			<g:paginate total="${registrationInstanceTotal}" />
		</div>
	</div>
</body>
</html>
