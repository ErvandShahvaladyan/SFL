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

    <title>Edit</title>
</head>
<body><br/>

<form:form method="POST" modelAttribute="userForm">
    <div align="center"><br/><br/>
        <spring:bind path="firstname">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}">
                <form:input type="text" path="firstname" class="form-control"
                            autofocus="true" />
                <form:errors path="firstname"/>
                <div id="ajaxFirstnameResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <spring:bind path="lastname">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}">
                <form:input type="text" path="lastname" class="form-control"
                            autofocus="true"/>
                <form:errors path="lastname"/>
                <div id="ajaxLastnameResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <spring:bind path="email">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}">
                <form:input type="text" path="email" class="form-control" placeholder="Your Email"
                            autofocus="true"/>
                <form:errors path="email"/>
                <div id="ajaxEmailResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group col-lg-3 ${status.error ? 'has-error':''}">
                <form:input type="password" path="password" class="form-control"
                            autofocus="true"/>
                <form:errors path="password"/>
                <div id="ajaxPasswordResponse" class="form-group has-error"></div>
            </div>
        </spring:bind>

        <input type="submit" class="btn btn-success" value="Save">

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </div>
</form:form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/Validation.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
