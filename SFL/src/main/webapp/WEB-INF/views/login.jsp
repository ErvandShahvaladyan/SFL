<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
          crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html, charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scala=1">

    <title>Login</title>
</head>
<body onload='document.loginForm.username.focus();'><br/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

Language : <a href="?lang=en">English</a>|<a href="?lang=ru">Russian</a>

<form class="form-signin" action="${contextPath}${"/login"}" method="POST">
    <div class="form-group" align="center"><br/><br/><br/>

        <div class="form-group col-lg-3 ${status.error ? 'has-error':''}" style="color: red">
            <input type="text" name="username" class="form-control"
                   placeholder="<spring:message code="label.login.name"/>" autofocus="true">
            <form:errors path="username"/>
            <div id="usernameError" style="color: red;">${usernameError}</div>
        </div>


        <div class="form-group col-lg-3 ${status.error ? 'has-error':''}" style="color: red">
            <input type="password" name="password" class="form-control"
                   placeholder="<spring:message code="label.login.password"/>" autofocus="true">
            <form:errors path="password"/>
        </div>

        <input type="submit" class="btn btn-success"
               value="<spring:message code="label.login.btn.log_in"/>">
        <br/><br/>

        <div class="form-group col-lg-3">
            <div class="alert alert-info" role="alert">
                <a href="<c:url value="/register"/> "
                   class="alert-link"><spring:message code="label.login.btn.register"/> </a>
            </div>
        </div>
    </div>
</form>

<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
