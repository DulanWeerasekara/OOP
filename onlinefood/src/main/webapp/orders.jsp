<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="com.connection.DbCon"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
    request.setAttribute("person", auth);
    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
    orders = orderDao.userOrders(auth.getId());
} else {
    response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
             background-image: url('styles/backgr.jpg');
        }
        
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #dddddd;
        }
        
        th {
            background-color: #f9f9f9;
        }
        
        .cancel-button {
            padding: 5px 10px;
            background-color: #ff0000;
            color: #ffffff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .cancel-button:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>
    <%@include file="/includes/navbar.jsp"%>
    <div class="container">
        <div class="card-header my-3">All Orders</div>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Cancel</th>
                </tr>
            </thead>
            <tbody>
                <%
                if (orders != null) {
                    for (Order o : orders) {
                %>
                <tr>
                    <td><%=o.getDate() %></td>
                    <td><%=o.getName() %></td>
                    <td><%=o.getCategory() %></td>
                    <td><%=o.getQunatity() %></td>
                    <td>Rs.<%=dcf.format(o.getPrice()) %></td>
                    <td><a class="cancel-button" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
                </tr>
                <%
                    }
                }
                %>
            </tbody>
        </table>
    </div>
    <%@include file="/includes/footer.jsp"%>
</body>
</html>
