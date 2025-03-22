<%-- 
    Document   : createUser
    Created on : Mar 1, 2025, 4:45:15 PM
    Author     : hoadoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Create User</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow p-4" style="width: 400px;">
                <h3 class="text-center">Create User</h3>

                
                <c:if test="${not empty requestScope.USER_ERROR}">
                    <div class="alert alert-danger">
                        <c:if test="${not empty requestScope.USER_ERROR.userIDError}">
                            <p>${requestScope.USER_ERROR.userIDError}</p>
                        </c:if>
                        <c:if test="${not empty requestScope.USER_ERROR.confirm}">
                            <p>${requestScope.USER_ERROR.confirm}</p>
                        </c:if>
                        <c:if test="${not empty requestScope.USER_ERROR.error}">
                            <p>${requestScope.USER_ERROR.error}</p>
                        </c:if>
                    </div>
                </c:if>

                <form action="CreateController" method="POST">
                    <div class="mb-3">
                        <label class="form-label">User ID</label>
                        <input type="text" class="form-control" name="userID" required="" maxlength="5">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" name="fullName" required="" maxlength="20">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Role ID</label>
                        <input type="text" class="form-control" name="roleID" value="US" readonly="">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <input type="text" class="form-control" name="phone" required="">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" required="" maxlength="20">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" name="confirm" required="" maxlength="20">
                    </div>
                    <div class="d-grid gap-2">
                        <input type="submit" class="btn btn-primary" value="Create" name="MainController">
                        <input type="submit" class="btn btn-secondary" value="Back To Login" onclick="window.location.href='login.jsp'">
                    </div>
                </form>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
