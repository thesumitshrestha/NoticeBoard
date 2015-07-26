<%@ page import="noticeboard.Notice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">

	</head>
	<body>

		<div id="edit-notice" class="content scaffold-edit" role="main">

			<g:form url="[resource:noticeInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${noticeInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
