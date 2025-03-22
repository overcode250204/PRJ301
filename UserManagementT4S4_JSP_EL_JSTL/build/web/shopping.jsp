<%-- 
    Document   : shopping
    Created on : Mar 7, 2025, 4:06:41 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>HT Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow p-4" style="width: 450px;">
                <h3 class="text-center text-primary">Welcome to Weapon Family</h3>

                <c:if test="${not empty requestScope.MESSAGE}">
                    <div class="alert alert-info text-center">${requestScope.MESSAGE}</div>
                </c:if>

                <form action="MainController" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Select your baby:</label>

                        <select name="product" class="form-select">
                            <c:forEach var="product" items="${sessionScope.LIST_PRODUCT}">
                                <option value="${product.id}-${product.name}-${product.price}">${product.id}-${product.name}-${product.price}</option>
                            </c:forEach>
                        </select>

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quantity:</label>
                        <select name="quantity" class="form-select">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="10">10</option>
                        </select>
                    </div>

                    <div class="d-grid gap-2">
                        <input type="submit" name="action" value="Add" class="btn btn-success">
                        <input type="submit" name="action" value="View" class="btn btn-primary">
                    </div>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

