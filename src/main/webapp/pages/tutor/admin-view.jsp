<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/2/2025
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<html>
<head>
    <title>Admin : Tutors</title>
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

<h2> Tutor List </h2>

<div>
    <form action="<%=request.getContextPath()%>/pages/tutor/add.jsp" method="get">
        <button type="submit" class="add-button">
            + Add New Tutor
        </button>
    </form>
</div>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Email</th>
        <th>Name</th>
        <th>Contact No.</th>
        <th>Age</th>
        <th>Gender</th>
        <th>Subject</th>
        <th>Subject Expertise</th>
        <th>Cost per Hour</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        TutorsManager.readTutors();
        ArrayList<Tutor> tutors = TutorsManager.getTutorsAsArrayList();
        if (!tutors.isEmpty()) {
            for (Tutor tutor : tutors) {
    %>
    <tr>
        <td><%= tutor.getID() %></td>
        <td><%= tutor.getEmail() %></td>
        <td><%= tutor.getName() %></td>
        <td><%= tutor.getContactNo() %></td>
        <td><%= tutor.getAge() %></td>
        <td><%= tutor.getGender() %></td>
        <td><%= tutor.getSubject() %></td>
        <td><%= tutor.getSubjectExpertise() %></td>
        <td><%= tutor.getCostPerHour() %></td>
        <td class="action-button-container">
            <form action="<%=request.getContextPath()%>/remove-tutor" method="post" onsubmit="return confirm('Are you sure you want to delete this tutor?');">
                <input type="hidden" name="tutor-id" value="<%= tutor.getID() %>">
                <input type="submit" class="btn-remove" value="Delete">
            </form>
            <form action="<%=request.getContextPath()%>/pages/tutor/update.jsp" method="get" onsubmit="return confirm('Are you sure you want to edit this tutor?');">
                <input type="hidden" name="tutor-id" value="<%= tutor.getID() %>">
                <input type="submit" class="btn-edit" value="Edit">
            </form>

        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="10">No Tutors Available</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
