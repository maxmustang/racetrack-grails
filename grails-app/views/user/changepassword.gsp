<g:form action="change">
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>
	<table>
		<tr>
			<g:hiddenField name="id" value="${userInstance.id}" />
			<g:hiddenField name="version" value="${userInstance?.version}" />
			<td align="right">Senha ${userInstance.userId }</td>
			<td colspan="3"><input type="password" maxlength='8'
				name='password' value='${userInstance?.password}' /></td>
		</tr>
		<tr>
			<td align="right">Nova Senha</td>
			<td colspan="3"><input type="password" maxlength='8'
				name='newpassword' /></td>
		</tr>
		<tr>
			<td align="right">Confirmacao Nova Senha</td>
			<td colspan="3"><input type="password" maxlength='8'
				name='confnewpassword' /></td>
		</tr>
	</table>
	<div class="buttons">
		<span class="button"> <span class="button"><g:submitButton
					name="create" class="save" value="change your password" /></span>
		</span>
	</div>
</g:form>