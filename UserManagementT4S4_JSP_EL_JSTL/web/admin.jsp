<%-- 
    Document   : admin
    Created on : Feb 15, 2025, 4:51:53 PM
    Author     : hoadoan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrator Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"/>
        </c:if>

        <div class="container mt-4">
            
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>Welcome, <span class="text-primary">${sessionScope.LOGIN_USER.fullName}</span></h2>
                <form action="MainController">
                    <input type="submit" class="btn btn-danger" name="action" value="Logout">
                </form>
            </div>


            <form action="MainController" class="mb-3">
                <div class="input-group">
                    <input type="text" class="form-control" name="search" placeholder="Search users..." value="${param.search}">
                    <button type="submit" class="btn btn-primary" name="action" value="Search">Search</button>
                </div>
            </form>


            <c:if test="${requestScope.LIST_USER != null}">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>No</th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Role ID</th>
                                <th>Phone</th>
                                <th>Password</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                <tr>
                            <form action="MainController" method="POST">
                                <td>${counter.count}</td>
                                <td>
                                    <input type="text" class="form-control" value="${user.userID}" readonly>
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="fullName" value="${user.fullName}" required>
                                </td>
                                <td>
                                    <input type="text" class="form-control" name="roleID" value="${user.roleID}" required>
                                </td>
                                <td>
                                    <input type="number" class="form-control" name="phone" value="${user.phone}">
                                </td>
                                <td>${user.password}</td>
                                <td>
                                    <input type="hidden" name="userID" value="${user.userID}">
                                    <input type="hidden" name="search" value="${param.search}">
                                    <input type="submit" class="btn btn-warning btn-sm" name="action" value="Update">

                                </td>
                                <td>
                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"/>
                                        <c:param name="userID" value="${user.userID}"/>
                                        <c:param name="search" value="${param.search}"/>
                                    </c:url>
                                    <a href="${deleteLink}" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>


            <div class="mt-3 text-start">
                <form action="MainController" method="POST">
                    <input type="submit" class="btn btn-success" name="action" value="ViewProduct">
                </form>
            </div>
            <div class="mt-3 text-start">
                <form action="MainController" method="POST">
                    <input type="submit" class="btn btn-success" name="action" value="AddProduct">
                </form>
            </div>


            <c:if test="${not empty requestScope.ERROR}">
                <div class="alert alert-danger text-center mt-3">
                    ${requestScope.ERROR}
                </div>
            </c:if>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
