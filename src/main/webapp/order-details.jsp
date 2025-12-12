<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*, com.cart.db.DBConnection" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    int orderId = Integer.parseInt(request.getParameter("id"));

    Connection con = DBConnection.getConnection();
    String sql = "SELECT * FROM order_items WHERE order_id = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, orderId);

    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Order Details - MyShop</title>

<style>
    .order-container {
        border-radius: 14px;
        background: white;
        padding: 25px;
        box-shadow: 0 4px 18px rgba(0,0,0,0.1);
    }
    .summary-box {
        background: #f8f9fa;
        padding: 12px;
        border-radius: 10px;
    }
</style>

</head>

<body>

<div class="container mt-4">

    <h2 class="fw-bold text-center mb-4">Order #<%= orderId %> Details</h2>

    <div class="order-container">

        <table class="table table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th style="width: 35%">Product</th>
                    <th style="width: 20%">Price</th>
                    <th style="width: 15%">Qty</th>
                    <th style="width: 20%">Total</th>
                </tr>
            </thead>

            <tbody>
                <%
                    double grandTotal = 0;

                    while (rs.next()) {
                        double total = rs.getDouble("price") * rs.getInt("quantity");
                        grandTotal += total;
                %>

                <tr>
                    <td class="fw-semibold"><%= rs.getString("product_name") %></td>
                    <td>₹ <%= rs.getDouble("price") %></td>
                    <td><%= rs.getInt("quantity") %></td>
                    <td class="fw-bold text-success">₹ <%= total %></td>
                </tr>

                <% } %>
            </tbody>
        </table>

        <div class="summary-box mt-4">
            <h4 class="fw-semibold text-end">
                Grand Total:
                <span class="text-success fw-bold">₹ <%= grandTotal %></span>
            </h4>
        </div>

        <div class="mt-4">
            <a href="user-orders.jsp" class="btn btn-secondary rounded-pill px-4">
                Back to Orders
            </a>
        </div>

    </div>

</div>

</body>
</html>
