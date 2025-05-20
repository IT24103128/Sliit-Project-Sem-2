<%--
  Created by IntelliJ IDEA.
  User: Dasun
  Date: 4/10/2025
--%>
<%@ page import="com.example.demo.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.models.Booking" %>
<%@ page import="com.example.demo.services.BookingManager" %>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<%@ page import="com.example.demo.models.Payment" %>
<%@ page import="com.example.demo.services.PaymentManager" %>
<%@ page session="true" %>
<%
    User currentUser = (User) session.getAttribute("logged-in-user");
    ArrayList<Booking> bookings = BookingManager.getBooking(currentUser.getID());
%>

<html>
<head>
    <title>My Bookings</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header-user.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/bookings-user-view.css">
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

<h2>My Bookings</h2>

<div class="container">
    <div class="booking-list">
        <% if (bookings.isEmpty()) { %>
         <p class="not-found">No Bookings available.</p>

        <% } else {
            for (Booking booking : bookings) {
                Tutor bookedTutor = TutorsManager.findTutor(booking.getTutorID());
                Payment payment = PaymentManager.getPaymentByBookingID(booking.getID());
        %>
        <div class="booking-card">
            <div class="booking-content">
                <div class="booking-image">
                    <img alt="profile-pic" src="<%= request.getContextPath() %>/images/<%= bookedTutor.getGender().equals("male") ? "tutor-male-profile.png" : "tutor-female-profile.png" %>" />
                </div>
                <div class="booking-details">
                    <h3>Booking #<%= booking.getID() %></h3>
                    <p><strong>Tutor Name:</strong> <%= bookedTutor.getName() %></p>
                    <p class="highlight"><strong>Date:</strong> <%= booking.getDate() %></p>
                    <p class="highlight"><strong>Time:</strong> <%= booking.getTime() %></p>
                    <p class="highlight"><strong>Subject:</strong> <%= bookedTutor.getSubject() %></p>
                    <p><strong>Duration:</strong> <%= booking.getDuration() %> hours</p>
                    <p><strong>Fee:</strong> $ <%= (payment != null) ? payment.getAmount() : "0" %></p>
                </div>
                <div>
                    <form method="post" action="<%= request.getContextPath() %>/cancel-booking" onsubmit="return confirm('Are you sure you want to cancel this booked tutor?');">
                        <input type="hidden" name="booking-id" value="<%= booking.getID() %>" />
                        <button type="submit" class="btn-cancel">Cancel</button>
                    </form>

                    <form method="get" action="<%= request.getContextPath() %>/pages/booking/edit.jsp">
                        <input type="hidden" name="booking-id" value="<%= booking.getID() %>" />
                        <input type="hidden" name="tutor-id" value="<%= bookedTutor.getID() %>" />
                        <input type="hidden" name="payment-id" value="<%= (payment != null)? payment.getID() : -1 %>" />
                        <button type="submit" class="btn-edit">Change</button>
                    </form>
                </div>
            </div>
        </div>
        <% } } %>
    </div>
</div>


</body>
</html>
