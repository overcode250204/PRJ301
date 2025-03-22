<%-- 
    Document   : login
    Created on : Feb 15, 2025, 4:51:58 PM
    Author     : hoadoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light d-flex justify-content-center align-items-center vh-100">

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card shadow p-4">
                        <h3 class="text-center">Login</h3>

                        <c:if test="${requestScope.ERROR != null or requestScope.MESSAGE != null}">
                            <div class="alert alert-danger text-center">
                                <c:if test="${not empty requestScope.ERROR}">${requestScope.ERROR}</c:if>
                                <c:if test="${not empty requestScope.MESSAGE}">${requestScope.MESSAGE}</c:if>
                                </div>
                        </c:if>

                        <form action="MainController" method="POST">
                            <div class="mb-3">
                                <label for="userID" class="form-label">User ID</label>
                                <input type="text" class="form-control" id="userID" name="userID" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-grid gap-2">
                                <input type="submit" class="btn btn-primary" name="action" value="Login">
                                <input type="reset" class="btn btn-secondary" value="Reset">
                            </div>

                            <div class="mt-3 text-center">
                                <div class="g-recaptcha d-inline-block" data-sitekey="6LfHUfwqAAAAAIIFJELg9lqIP9rCM1xx6I5zPGnd"></div>
                            </div>
                        </form>
                        <a href="https://accounts.google.com/o/oauth2/auth?client_id=219231988364-35fqg91uck8vqcdfm6jd01cf3jk4s245.apps.googleusercontent.com&redirect_uri=http://localhost:8080/UserManagementT4S4_JSP_EL_JSTL/MainController?action=LoginWithGoogle&response_type=code&scope=openid%20email%20profile&prompt=consent" 
                           class="btn btn-light border shadow-sm w-100 mt-3 d-flex align-items-center justify-content-center rounded-pill">
                            <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google Logo" width="24" class="me-2">
                            <span class="fw-semibold">Login with Google</span>
                        </a>
                    </div>



                    <div class="mt-3 text-center">
                        <a href="MainController?action=Create" class="text-decoration-none">Create User</a><br>
                        <a href="MainController?action=Shopping" class="text-decoration-none">Weapon Here!</a>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>

