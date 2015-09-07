
<%@ page import="noticeboard.Notice" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <style>
       .ui.table {
           text-align: center;
           color: black;
       }
       .ui.table thead th{
           text-align: center;
           color: #3573A3;
       }
        .ui.table thead tr{
            text-align: center;
        }
        a{
            color: #3573A3;
        }
    </style>
</head>
<body>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<h1 style="text-align: center"> ${category} Notice</h1>
<g:if test="${noticeInstanceList}">
<div id="list-notice" class="content scaffold-list" role="main">
    <table class="ui celled table" style="width: 80%;margin: 0px auto;">
        <thead>
        <tr>
%{--
            <g:sortableColumn property="category" title="${message(code: 'notice.category.label', default: 'Category')}" />
--}%
            <g:sortableColumn property="title" title="${message(code: 'notice.title.label', default: 'Title')}" />

            <g:sortableColumn property="description" title="${message(code: 'notice.description.label', default: 'Description')}" />

            <g:sortableColumn property="noticeDate" title="${message(code: 'notice.noticeDate.label', default: 'Notice Date')}" />

            <g:if test="${session.user}">
                <th style="text-align: center">Action</th>
             </g:if>
        </tr>
        </thead>
        <tbody>
        <g:each in="${noticeInstanceList}" status="i" var="noticeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <%
                        def id=noticeInstance.id
                    %>
                <td style="text-align: center"><g:link action="show" controller="notice" id="${id}">${fieldValue(bean: noticeInstance, field: "title")}</g:link> </td>

                <td style="text-align: center">${fieldValue(bean: noticeInstance, field: "description")}</td>

                <td style="text-align: center"><g:formatDate date="${noticeInstance.noticeDate}" /></td>

                <g:if test="${session.user}">
                <td style="text-align: center"><g:link action="edit" resource="${noticeInstance}"><i class="edit icon"> </i><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <g:link action="delete" id="${noticeInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" > <i class="delete icon"></i>Delete </g:link>

                </td>
                </g:if>
            </tr>
        </g:each>

        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${noticeInstanceCount ?: 0}" />
    </div>
</div>
</g:if>
<g:else>
   <h1 style="text-align: center"> No Notice Found!!!!</h1>
</g:else>
</body>
</html>
