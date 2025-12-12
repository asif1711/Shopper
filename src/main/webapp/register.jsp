<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>
</head>

<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
    <div class="card shadow p-4 col-md-5 col-sm-9" style="border-radius: 14px;">
        
        <h3 class="text-center mb-4 fw-bold">Create Account</h3>

        <!-- Message Section -->
        <%
            String msg = request.getParameter("msg");
            if ("exists".equals(msg)) {
        %>
            <div class="alert alert-warning">Email already exists!</div>
        <% } %>

        <!-- Registration Form -->
        <form action="register" method="post">

            <div class="mb-3">
                <label class="form-label fw-semibold">Full Name</label>
                <input type="text" name="name" class="form-control rounded-pill" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Email</label>
                <input type="email" name="email" class="form-control rounded-pill" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Password</label>
                <input type="password" name="password" class="form-control rounded-pill" required>
            </div>

            <button class="btn btn-success w-100 rounded-pill">Register</button>

            <p class="text-center mt-3">
                Already have an account?
                <a href="login.jsp" class="text-decoration-none">Login</a>
            </p>
        </form>

    </div>
</div>

</body>
</html>
