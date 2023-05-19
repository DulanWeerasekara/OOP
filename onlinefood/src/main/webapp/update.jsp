<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.dao.*" %>
<%@page import="com.connection.*" %>

<head>
    <style>
        /* Styles for the edit user form */
        .edit-user-form {
            max-width: 400px;
            margin: 0 auto;
        }

        .edit-user-form label {
            display: block;
            margin-bottom: 10px;
        }

        .edit-user-form input[type="text"],
        .edit-user-form input[type="email"],
        .edit-user-form input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }

        .edit-user-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }

        .edit-user-form input[type="submit"]:hover {
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
    <div class="edit-user-form">
        <h2>Edit User</h2>
        <% 
    User user = (User) request.getSession().getAttribute("auth");
    UserDao userDao = new UserDao(DbCon.getConnection());
    if (user != null) {
        User userDetails = userDao.getUserById(user.getId());
        if (userDetails != null) {
    %>
        <form action="update-user" method="post">
            <input type="hidden" name="id" value="<%= userDetails.getId() %>">
            <label for="name">Name:</label>
            <input type="text" name="name" value="<%= userDetails.getName() %>" required>
            <label for="email">Email:</label>
            <input type="email" name="email" value="<%=userDetails.getEmail() %>" required>
            <label for="password">Password:</label>
            <input type="password" name="password" value="<%= userDetails.getPassword() %>" required>
            <input type="submit" value="Save Changes">
        </form>
        <% 
        }
    }
    %>
    </div>
</body>
</html>
