<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.cart.dao.ProductDAO, com.cart.model.Product" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Products - MyShop</title>
</head>

<body>

<div class="container mt-4">

    <h2 class="fw-bold mb-4 text-center">Explore Our Products</h2>

    <div class="row g-4">
        <%
            ProductDAO dao = new ProductDAO();
            List<Product> list = dao.getAllProducts();

            for (Product p : list) {
        %>

        <!-- PRODUCT CARD -->
        <div class="col-md-3 col-sm-6">
            <div class="card h-100 shadow-sm" style="border-radius: 14px; overflow: hidden;">
                
                <!-- Product Image -->
                <img 
                    src="<%= p.getImageUrl() %>" 
                    class="card-img-top" 
                    style="height: 220px; object-fit: cover;"
                >

                <div class="card-body d-flex flex-column">

                    <h5 class="fw-semibold">
                        <%= p.getName() %>
                    </h5>

                    <p class="text-muted" style="font-size: 14px;">
                        <%= p.getDescription() %>
                    </p>

                    <h5 class="text-success fw-bold mt-auto">
                        ₹ <%= p.getPrice() %>
                    </h5>

                    <a href="addToCart?id=<%= p.getId() %>" 
                       class="btn btn-dark w-100 rounded-pill mt-2">
                        Add to Cart
                    </a>

                </div>

            </div>
        </div>

        <% } %>
    </div>

    <% if (list.isEmpty()) { %>
        <div class="alert alert-info mt-4 text-center">
            No products available at the moment.
        </div>
    <% } %>

</div>

</body>
</html>
