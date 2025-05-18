<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/2/2025
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Tutor</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/add-tutor.css">
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
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/tutor/admin-view.jsp">Tutor Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/admin-view.jsp">User Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/review/admin-view.jsp">Review Management</a>
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

<h2>Enter Tutor Details</h2>

<form action="<%=request.getContextPath()%>/add-tutor" method="POST" class="add-tutor-form">
    <table>
        <tr>
            <th><label for="email">Email</label></th>
            <th>:</th>
            <td> <input type="email" id="email" name="email" required> </td>
        </tr>
        <tr>
            <th><label for="name">Name</label></th>
            <th>:</th>
            <td><input type="text" id="name" name="name" required></td>
        </tr>

        <tr>
            <th><label for="contact-no">Phone No.</label></th>
            <th>:</th>
            <td><input type="tel" id="contact-no" name="contact-no" required></td>
        </tr>

        <tr>
            <th><label for="age">Age</label></th>
            <th>:</th>
            <td><input type="number" id="age" name="age" min="1" max="200" required></td>
        </tr>

        <tr>
            <th><label for="gender">Gender</label></th>
            <th>:</th>
            <td id="gender">
                <input type="radio" name="gender" value="male" required> Male
                <input type="radio" name="gender" value="female" required> Female
            </td>
        </tr>

        <tr>
            <th><label for="subject">Subject</label></th>
            <th>:</th>
            <td><input type="text" id="subject" name="subject" required></td>
        </tr>

        <tr>
            <th><label for="subject-expertise">Subject Expertise</label></th>
            <th>:</th>
            <td><input type="number" id="subject-expertise" name="subject-expertise" min="0" max="5" required></td>
        </tr>

        <tr>
            <th><label for="cost-per-hour">Cost per Hour</label></th>
            <th>:</th>
            <td><input type="number" id="cost-per-hour" name="cost-per-hour" min="1" required></td>
        </tr>
    </table>
    <input type="submit" value="Add Tutor" class="add-tutor-submit-btn">
</form>

</body>
</html>