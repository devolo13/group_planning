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
    <link rel="stylesheet" href="/css/main.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body class="">
    <nav class="navbar navbar-expand-lg bg-secondary justify-content-between py-0 px-5 shadow sticky-top text-dark">
        <div class="d-flex ms-5 mt-2">
            <a href="/home" class="nav-link">Home</a>
            <p class="mx-2">|</p>
            <a href="/create" class="nav-link">Create an Event</a>
        </div>
        <div class="d-flex me-5 mt-2">
            <a href="/account" class="nav-link">Account</a>
            <p class="mx-2">|</p>
            <a href="/logout" class="nav-link">Logout</a>
        </div>
    </nav>
    <div class="container mt-4">
        <h1 class="mb-4">Search for your friends</h1>
        <form:form action="/search/${user.name}" method="post" modelAttribute="user" cssClass="d-flex mb-5">
            <form:input path="name" cssClass="me-2 form-control" placeholder="Search your friends email"/>
            <button class="btn btn-primary">Search</button>
        </form:form>
        <div class="d-flex container mt-3">
            <div class="col-6">
                <h5>User Name</h5>
                <p>email@email.com</p>
            </div>
            <a href="/frequest/USERID" class="btn btn-primary ms-3 my-auto">send friend request</a>
        </div>
    </div>
</body>
</html>

