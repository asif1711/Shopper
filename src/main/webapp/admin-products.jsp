<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.cart.dao.ProductDAO, com.cart.model.Product" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp?msg=unauthorized");
        return;
    }

    ProductDAO dao = new ProductDAO();
    List<Product> list = dao.getAllProducts();

    String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Manage Products</title>

<style>
    .admin-card {
        border-radius: 14px;
        padding: 20px;
        background: white;
        box-shadow: 0 4px 16px rgba(0,0,0,0.08);
    }
</style>

</head>

<body>

<div class="container mt-4">

    <h2 class="fw-bold mb-4 text-center">Admin – Product Management</h2>

    <!-- Alert Messages -->
    <%
        if ("added".equals(msg)) {
    %>
        <div class="alert alert-success text-center">Product added successfully!</div>
    <% 
        } else if ("updated".equals(msg)) {
    %>
        <div class="alert alert-primary text-center">Product updated successfully!</div>
    <% 
        } else if ("deleted".equals(msg)) {
    %>
        <div class="alert alert-danger text-center">Product deleted successfully!</div>
    <% 
        } else if ("error".equals(msg)) {
    %>
        <div class="alert alert-warning text-center">Something went wrong!</div>
    <% } %>

    <div class="admin-card">

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="fw-semibold">All Products</h4>
            <a href="admin-add-product.jsp" class="btn btn-primary rounded-pill">
                + Add Product
            </a>
        </div>

        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-dark">
                    <tr>
                        <th style="width: 10%">ID</th>
                        <th style="width: 25%">Name</th>
                        <th style="width: 20%">Price</th>
                        <th style="width: 20%">Actions</th>
                    </tr>
                </thead>

                <tbody>

                    <%
                        for (Product p : list) {
                    %>

                    <tr>
                        <td><%= p.getId() %></td>
                        <td class="fw-semibold"><%= p.getName() %></td>
                        <td class="text-success fw-bold">₹ <%= p.getPrice() %></td>
                        <td>

                            <a href="admin-edit-product.jsp?id=<%= p.getId() %>"
                               class="btn btn-warning btn-sm rounded-pill px-3">
                                Edit
                            </a>

                            <a href="deleteProduct?id=<%= p.getId() %>"
                               class="btn btn-danger btn-sm rounded-pill px-3 ms-2"
                               onclick="return confirm('Are you sure you want to delete this product?');">
                                Delete
                            </a>

                        </td>
                    </tr>

                    <% } %>

                </tbody>
            </table>

            <% if (list.isEmpty()) { %>
                <div class="alert alert-info text-center mt-3">
                    No products found.
                </div>
            <% } %>

        </div>
    </div>

</div>

</body>
</html>
