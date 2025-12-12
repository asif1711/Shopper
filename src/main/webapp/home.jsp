<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Home - MyShop</title>
</head>

<body>

<!-- ===== Hero Section ===== -->
<div class="container mt-4">
    <div class="p-5 bg-dark text-white rounded-4 shadow">
        <h1 class="fw-bold display-5">Welcome to MyShopr</h1>
        <p class="mt-2" style="font-size: 1.1rem;">
            Discover amazing deals and top-quality products at the best prices.
        </p>
        <a href="products.jsp" class="btn btn-success btn-lg mt-3 rounded-pill px-4">Shop Now</a>
    </div>
</div>

<!-- ===== Featured Section ===== -->
<div class="container mt-5">
    <h3 class="fw-bold text-center mb-4">Why Shop With Us?</h3>

    <div class="row g-4">

        <div class="col-md-4">
            <div class="card shadow text-center p-4">
                <h4 class="fw-semibold">Fast Delivery</h4>
                <p class="text-muted">We deliver your orders quickly and safely.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow text-center p-4">
                <h4 class="fw-semibold">Best Prices</h4>
                <p class="text-muted">Unbeatable pricing with premium quality.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow text-center p-4">
                <h4 class="fw-semibold">Secure Payments</h4>
                <p class="text-muted">Your payments and data are always protected.</p>
            </div>
        </div>

    </div>
</div>

</body>
</html>
