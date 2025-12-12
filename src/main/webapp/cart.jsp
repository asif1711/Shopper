<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.cart.model.CartItem" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Your Cart - MyShop</title>

<style>
    .qty-btn {
        width: 32px;
        height: 32px;
        padding: 0;
        border-radius: 50%;
        font-weight: bold;
    }
    .cart-card {
        border-radius: 12px;
        overflow: hidden;
    }
</style>

</head>

<body>

<div class="container mt-4">

    <h2 class="fw-bold mb-4 text-center">Your Shopping Cart</h2>

    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
    %>

        <div class="alert alert-info mt-4 text-center fs-5 shadow-sm">
            Your cart is empty.
        </div>

    <%
        } else {

            double grandTotal = 0;
    %>

    <div class="card shadow-sm cart-card">
        <div class="table-responsive">
            <table class="table table-hover table-striped align-middle mb-0">
                
                <thead class="table-dark">
                    <tr>
                        <th style="width: 30%">Product</th>
                        <th style="width: 15%">Price</th>
                        <th style="width: 20%">Quantity</th>
                        <th style="width: 15%">Total</th>
                        <th style="width: 15%">Action</th>
                    </tr>
                </thead>

                <tbody>

                    <%
                        for (CartItem item : cart) {
                            double itemTotal = item.getPrice() * item.getQuantity();
                            grandTotal += itemTotal;
                    %>

                    <tr>
                        <!-- Product Name -->
                        <td class="fw-semibold fs-6">
                            <%= item.getName() %>
                        </td>

                        <!-- Price -->
                        <td class="fw-semibold text-success">
                            ₹ <%= item.getPrice() %>
                        </td>

                        <!-- Quantity Controls -->
                        <td>
                            <a href="decreaseQty?id=<%= item.getProductId() %>"
                               class="btn btn-outline-secondary btn-sm qty-btn">-</a>

                            <span class="mx-2 fw-bold"><%= item.getQuantity() %></span>

                            <a href="increaseQty?id=<%= item.getProductId() %>"
                               class="btn btn-outline-secondary btn-sm qty-btn">+</a>
                        </td>

                        <!-- Total Price -->
                        <td class="fw-bold">
                            ₹ <%= itemTotal %>
                        </td>

                        <!-- Remove Button -->
                        <td>
                            <a href="removeFromCart?id=<%= item.getProductId() %>"
                               class="btn btn-danger btn-sm rounded-pill">
                                Remove
                            </a>
                        </td>
                    </tr>

                    <% } %>

                </tbody>

            </table>
        </div>
    </div>

    <!-- Grand Total & Checkout -->
    <div class="text-end mt-4">
        <h3 class="fw-bold">Grand Total: <span class="text-success">₹ <%= grandTotal %></span></h3>
        <a href="checkout" class="btn btn-success btn-lg rounded-pill mt-3 px-4">
            Proceed to Checkout
        </a>
    </div>

    <% } %>

</div>

</body>
</html>
