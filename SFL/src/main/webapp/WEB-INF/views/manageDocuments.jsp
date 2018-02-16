<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value='/resources/css/bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/app.css' />" rel="stylesheet"/>
    <title>Manage Documents</title>
</head>
<body>
<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        Language : <a href="?lang=en">English</a>|<a href="?lang=ru">Russian</a>

        <div class="panel-heading"><span class="lead">
            <spring:message code="label.catalog.title"/> </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th><spring:message code="label.catalog.number"/></th>
                    <th><spring:message code="label.catalog.fileName"/></th>
                    <th><spring:message code="label.catalog.type"/></th>
                    <th><spring:message code="label.catalog.description"/></th>
                    <th width="100"></th>
                    <th width="100"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${catalogs}" var="catalog" varStatus="counter">
                    <tr>
                        <td>${counter.index + 1}</td>
                        <td>${catalog.link}</td>
                        <td>${catalog.type}</td>
                        <td>${catalog.comment}</td>
                        <td><a href="<c:url value='/download/${user.id}/${catalog.id}' />"
                               class="btn btn-success custom-width">
                            <spring:message code="label.catalog.btn.download"/></a></td>
                        <td><a href="<c:url value='/delete/${user.id}/${catalog.id}' />"
                               class="btn btn-danger custom-width">
                            <spring:message code="label.catalog.btn.delete"/></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel panel-default">

        <div class="panel-heading"><span class="lead">
            <spring:message code="label.catalog.newCatalogTitle"/></span></div>
        <div class="uploadcontainer">
            <form:form method="POST" modelAttribute="fileBucket" enctype="multipart/form-data" class="form-horizontal">

                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="file">
                            <spring:message code="label.catalog.uploadADocument"/>
                        </label>
                        <div class="col-md-7">
                            <form:input type="file" path="file" id="file" class="form-control input-sm"/>
                            <div class="has-error">
                                <form:errors path="file" class="help-inline"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-3 control-lable" for="description">
                            <spring:message code="label.catalog.description"/>
                        </label>
                        <div class="col-md-7">
                            <form:input type="text" path="description" id="description"
                                        class="form-control input-sm"/>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit" value="<spring:message code="label.catalog.btn.upload"/>"
                               class="btn btn-primary btn-sm">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </div>
                </div>

            </form:form>
        </div>
    </div>
    <div class="well">
        <a href="<c:url value='/welcome' />"><spring:message code="label.catalog.btn.GoToUsersList"/></a>
    </div>
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</body>
</html>
