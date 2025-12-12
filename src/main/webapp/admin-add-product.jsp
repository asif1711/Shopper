<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cart.model.User" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp?msg=unauthorized");
        return;
    }

    String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Product - Admin</title>

<style>
    .admin-form-card {
        border-radius: 14px;
        padding: 25px;
        background: white;
        box-shadow: 0 4px 16px rgba(0,0,0,0.1);
    }
</style>

</head>

<body>

<div class="container mt-4">

    <h2 class="fw-bold text-center mb-4">Add New Product</h2>

    <!-- Success / Error Messages -->
    <%
        if ("added".equals(msg)) {
    %>
        <div class="alert alert-success text-center">Product added successfully!</div>
    <% 
        } else if ("error".equals(msg)) {
    %>
        <div class="alert alert-danger text-center">Failed to add product. Try again.</div>
    <% } %>

    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="admin-form-card">

                <form action="addProduct" method="post">

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Product Name</label>
                        <input type="text" name="name" class="form-control rounded-pill" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Description</label>
                        <textarea name="description" class="form-control" rows="3" style="border-radius: 10px;" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Price (₹)</label>
                        <input type="number" step="0.01" name="price" class="form-control rounded-pill" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Image URL</label>
                        <input type="text" name="imageUrl" class="form-control rounded-pill">
                    </div>

                    <button class="btn btn-primary w-100 rounded-pill">
                        + Add Product
                    </button>

                </form>

            </div>

        </div>
    </div>

</div>

</body>
</html>
