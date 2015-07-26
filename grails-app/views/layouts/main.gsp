<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/html"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script src="${resource(dir: 'semantic/dist', file: 'jquery-2.1.4.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'general.js')}"></script>
    <link href="${resource(dir: 'semantic/dist', file: 'semantic.min.css')}" rel="stylesheet">
    <script src="${resource(dir: 'semantic/dist', file: 'semantic.min.js')}"></script>
    <g:layoutHead/>
    <style>
    .ui.form input[type=text]{
        height:40px;
        color: black;
        font-size: 13px;
    }
    .ui.form input[type=password]{
        height:40px;
        color: black;
        font-size: 13px;

    }
    .ui.form input[type=submit]{
        height:40px;
    }
    #back{
        background-image: url("/images/back.png");
        margin:0px auto;
        width:1250px;
    }
    .popupss{
        padding: 10px 10px 35px;
        background: rgb(128, 128, 128);
        z-index: 999;
        display: none;
        position: absolute;
        right: 0;
        float:left;
        width:40%;
        height:251px;}
    .ar{ margin:0px auto;
        width: 980px;}
    </style>
</head>
<body id="back">
%{--<g:if test="${session.user}">
	<g:link controller="user" action="logout">Logout</g:link>
</g:if>--}%
<div class="ui top fixed menu" style="background-color:#3573A3;color:white">
    <g:link style="color:white" class="item" controller="notice" action="homePage">Home</g:link>
    <g:link style="color:white" class="item" controller="notice" action="getCategoryData" params="[category:'clubActivities']">Club Activities</g:link>
    <g:link style="color:white" class="item" controller="notice" action="getCategoryData" params="[category:'administration']">Administration</g:link>
    <g:link style="color:white" class="item" controller="notice" action="getCategoryData" params="[category:'batch']">Batch</g:link>
    <g:link style="color:white" class="item" controller="notice" action="getCategoryData" params="[category:'other']">Other</g:link>

    <g:if test="${session.user}">
        <g:link class="item" controller="user" action="logout" style="float:right;color: #ffffff">Logout</g:link>
        <g:link controller="notice" action="create" class="item" style="color: #ffffff;color: #ffffff">New Notice</g:link>
    </g:if>
    <g:else>
        <g:submitButton name="Login" class="ui basic button" style="float:right;color:white">Login</g:submitButton>
    </g:else>
    <div class="ar">
        <div class="popupss"  style="background-color:#8B4513">
            <g:form  controller="user" action="authenticate"  class="ui form">
                <div class="column">
                    <h4 class="ui header">Username</h4>
                    <input type="text" name="username" placeholder="Username"/>
                    <h4 class="ui header">Password</h4>
                    <input type="password" name="password" placeholder="Password"/>
                    <br><br>
                    <input type="submit" value="Login" class="ui button"/>
                </div>
                <g:link style="float:right;font-size:20px" href="#" class="close"><i class="remove icon"></i> Close</g:link>
            </g:form>
        </div>
    </div>
</div>
<h1 style="text-align:center;font-size:32px;color:#3573A3;margin-top: 40px">%{--<img style="height: 20px; width: 20px" src=${resource(dir:'images', file: 'deerwalk.png') }"/>--}% Digital Notice Board</h1>
    %{--<img style="margin: 0px auto 0px 333px;" src="img/deerwalk.png"/>
    <h1 style="text-align: center; font-size: 32px; color: rgb(255, 255, 255); margin-top: -74px; margin-left: 44px;" class="item"> DIGITAL NOTICE BOARD</h1>--}%
<g:layoutBody/>

</body>
</html>
