<%-- 
    Document   : viewOrder
    Created on : Mar 22, 2025, 1:31:59 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Order Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body class="bg-light">

        <div class="container mt-4">
            <h2 class="text-center text-primary mb-4">Order List</h2>


            <c:if test="${not empty requestScope.VIEW_ORDER}">
                <c:forEach var="order" items="${requestScope.VIEW_ORDER}">
                    <div class="card shadow-lg mb-4 rounded-3">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0"> Order ID: ${order.orderID} |  Total: <strong>${order.total} $</strong></h5> | Date ${order.date}
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered table-hover table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="detail" items="${order.orderDetails}">
                                        <tr>
                                            <td>${detail.product.name}</td>
                                            <td>${detail.price} $</td>
                                            <td>${detail.quantity}</td>
                                            
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${not empty requestScope.ERROR}">
                <div class="alert alert-danger text-center shadow-sm">
                     ${requestScope.ERROR}
                </div>
            </c:if>


            <div class="text-center mt-4">
                <a href="shopping.jsp" class="btn btn-lg btn-outline-primary px-4 py-2 shadow-sm">
                    Back To Shopping
                </a>
            </div>
        </div>

    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>

