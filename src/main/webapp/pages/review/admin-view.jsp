<%--
  Created by IntelliJ IDEA.
  User: Akash
  Date: 4/2/2025
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.models.Review" %>
<%@ page import="com.example.demo.services.ReviewManager" %>
<html>
<head>
    <title>Admin : Reviews</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/admin-dashboard.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/header-admin.css">
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
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/review/admin-view.jsp">Review Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/admin-view.jsp">Payment History</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/admin-view.jsp">Booking History</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/admin/admin-view.jsp">Admin Management</a>
                <form action="<%=request.getContextPath()%>/admin-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                    <input type="submit" value="Logout" class="btn-logout">
                </form>
            </nav>
        </div>
    </div>
</header>

<h2> Reviews </h2>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Tutor ID</th>
        <th>Comment</th>
        <th>Rating</th>
        <th>Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        ReviewManager.readReviews();
        ArrayList<Review> reviews = ReviewManager.getReviews();
        if (!reviews.isEmpty()) {
            for (Review review : reviews) {
    %>
    <tr>
        <td><%= review.getID() %></td>
        <td><%= review.getUserID() %></td>
        <td><%= review.getTutorID() %></td>
        <td><%= (review.getComment().length() < 20) ? review.getComment() : review.getComment().substring(0, 20) %></td>
        <td><%= review.getRating() %></td>
        <td><%= review.getDate() %></td>
        <td>
            <form action="<%=request.getContextPath()%>/delete-review" method="post"
                  onsubmit="return confirm('Are you sure you want to delete this review?');">
                <input type="hidden" name="review-id" value="<%= review.getID() %>">
                <input type="submit" class="btn-remove" value="Delete">
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
            <td colspan="7">No Reviews Available</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
