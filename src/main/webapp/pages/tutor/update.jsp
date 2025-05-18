<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/2/2025
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<html>
<head>
    <title>Add New Tutor</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/edit-tutor.css">
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

<h2>Update Tutor Details</h2>

<%
    int tutorID = Integer.parseInt((String) request.getParameter("tutor-id"));
    Tutor tutor = TutorsManager.findTutor(tutorID);
    if (tutor == null) {
%>
<h2>Something went wrong!</h2>
<%
        return;
    }
%>

<form action="<%=request.getContextPath()%>/update-tutor" method="POST" class="edit-tutor-form">
    <h1>Tutor ID : <%=tutor.getID() %> </h1>
    <input type="hidden" name="id" value="<%= tutor.getID()%>">
    <table>
        <tr>
            <th><label for="email">Email</label></th>
            <th>:</th>
            <td><input type="email" id="email" name="email" value="<%= tutor.getEmail() %>" required></td>
        </tr>
        <tr>
            <th><label for="name">Name</label></th>
            <th>:</th>
            <td><input type="text" id="name" name="name" value="<%= tutor.getName() %>" required></td>
        </tr>

        <tr>
            <th><label for="contact-no">Phone No.</label></th>
            <th>:</th>
            <td><input type="tel" id="contact-no" name="contact-no" value="<%= tutor.getContactNo() %>" required></td>
        </tr>

        <tr>
            <th><label for="age">Age</label></th>
            <th>:</th>
            <td><input type="number" id="age" name="age" min="1" max="200"  value="<%= tutor.getAge() %>" required></td>
        </tr>

        <tr>
            <th><label for="gender">Gender</label></th>
            <th>:</th>
            <td id="gender">
                <input type="radio" name="gender" value="male" <%= (tutor.getGender().equals("male")) ? "checked" : "" %> required> Male
                <input type="radio" name="gender" value="female" <%= (tutor.getGender().equals("female")) ? "checked" : "" %> required> Female
            </td>
        </tr>

        <tr>
            <th><label for="subject">Subject</label></th>
            <th>:</th>
            <td><input type="text" id="subject" name="subject" value="<%= tutor.getSubject()%>" required></td>
        </tr>

        <tr>
            <th><label for="subject-expertise">subject Expertise</label></th>
            <th>:</th>
            <td><input type="number" id="subject-expertise" name="subject-expertise" value="<%= tutor.getSubjectExpertise()%>" min="0" max="5" required></td>
        </tr>

        <tr>
            <th><label for="cost-per-hour">cost-per-hour</label></th>
            <th>:</th>
            <td><input type="number" id="cost-per-hour" name="cost-per-hour" min="1" value=<%= tutor.getCostPerHour()%> required></td>
        </tr>
    </table>
    <input type="submit" value="Update Tutor" class="update-tutor-submit-btn">
</form>

</body>
</html>