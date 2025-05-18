<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<%--
  Created by IntelliJ IDEA.
  User: Thisurika
  Date: 4/10/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    int tutorID = Integer.parseInt(request.getParameter("tutorID"));
    Tutor currentTutor = TutorsManager.findTutor(tutorID);
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    double duration = Double.parseDouble(request.getParameter("duration"));
%>
<html>
<head>
    <title>Payment</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/payment-form.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header-user.css">
</head>
<body>

<header>
    <div class="header">
        <div>
            <h2 class="header-title">Tutor Booking System</h2>
        </div>
        <div>
            <nav>
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/tutor/user-view.jsp">Book Tutors</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/profile-view.jsp">Your Profile</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/user-view.jsp">Booking Details</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/user-view.jsp">Payment History</a>
                <form action="<%=request.getContextPath()%>/user-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                    <input type="submit" value="Logout" class="btn-logout">
                </form>
            </nav>
        </div>
    </div>
</header>

<h2>Card Payment</h2>

<div class="payment-container">
    <form action="<%= request.getContextPath()%>/book-and-pay" method="post">
        <input type="hidden" name="tutor-id" value="<%= tutorID %>">
        <input type="hidden" name="date" value="<%= date %>">
        <input type="hidden" name="time" value="<%= time %>">
        <input type="hidden" name="duration" value="<%= duration %>">

        <table>
            <tr>
                <th>Amount</th>
                <th>:</th>
                <td><strong>$<%= currentTutor.calculateCost(duration) %></strong></td>
            </tr>
            <tr>
                <th>Cardholder Name</th>
                <th>:</th>
                <td><input type="text" name="cardName" required></td>
            </tr>
            <tr>
                <th>Card Number</th>
                <th>:</th>
                <td><input type="text" name="cardNumber" maxlength="16" pattern="\d{16}" placeholder="1234 5678 9012 3456" required></td>
            </tr>
            <tr>
                <th>Expiry Date</th>
                <th>:</th>
                <td><input type="month" name="expiry" required></td>
            </tr>
            <tr>
                <th>CVV</th>
                <th>:</th>
                <td><input type="password" name="cvv" maxlength="4" pattern="\d{3,4}" required></td>
            </tr>
        </table>

        <input type="submit" class="btn-pay" value="Pay Now"/>
    </form>
</div>

</body>
</html>
