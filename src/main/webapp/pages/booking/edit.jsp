<%--
  Created by IntelliJ IDEA.
  User: Dasun
  Date: 4/2/2025
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<%@ page import="com.example.demo.models.Booking" %>
<%@ page import="com.example.demo.services.BookingManager" %>
<%@ page import="com.example.demo.models.Payment" %>
<%@ page import="com.example.demo.services.PaymentManager" %>
<html>
<head>
    <title>Add New Tutor</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/edit-booking.css">
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
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/tutor/user-view.jsp">Book Tutors</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/profile-view.jsp">Your Profile</a>
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/booking/user-view.jsp">Booking Details</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/user-view.jsp">Payment History</a>
                <form action="<%=request.getContextPath()%>/user-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                    <input type="submit" value="Logout" class="btn-logout">
                </form>
            </nav>
        </div>
    </div>
</header>

<h2>Update Booking Details</h2>
<%
    int tutorID = Integer.parseInt((String) request.getParameter("tutor-id"));
    int paymentID = Integer.parseInt((String) request.getParameter("payment-id"));
    int bookingID = Integer.parseInt((String) request.getParameter("booking-id"));
    Tutor tutor = TutorsManager.findTutor(tutorID);
    Booking booking = BookingManager.findBooking(bookingID);
    Payment payment = PaymentManager.findPayment(paymentID);
    if (tutor == null) {
%>
<h2>Something went wrong!</h2>
<%
        return;
    }
%>

<form action="<%=request.getContextPath()%>/update-booking" method="POST" class="booking-form">
    <h1>Booking ID : <%=booking.getID() %> </h1>

    <div class="booking-image">
        <img alt="profile-pic" src="<%= request.getContextPath() %>/images/<%= tutor.getGender().equals("male") ? "tutor-male-profile.png" : "tutor-female-profile.png" %>" />
    </div>

    <input type="hidden" name="booking-id" value="<%= booking.getID() %>" />

    <table>
        <tr>
            <th><label for="tutor-name">Tutor Name</label></th>
            <th>:</th>
            <td><input type="text" value="<%= tutor.getName() %>" id="tutor-name" readonly></td>
        </tr>
        <tr>
            <th><label for="subject">Name</label></th>
            <th>:</th>
            <td><input type="text" value="<%= tutor.getSubject() %>" id="subject" readonly></td>
        </tr>

        <tr>
            <th><label for="booking-date">Book Date</label></th>
            <th>:</th>
            <td><input type="date" name="booking-date" value="<%= booking.getDate() %>" id="booking-date" required></td>
        </tr>

        <tr>
            <th><label for="booking-time">Book Date</label></th>
            <th>:</th>
            <td><input type="time" name="booking-time" value="<%= booking.getTime() %>" id="booking-time" required></td>
        </tr>

        <tr>
            <th><label for="fee">Fee</label></th>
            <th>:</th>
            <td><input type="number" id="fee" name="fee" value='<%= (payment != null)? payment.getAmount() : "History Removed"%>' readonly></td>
        </tr>

    </table>
    <input type="submit" value="Update Booking Details" class="update-details-btn">
</form>

</body>
</html>