<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.dao.*" %>
<%@page import="com.connection.*" %>

<head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    .account-details-container {
        max-width: 800px;
        margin: 50px auto;
        background-color: #ffffff;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .card {
        display: flex;
        flex-direction: column;
        padding: 20px;
        border-radius: 5px;
        background-color: #f9f9f9;
        margin-bottom: 20px;
    }

    .card-label {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .card-value {
        margin-bottom: 20px;
    }

    .action-buttons {
        display: flex;
        justify-content: flex-end;
    }

    .action-button {
        margin-left: 10px;
        padding: 5px 10px;
        background-color: #4caf50;
        color: #ffffff;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    .action-button:hover {
        background-color: #45a049;
    }
</style>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth == null) {
		response.sendRedirect("index.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="/includes/head.jsp"%>
</head>

<body>
<%@include file="/includes/navbar.jsp"%>
<div class="account-details-container">
    <h1>Account Details</h1>
    <% 
    User user = (User) request.getSession().getAttribute("auth");
    UserDao userDao = new UserDao(DbCon.getConnection());
    if (user != null) {
        User userDetails = userDao.getUserById(user.getId());
        if (userDetails != null) {
    %>
    <div class="card">
        <span class="card-label">ID:</span>
        <span class="card-value"><%= userDetails.getId() %></span>
        <span class="card-label">Name:</span>
        <span class="card-value"><%= userDetails.getName() %></span>
        <span class="card-label">Email:</span>
        <span class="card-value"><%= userDetails.getEmail() %></span>
        <div class="action-buttons">
            <button class="action-button" onclick="editAccount()">Edit</button>
            <button class="action-button" onclick="deleteAccount()">Delete</button>
            
        </div>
    </div>
    <% 
        }
    }
    %>

    <script>
        function editAccount() {
            // Redirect to edit account page or perform necessary action
            window.location.href = "update.jsp";
        }

        function deleteAccount() {
            // Perform delete account action, show confirmation dialog if needed
            // Redirect to account deletion confirmation page or perform necessary action
            window.location.href = "delete-user";
        }
    </script>
</div>
</body>
</html>
