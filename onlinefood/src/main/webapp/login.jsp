<%@page import="com.model.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://localhost:8080/online_food_order_system/styles/loginstyle.css">
<%@include file="/includes/head.jsp"%>
<title>Login Page</title>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>
  <div class="login-container">
    <h1>Login</h1>
    <form action="user-login" method="post" onsubmit="return validateForm()">
      <label for="email">Email:</label>
      <input type="email" name="login-email" placeholder="Enter email" required>

      <label for="password">Password:</label>
      <input type="password" name="login-password" required>

      <input type="submit" value="Login">
    </form>
     <button onclick="window.location.href='create.jsp'">Create Account</button>
  </div>

  <script>
    function validateForm() {
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;

      // Check for empty email field
      if (email == "") {
        alert("Email field is required");
        return false;
      }

      // Check for invalid email format
      var emailRegex = /\S+@\S+\.\S+/;
      if (!emailRegex.test(email)) {
        alert("Invalid email format");
        return false;
      }

      // Check for empty password field
      if (password == "") {
        alert("Password field is required");
        return false;
      }

      return true;
    }
  </script>
</body>
</html>
