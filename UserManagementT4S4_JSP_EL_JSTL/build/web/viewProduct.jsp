<%-- 
    Document   : viewProduct
    Created on : Mar 20, 2025, 4:43:32 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Product Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-4">
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <div class="card shadow-sm p-4">
            <h2 class="text-center text-primary mb-3">Product List</h2>
            
            <div class="text-end mb-3">
                <a href="admin.jsp" class="btn btn-secondary">Back to Admin</a>
            </div>

            <form action="MainController" method="POST" class="d-flex mb-3">
                <input type="text" name="searchProduct" value="${param.searchProduct}" class="form-control me-2">
                <input type="submit" name="action" value="SearchProduct" class="btn btn-primary">
            </form>

            <c:if test="${requestScope.LIST_PRODUCT != null}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-dark text-center">
                            <tr>
                                <th>ProductID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Edit</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                                <tr>
                                    <form action="MainController" method="POST">
                                        <td>
                                            <input type="text" class="form-control" value="${product.id}" readonly>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" name="name" value="${product.name}" required>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control" name="price" value="${product.price}" required>
                                        </td>
                                        <td>
                                            <input type="number" class="form-control" name="quantity" value="${product.quantity}">
                                        </td>
                                        <td class="text-center">
                                            <input type="hidden" name="productID" value="${product.id}">
                                            <input type="hidden" name="searchProduct" value="${param.searchProduct}">
                                            <input type="submit" class="btn btn-warning btn-sm" name="action" value="UpdateProduct">
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${not empty requestScope.CONFIRM_DELETE and requestScope.PRODUCT_ID eq product.id}">
                                                <div class="alert alert-warning text-center p-2">
                                                    Order detail related to <strong>${product.id}</strong> must be deleted when confirming.
                                                </div>
                                                <a href="MainController?action=DeleteProduct&productID=${product.id}&confirmDelete=true" class="btn btn-danger btn-sm">Confirm Delete</a>
                                            </c:if>
                                            
                                            <c:if test="${empty requestScope.CONFIRM_DELETE or requestScope.PRODUCT_ID ne product.id}">
                                                <c:url var="deleteProductLink" value="MainController">
                                                    <c:param name="action" value="DeleteProduct"/>
                                                    <c:param name="productID" value="${product.id}"/>
                                                    <c:param name="searchProduct" value="${param.search}"/>
                                                </c:url>
                                                <a href="${deleteProductLink}" class="btn btn-danger btn-sm">Delete</a>
                                            </c:if>
                                        </td>
                                    </form>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <div class="text-center text-danger">${requestScope.ERROR}</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
