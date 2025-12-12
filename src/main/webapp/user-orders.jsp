<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.cart.dao.OrderDAO, com.cart.model.User" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    OrderDAO dao = new OrderDAO();
    List<Map<String, Object>> orders = dao.getOrdersByUser(user.getEmail());
%>

<!DOCTYPE html>
<html>
<head>
<title>My Orders - MyShop</title>

<style>
    .order-card {
        border-radius: 14px;
        transition: 0.2s ease;
    }
    .order-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 6px 18px rgba(0,0,0,0.12);
    }
</style>

</head>

<body>

<div class="container mt-4">

    <h2 class="fw-bold text-center mb-4">My Orders</h2>

    <%
        if (orders.isEmpty()) {
    %>

        <div class="alert alert-info text-center fs-5 mt-4 shadow-sm">
            You haven't placed any orders yet.
        </div>

    <%
        } else {
    %>

    <div class="row g-4">

        <%
            for (Map<String, Object> order : orders) {
        %>

        <div class="col-md-6">
            <div class="card order-card shadow-sm p-3">

                <h5 class="fw-semibold">Order #<%= order.get("id") %></h5>

                <p class="text-muted mb-1">
                    Placed On:
                    <span class="fw-semibold"><%= order.get("date") %></span>
                </p>

                <p class="mb-2">
                    <span class="fw-bold text-success">
                        Total: ₹ <%= order.get("total") %>
                    </span>
                </p>

                <a href="order-details.jsp?id=<%= order.get("id") %>" 
                   class="btn btn-primary rounded-pill w-100">
                   View Items
                </a>

            </div>
        </div>

        <% } %>

    </div>

    <% } %>

</div>

</body>
</html>
