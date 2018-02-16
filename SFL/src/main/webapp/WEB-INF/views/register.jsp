<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
          crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html, charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scala=1">
    <meta name="comment" content="">
    <meta name="author" content="">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <title>Register</title>
</head>
<body><br/>
Language : <a href="?lang=en">English</a>|<a href="?lang=ru">Russian</a><br/>

<a href="/"><spring:message code="label.register.btn.back"/></a>
<form:form action="/registerSuccess" method="POST" modelAttribute="userForm" id="registerForm">
    <div align="center">

        <spring:bind path="firstname">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}" style="color: red">
                <spring:message code="label.register.firstname" var="name"/>
                <form:input type="text" path="firstname" class="form-control"
                            placeholder="${name}" autofocus="true"/>
                <form:errors path="firstname"/>
                <div id="ajaxFirstnameResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <spring:bind path="lastname">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}" style="color: red">
                <spring:message code="label.register.lastname" var="surname"/>
                <form:input type="text" path="lastname" class="form-control"
                            placeholder="${surname}" autofocus="true"/>
                <form:errors path="lastname"/>
                <div id="ajaxLastnameResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}" style="color: red">
                <spring:message code="label.register.email" var="email"/>
                <form:input id="email" type="text" path="email" class="form-control"
                            placeholder="${email}" autofocus="true"/>
                <form:errors path="email"/>
                <div id="ajaxEmailResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}" style="color: red">
                <spring:message code="label.register.password" var="password"/>
                <form:input type="password" path="password" class="form-control"
                            placeholder="${password}" autofocus="true"/>
                <form:errors path="password"/>
                <div id="ajaxPasswordResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <input type="submit" class="btn btn-success"
               value=" <spring:message code="label.register.btn.save"/>">

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </div>
</form:form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/Validation.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
