<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <title>Group Planner</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/main.css">
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body class="container pt-4">
    <div class="text-center">
        <h1 class="mb-4">Welcome to Test Page!</h1>
        <h2 class="mb-4">Please login to continue</h2>
    </div>
    <div class="d-flex justify-content-between">
        <div class="col-5">
            <h2 class="mb-3">Register</h2>
            <form:form action="/register" method="post" modelAttribute="newUser" cssClass="p-1">
                <form:errors path="name" cssClass="text-danger"/>
                <div class="d-flex">
                    <form:label path="name" cssClass="col-3 mt-2">Name</form:label>
                    <form:input path="name" cssClass="form-control my-2"/>
                </div>

                <form:errors path="email" cssClass="text-danger"/>
                <div class="d-flex">
                    <form:label path="email" cssClass="col-3 mt-2">Email</form:label>
                    <form:input path="email" cssClass="form-control my-2"/>
                </div>

                <form:errors path="password" cssClass="text-danger"/>
                <div class="d-flex">
                    <form:label path="password" cssClass="col-3 mt-2">Password</form:label>
                    <form:input type="password" path="password" cssClass="form-control my-2"/>
                </div>

                <form:errors path="confirm" cssClass="text-danger"/>
                <div class="d-flex">
                    <form:label path="confirm" cssClass="col-3 mt-2">Confirm Password</form:label>
                    <form:input type="password" path="confirm" cssClass="form-control my-2"/>
                </div>
                <button class="btn btn-primary my-3 mx-2">Submit</button>
            </form:form>
        </div>
        <div class="col-5">
            <h2 class="mb-3">Login</h2>
            <form:form action="/login" method="post" modelAttribute="newLogin" cssClass="">
                <form:errors path="email" cssClass="text-danger"/>
                <div class="d-flex mb-2">
                    <form:label path="email" cssClass="col-3 mt-2">Email</form:label>
                    <form:input path="email" cssClass="form-control my-2"/>
                </div>

                <form:errors path="password" cssClass="text-danger"/>
                <div class="d-flex">
                    <form:label path="password" cssClass="col-3 mt-2">Password</form:label>
                    <form:input type="password" path="password" cssClass="form-control my-2"/>
                </div>
                <button class="btn btn-primary my-3 mx-2">Submit</button>
            </form:form>
        </div>
    </div>
</body>
</html>

