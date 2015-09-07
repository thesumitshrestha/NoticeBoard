<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 7/14/2015
  Time: 10:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title> Dashboard </title>
    <meta name="layout" content="main">
</head>

<body>
<h1 style="text-align: center;font-size: 32px;"> Dashboard </h1>
<div class="ui three column grid">
    <g:each in="${noticeInstanceList}" var="notice">
        <div class="column">
            <div class="ui fluid card">
                <div class="image">
                    <h1 style="text-align: center"> ${notice.category}</h1>
                </div>
                <div class="content">
                    <a class="header" style="text-align: center">${notice.title}</a>
                    <b style="float: right;font-size: 14px;"><g:link action="show" id="${notice.id}">View More</g:link></b>

                </div>
            </div>
        </div>
    </g:each>
  </div>
</body>
</html>