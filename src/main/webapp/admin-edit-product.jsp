<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cart.dao.ProductDAO, com.cart.model.Product" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp?msg=unauthorized");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    ProductDAO dao = new ProductDAO();
    Product p = dao.getProductById(id);

    if (p == null) {
        response.sendRedirect("admin-products.jsp?msg=error");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Product - Admin</title>

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

    <h2 class="fw-bold text-center mb-4">Edit Product</h2>

    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="admin-form-card">

                <form action="updateProduct" method="post">

                    <input type="hidden" name="id" value="<%= p.getId() %>">

                    <!-- Product Name -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Product Name</label>
                        <input type="text" name="name" class="form-control rounded-pill" 
                               value="<%= p.getName() %>" required>
                    </div>

                    <!-- Description -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Description</label>
                        <textarea name="description" class="form-control" rows="3" 
                                  style="border-radius: 10px;" required><%= p.getDescription() %></textarea>
                    </div>

                    <!-- Price -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Price (₹)</label>
                        <input type="number" step="0.01" name="price" 
                               class="form-control rounded-pill"
                               value="<%= p.getPrice() %>" required>
                    </div>

                    <!-- Image URL -->
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Image URL</label>
                        <input type="text" name="imageUrl" class="form-control rounded-pill"
                               value="<%= p.getImageUrl() %>">
                    </div>

                    <button class="btn btn-warning w-100 rounded-pill fw-semibold">
                        Update Product
                    </button>

                </form>

            </div>

        </div>
    </div>

</div>

</body>
</html>
