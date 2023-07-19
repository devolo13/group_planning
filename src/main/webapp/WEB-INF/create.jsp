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
    <link rel="stylesheet" href="/css/calendar.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <script type="text/javascript" src="/js/calendar.js"></script>
</head>
<body class="pb-5">
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
    <div class="container pt-4 d-flex">
        <div class="col-4">
            <h1>Plan an Event</h1>
<%--          NEED TO CHANGE MODEL ATTRIBUTE AND PATHS FOR ALL FORM ELEMENTS  --%>
            <form:form action="/register" method="post" modelAttribute="newUser" cssClass="p-1">
                <form:label path="name" cssClass="col-4 mt-3">Name of Event</form:label>
                <form:errors path="name" cssClass="text-danger"/>
                <form:input path="name" cssClass="form-control my-2"/>

                <form:label path="email" cssClass="col-4 mt-3">Day</form:label>
                <form:errors path="email" cssClass="text-danger"/>
                <form:input type="date" path="email" cssClass="form-control my-2"/>

                <form:label path="password" cssClass="col-4 mt-3">Start Time</form:label>
                <form:errors path="password" cssClass="text-danger"/>
                <form:input type="time" path="password" cssClass="form-control my-2"/>
<%--                  NEED TO ADD min="" ATTRIBUTE TO KEEP PEOPLE FROM MAKING EVENTS IN THE PAST  --%>

                <form:label path="confirm" cssClass="col-4 mt-3">Event Duration</form:label>
                <form:errors path="confirm" cssClass="text-danger"/>
                <div class="d-flex">
                    <form:input type="number" path="confirm" cssClass="form-control my-2"/>
                    <form:select path="confirm" cssClass="form-control my-2 ms-4">
                        <form:option value="minutes" label="Minutes"/>
                        <form:option value="hours" label="Hours"/>
                        <form:option value="days" label="Days"/>
                    </form:select>
                </div>

                <form:label path="confirm" cssClass="col-4 mt-3">Event Description</form:label>
                <form:errors path="confirm" cssClass="text-danger"/>
                <form:textarea path="confirm" cssClass="form-control my-2" rows="5"/>

                <div class="d-flex justify-content-end">
                    <button class="btn btn-primary my-4">Submit</button>
                </div>
            </form:form>
        </div>
        <div class="col-8 ms-5">
            <div class="calendar">

                <ul class="weekdays bg-primary text-dark rounded">
                    <li>Su</li>
                    <li>Mo</li>
                    <li>Tu</li>
                    <li>We</li>
                    <li>Th</li>
                    <li>Fr</li>
                    <li>Sa</li>
                </ul>

                <ul class="days">
                    <%for (int i = 0; i < 3; i++) {%>
                        <li>
                            <div class="invisible">placeholder</div>
                            <div class="invisible">placeholder</div>
                        </li>
                    <%}%>
                    <%for (int i = 1; i <= 31; i++) {%>
                        <%if (i==2){%>
                            <li class="rounded p-2 bg-primary">
                                <div class="mb-2"><%= i %></div>
                                <div>5 available</div>
                            </li>
                        <%}else{%>
                            <li class="rounded p-2">
                                <div class="mb-2"><%= i %></div>
                                <div>5 available</div>
                            </li>
                        <%}%>
                    <%}%>
                </ul>
            </div>
            <div class="mt-5">
                <h4 class="mb-3">Who's Invited:</h4>
    <%--              Form starts here  --%>
                <form class="d-flex ms-4">
                    <div class="col-4">
                        <%for (int i = 1; i < 5; i++) {%>
                            <input type="checkbox" value="friend<%=i%>" id="friend<%=i%>" class="form-check-input">
                            <label for="friend<%=i%>" class="form-check-label">Friend <%=i%></label><br/>
                        <%}%>
                    </div>
                    <div class="col-4">
                        <%for (int i = 5; i < 9; i++) {%>
                        <input type="checkbox" value="friend<%=i%>" id="friend<%=i%>" class="form-check-input">
                        <label for="friend<%=i%>" class="form-check-label">Friend <%=i%></label><br/>
                        <%}%>
                    </div>
                    <div class="col-4">
                        <%for (int i = 9; i < 13; i++) {%>
                        <input type="checkbox" value="friend<%=i%>" id="friend<%=i%>" class="form-check-input">
                        <label for="friend<%=i%>" class="form-check-label">Friend <%=i%></label><br/>
                        <%}%>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

