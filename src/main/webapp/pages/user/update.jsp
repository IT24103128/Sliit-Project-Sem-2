<%@ page import="com.example.demo.services.UserManager" %>
<%@ page import="com.example.demo.models.User" %><%--
  Created by IntelliJ IDEA.
  User: Ahamed
  Date: 4/10/2025
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/user-edit.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/header-user.css">
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
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/user/profile-view.jsp">Your Profile</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/user-view.jsp">Booking Details</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/user-view.jsp">Payment History</a>
                <form action="<%=request.getContextPath()%>/user-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                    <input type="submit" value="Logout" class="btn-logout">
                </form>
            </nav>
        </div>
    </div>
</header>

<h2 style="text-align:center;">Update Your Details</h2>

<%
    User currentUser = (User) session.getAttribute("logged-in-user");
%>

<form action="<%=request.getContextPath()%>/user-update" method="post" class="edit-form">
    <input type="hidden" name="id" value="<%=currentUser.getID()%>">
    <table>
        <thead></thead>
        <tbody>
        <tr>
            <th>Name</th>
            <th>:</th>
            <td>
                <input type="text" name="name" value="<%=currentUser.getName()%>" required>
            </td>
        </tr>
        <tr>
            <th>Password</th>
            <th>:</th>
            <td>
                <input type="password" name="password" value="<%=currentUser.getPassword()%>"  required>
            </td>
        </tr>
        <tr>
            <th>Email</th>
            <th>:</th>
            <td>
                <input type="email" name="email" value="<%=currentUser.getEmail()%>"  required>
            </td>
        </tr>
        <tr>
            <th>Gender</th>
            <th>:</th>
            <td>
                <input type="radio" name="gender" value="male" <%=(currentUser.getGender().equals("male"))? "checked": "" %> required> Male
                <input type="radio" name="gender" value="female" <%=(currentUser.getGender().equals("female")? "checked" : "")%> required> Female
            </td>
        </tr>
        <tr>
            <th>Contact Number</th>
            <th>:</th>
            <td>
                <input type="tel" name="contact-no" value="<%= currentUser.getContactNo()%>" required>
            </td>
        </tr>

        <tr>
            <th>Age</th>
            <th>:</th>
            <td>
                <input type="number" min="1" name="age" value="<%= currentUser.getAge()%>" required>
            </td>
        </tr>
        </tbody>
    </table>
    <input type="Submit" value="Update Details" class="update-details-btn">
</form>
</body>
</html>
