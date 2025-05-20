<%@ page import="com.example.demo.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.models.Payment" %>
<%@ page import="com.example.demo.services.PaymentManager" %>
<%--
  Created by IntelliJ IDEA.
  User: Thisurika
  Date: 4/14/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
  <title>Payment History</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header-user.css">
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/payments-user-view.css">
</head>
<body>

<header>
  <div class="header">
    <div>
      <h2 class="header-title">Tutor Booking System</h2>
    </div>
    <div>
      <nav>
        <a class="nav-btn" href="<%=request.getContextPath()%>/pages/tutor/user-view.jsp">Book Tutors</a>
        <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/profile-view.jsp">Your Profile</a>
        <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/user-view.jsp">Booking Details</a>
        <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/payment/user-view.jsp">Payment History</a>
        <form action="<%=request.getContextPath()%>/user-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
          <input type="submit" value="Logout" class="btn-logout">
        </form>
      </nav>
    </div>
  </div>
</header>

<h2>Payment History</h2>

<%
  User currentUser = (User) session.getAttribute("logged-in-user");
  ArrayList<Payment> payments = PaymentManager.getPayments(currentUser.getID());
%>

<% if (!payments.isEmpty()) { %>
<table>
  <thead>
    <tr>
      <th>Payment ID</th>
      <th>Booking ID</th>
      <th>Date</th>
      <th>Time</th>
      <th>Amount (USD)</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <% for (Payment payment : payments) { %>
      <tr>
        <td><%= payment.getID() %></td>
        <td><%= payment.getBookingID() %></td>
        <td><%= payment.getDate() %></td>
        <td><%= payment.getTime() %></td>
        <td>$<%= String.format("%.2f", payment.getAmount()) %></td>
        <td>
          <form action="<%=request.getContextPath()%>/delete-payment" method="post">
            <input type="hidden" value="<%=payment.getID()%>" name="payment-id">
            <input type="submit" value="Delete" class="btn-delete">
          </form>
        </td>
      </tr>
     <% } %>
  </tbody>
</table>
<% } else { %>
  <p class="not-found">No payment history available.</p>
<% } %>

</body>
</html>
