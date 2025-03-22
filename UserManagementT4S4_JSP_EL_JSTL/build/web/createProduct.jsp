<%-- 
    Document   : createProduct
    Created on : Mar 21, 2025, 12:26:14 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Create Product Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <div class="container mt-5">
            <div class="card shadow-sm p-4">
                <h2 class="text-center text-primary mb-3">Create New Product</h2>


                <c:if test="${not empty requestScope.MESSAGE}">
                    <div class="alert alert-success text-center">
                        ${requestScope.MESSAGE}
                    </div>
                </c:if>             

                <form action="MainController" method="POST" class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Product ID</label>
                        <input type="text" name="productID" class="form-control" required="">
                        <c:if test="${not empty requestScope.ERROR.productIDError}">
                            <small class="text-danger">${requestScope.ERROR.productIDError}</small>
                        </c:if>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" maxlength="20" required="">
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Price</label>
                        <input type="number" name="price" class="form-control" min="0"required="">
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Quantity</label>
                        <input type="number" name="quantity" class="form-control" min="0" required="">
                    </div>

                    <div class="col-12 text-center mt-3">
                        <button type="submit" name="action" value="CreateProduct" class="btn btn-success px-4">Create Product</button>
                    </div>
                </form>
            </div>
            <div class="col-12 text-center mt-3">
                <a href="MainController?action=ViewProduct" class="btn btn-primary px-4">View Products</a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

