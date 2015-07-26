
<%@ page import="noticeboard.Notice" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
</head>
<body>

<div id="show-notice" class="content scaffold-show" role="main">
	<g:if test="${noticeInstance?.category}">
		<li class="fieldcontain">
			<span id="category-label" class="property-label"><g:message code="notice.category.label" default="Category" /></span>

			<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${noticeInstance}" field="category"/></span>

		</li>
	</g:if>
	<g:if test="${noticeInstance?.description}">
		<li class="fieldcontain">
			<span id="description-label" class="property-label"><g:message code="notice.description.label" default="Description" /></span>

			<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${noticeInstance}" field="description"/></span>

		</li>
	</g:if>

	<g:if test="${noticeInstance?.noticeDate}">
		<li class="fieldcontain">
			<span id="noticeDate-label" class="property-label"><g:message code="notice.noticeDate.label" default="Notice Date" /></span>

			<span class="property-value" aria-labelledby="noticeDate-label"><g:formatDate date="${noticeInstance?.noticeDate}" /></span>

		</li>
	</g:if>

	<g:if test="${noticeInstance?.title}">
		<li class="fieldcontain">
			<span id="title-label" class="property-label"><g:message code="notice.title.label" default="Title" /></span>

			<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${noticeInstance}" field="title"/></span>

		</li>
	</g:if>

</ol>
	<g:if test="${session.user}">
		<g:form url="[resource:noticeInstance, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${noticeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</g:if>
</div>
</body>
</html>
