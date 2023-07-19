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
    <div class="container my-4">
        <h1>Your Account</h1>
    </div>
    <div class="container d-flex">
        <div class="col-6">
<%--            SHOULD ADD A CHANGE PASSWORD FIELD HERE --%>
            <a href="/test" class="btn btn-primary mb-3">Link your Google Calendar</a>
            <h4>Friend Requests</h4>
            <div class="mx-5">
                <div class="d-flex justify-content-between my-3">
                    <p class="vcenter">User Name</p>
                    <div class="d-flex">
                        <a href="/accept/USERID" class="btn btn-primary me-2">Accept</a>
                        <a href="/deny/USERID" class="btn btn-danger">Deny</a>
                    </div>
                </div>
                <div class="d-flex justify-content-between my-3">
                    <p class="vcenter">User Name</p>
                    <div class="d-flex">
                        <a href="/accept/USERID" class="btn btn-primary me-2">Accept</a>
                        <a href="/deny/USERID" class="btn btn-danger">Deny</a>
                    </div>
                </div>
                <div class="d-flex justify-content-between my-3">
                    <p class="vcenter">User Name</p>
                    <div class="d-flex">
                        <a href="/accept/USERID" class="btn btn-primary me-2">Accept</a>
                        <a href="/deny/USERID" class="btn btn-danger">Deny</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6">
            <h4>Your Friends</h4>
            <div class="mx-5">
                <div class="d-flex justify-content-between my-3">
                    <p class="vcenter col-6">Friend Name</p>
                    <a href="/unfriend/FRIENDID" class="btn btn-danger">unfriend</a>
                </div>
                <div class="d-flex justify-content-between my-3">
                    <p class="vcenter col-6">Friend Name</p>
                    <a href="/unfriend/FRIENDID" class="btn btn-danger">unfriend</a>
                </div>
                <div class="d-flex justify-content-between my-3">
                    <p class="vcenter col-6">Friend Name</p>
                    <a href="/unfriend/FRIENDID" class="btn btn-danger">unfriend</a>
                </div>
                <div class="d-flex justify-content-between my-3">
                    <p class="vcenter col-6">Friend Name</p>
                    <a href="/unfriend/FRIENDID" class="btn btn-danger">unfriend</a>
                </div>
                <a href="/search" class="btn btn-primary wide mt-2">Search for more friends</a>
            </div>
        </div>
    </div>
</body>
</html>

