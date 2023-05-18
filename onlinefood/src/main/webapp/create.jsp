<%@page import="com.model.*"%>
<%@page import="java.util.*"%>

<head>
<style>
  
  .create-account-container {
    margin: 20px auto;
    width: 400px;
    padding: 20px;
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  .create-account-container h1 {
    text-align: center;
    margin-bottom: 20px;
  }

  .create-account-container label {
    display: block;
    margin-bottom: 5px;
  }

  .create-account-container input[type="text"],
  .create-account-container input[type="email"],
  .create-account-container input[type="password"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }

  .create-account-container input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
  }

  .create-account-container input[type="submit"]:hover {
    background-color: #45a049;
  }

  
</style>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="/includes/head.jsp"%>
<title>Create Account</title>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>
  <div class="create-account-container">
    <h1>Create Account</h1>
    <form action="create-account" method="post" onsubmit="return validateForm()">
      <label for="name">Name:</label>
      <input type="text" name="name" placeholder="Enter your name" required>

      <label for="email">Email:</label>
      <input type="email" name="email" placeholder="Enter email" required>

      <label for="password">Password:</label>
      <input type="password" name="password" required>

      <input type="submit" value="Create Account">
    </form>
  </div>

  <script>
    function validateForm() {
      var name = document.getElementById("name").value;
      var email = document.getElementById("email").value;
      var password = document.getElementById("password").value;

      // Check for empty name field
      if (name == "") {
        alert("Name field is required");
        return false;
      }

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
