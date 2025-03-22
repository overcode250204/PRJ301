<%-- 
    Document   : orderSuccess
    Created on : Mar 19, 2025, 10:31:23 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-lg p-4 text-center" style="max-width: 400px;">
            <div class="card-body">
                <h2 class="text-success fw-bold">🎉 Order Successful!</h2>
                <p class="mt-3">Your order has been placed successfully.</p>
                <a href="MainController?action=Shopping" class="btn btn-primary mt-3">Back to Shopping</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
