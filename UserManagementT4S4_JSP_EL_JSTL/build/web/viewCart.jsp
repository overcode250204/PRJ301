<%-- 
    Document   : viewCart
    Created on : Mar 7, 2025, 4:52:17 PM
    Author     : ACER
--%>

<%@page import="model.ProductDTO"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Cart Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container my-5">
            <h1 class="text-center text-primary">Your Weapon Cart</h1>
            <div class="d-flex justify-content-between mb-3">
                <a href="shopping.jsp" class="btn btn-secondary">Back to Shopping</a>
                <a href="MainController?action=Logout" class="btn btn-danger">Logout</a>
            </div>



            <c:if test="${not empty requestScope.ERROR}">
                <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
                    <strong>Error!</strong> ${requestScope.ERROR}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${not empty sessionScope.CART.cart}">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped text-center">
                        <thead class="table-dark">
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Edit</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="count" value="1"/>
                            <c:forEach var="product" items="${sessionScope.CART.cart.values()}">
                                <tr>
                            <form action="MainController" method="POST">
                                <td>${count}</td>
                                <td>
                                    <input type="text" name="id" value="${product.id}" class="form-control text-center" readonly>
                                </td>
                                <td>${product.name}</td>
                                <td>$${product.price}</td>
                                <td>
                                    <input type="number" name="quantity" value="${product.quantity}" min="1" class="form-control text-center">
                                </td>
                                <td>$${product.price * product.quantity}</td>
                                <td>
                                    <input type="submit" name="action" value="Edit" class="btn btn-warning btn-sm">
                                </td>
                                <td>
                                    <input type="submit" name="action" value="Remove" class="btn btn-danger btn-sm">
                                </td>
                            </form>
                            </tr>
                            <c:set var="count" value="${count + 1}"/>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-4">
                    <h3 class="text-danger">Total: <strong>${sessionScope.CART.getTotalPrice()}$</strong></h3>
                    <div>
                        <a href="MainController?action=Shopping" class="btn btn-success me-2">Add More Weapons</a>
                        <form action="CheckoutController" method="POST" class="d-inline">
                            <input type="submit" name="action" value="Checkout" class="btn btn-primary px-4 py-2 fw-bold">
                        </form>
                    </div>
                </div>
            </c:if>


            <c:if test="${empty sessionScope.CART.cart}">
                <h2 class="text-center text-muted">Your cart is empty!</h2>
            </c:if>

            <c:if test="${sessionScope.LOGIN_USER == null}">
                <div class="text-center my-3">
                    <a href="MainController" class="btn btn-danger">Back to Login</a>
                </div>
            </c:if>

            <a href="MainController?action=ViewOrder" class="btn btn-info">View Order</a>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

