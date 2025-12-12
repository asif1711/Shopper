<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>

<body class="bg-light">

<div class="container">
  <div class="row justify-content-center mt-5">
    <div class="col-md-4">

      <div class="card shadow">
        <div class="card-body">
          <h3 class="text-center mb-4">Login</h3>

          <% 
              String msg = request.getParameter("msg");
              if ("success".equals(msg)) {
          %>
              <div class="alert alert-success">Registration successful. Please login.</div>
          <% } else if ("invalid".equals(msg)) { %>
              <div class="alert alert-danger">Invalid email or password.</div>
          <% } else if ("logout".equals(msg)) { %>
              <div class="alert alert-warning">You have been logged out.</div>
          <% } else if ("unauthorized".equals(msg)) { %>
        	  <div class="alert alert-danger">You are not authorized to access that page.</div>
		  <%
    		 }%>

          <form action="login" method="post">
            <div class="mb-3">
              <label>Email</label>
              <input type="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
              <label>Password</label>
              <input type="password" name="password" class="form-control" required>
            </div>

            <button class="btn btn-dark w-100">Login</button>
          </form>

        </div>
      </div>

    </div>
  </div>
</div>

</body>
</html>
