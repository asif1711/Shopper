<%@ page import="com.cart.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">

    <a class="navbar-brand fw-bold" href="home.jsp">MyShopr</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">

        <% if (user == null) { %>

            <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
            <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>

        <% } else { %>

            <li class="nav-item"><a class="nav-link" href="products.jsp">Products</a></li>
            <li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a></li>
            <li class="nav-item"><a class="nav-link" href="user-orders.jsp">My Orders</a></li>

            <% if ("ADMIN".equals(user.getRole())) { %>
                <li class="nav-item"><a class="nav-link" href="admin-products.jsp">Manage Products</a></li>
            <% } %>

            <li class="nav-item"><span class="nav-link">Hi, <%= user.getName() %></span></li>
            <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>

        <% } %>

      </ul>
    </div>
  </div>
</nav>
