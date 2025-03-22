<%-- 
    Document   : user
    Created on : Feb 15, 2025, 4:51:48 PM
    Author     : hoadoan
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>User Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow p-4" style="width: 400px;">
                <h3 class="text-center mb-3">User Information</h3>
                <ul class="list-group">
                    <li class="list-group-item"><strong>Full Name:</strong> ${sessionScope.LOGIN_USER.fullName}</li>
                    <li class="list-group-item"><strong>Role ID:</strong> ${sessionScope.LOGIN_USER.roleID}</li>
                    <li class="list-group-item"><strong>Password:</strong> ${sessionScope.LOGIN_USER.password}</li>
                    <li class="list-group-item"><strong>Phone:</strong> ${sessionScope.LOGIN_USER.phone}</li>
                </ul>
                <div class="d-grid gap-2 mt-3">
                    <c:url var="logoutlink" value="MainController">
                        <c:param name="action" value="Logout"></c:param>
                    </c:url>
                    <a href="${logoutlink}" class="btn btn-danger">Logout</a>
                    <a href="MainController?action=Shopping" class="btn btn-primary">Go to Shopping</a>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </

