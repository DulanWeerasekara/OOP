<nav>
    <link rel="stylesheet" href="styles/navbarstyle.css">
    <div class="left-section">
        <h1>E-Food</h1>
    </div>
    <div class="right-section">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="cart.jsp">Cart <span style="color: red;">(${cart_list.size()})</span></a></li>
            <% if (auth != null) { %>
                <li><a href="orders.jsp">Order</a></li>
                <li><a href="account-details">Profile</a></li>
                <li><a href="log-out">Logout</a></li>
            <% } else { %>
                <li><a href="login.jsp">Login</a></li>
            <% } %>
        </ul>
    </div>
</nav>
