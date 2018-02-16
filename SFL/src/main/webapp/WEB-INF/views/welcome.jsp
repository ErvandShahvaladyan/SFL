<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy"
          crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html, charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scala=1">


    <title>welcome</title>
</head>
<body>
Language : <a href="?lang=en">English</a>|<a href="?lang=ru">Russian</a>

<table class="table">
    <tr>
        <td>
            <form id="logout" action="/logout" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <a href="javascript:document.getElementById('logout').submit()">
                    <spring:message code="label.welcome.logout"/></a>
            </form>
        </td>
        <td>
            <a href="<c:url value="/addNewUser"/>">
                <input type="submit" class="btn btn-outline-dark"
                       value="<spring:message code="label.welcome.btn.addNewUser"/>">
            </a>
        </td>
    </tr>
</table>

<table class="table">
    <tr class="table-dark">
        <th scope="col"><spring:message code="label.welcome.firstname"/></th>
        <th scope="col"><spring:message code="label.welcome.lastname"/></th>
        <th scope="col"><spring:message code="label.welcome.email"/></th>
        <th scope="col"><spring:message code="label.welcome.password"/></th>
        <th scope="col"><spring:message code="label.welcome.edit"/></th>
        <th scope="col"><spring:message code="label.welcome.delete"/></th>
        <th scope="col"><spring:message code="label.welcome.uploadFile"/></th>
    </tr>
    <tbody>
    <c:forEach items="${users}" var="user">
    <tr>
        <td><c:out value="${user.firstname}"/></td>
        <td><c:out value="${user.lastname}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.password}"/></td>
        <td>
            <a href="<c:url value="/edit/${user.id}"/>">
                <input type="submit" class="btn btn-outline-warning"
                       value="<spring:message code="label.welcome.btn.edit"/>">
            </a>

        </td>
        <td>
            <a href="<c:url value="/delete/${user.id}"/>">
                <input type="submit" class="btn btn-outline-danger"
                       value="<spring:message code="label.welcome.btn.delete"/>">
            </a>
        </td>
        <td>
            <a href="<c:url value="/addDocument/${user.id}"/>">
                <input type="submit" class="btn btn-outline-primary"
                       value="<spring:message code="label.welcome.btn.upload"/>">
            </a>
        </td>
    </tr>
    </tbody>
    </c:forEach>

</table>

</body>
</html>
