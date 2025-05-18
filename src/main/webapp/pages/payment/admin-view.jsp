<%@ page import="com.example.demo.models.Payment" %>
<%@ page import="com.example.demo.services.PaymentManager" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Thisurika
  Date: 4/11/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin : Payment History</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/admin-dashboard.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header-admin.css">
</head>
<body>

<header>
    <div class="header">
        <div>
            <h2 class="header-title">Tutor Booking System</h2>
        </div>
        <div>
            <nav>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/tutor/admin-view.jsp">Tutor Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/admin-view.jsp">User Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/review/admin-view.jsp">Review Management</a>
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/payment/admin-view.jsp">Payment History</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/admin-view.jsp">Booking History</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/admin/admin-view.jsp">Admin Management</a>
                <form action="<%=request.getContextPath()%>/admin-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                    <input type="submit" value="Logout" class="btn-logout">
                </form>
            </nav>
        </div>
    </div>
</header>
<h2> Payment History </h2>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Boooking ID</th>
        <th>User ID</th>
        <th>Date</th>
        <th>Time</th>
        <th>Amount</th>
    </tr>
    </thead>
    <tbody>
    <%
        PaymentManager.readPayments();
        ArrayList<Payment> Payments = PaymentManager.getPayments();
        if (!Payments.isEmpty()) {
            for (Payment Payment : Payments) {
    %>
    <tr>
        <td><%= Payment.getID() %></td>
        <td><%= Payment.getBookingID() %></td>
        <td><%= Payment.getUserID() %></td>
        <td><%= Payment.getDate() %></td>
        <td><%= Payment.getTime() %></td>
        <td><%= Payment.getAmount() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="6">No Payments History available</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
