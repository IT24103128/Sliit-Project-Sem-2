<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/2/2025
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.models.Tutor" %>
<html>
<head>
    <title>Add New Tutor</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/add-tutor.css">
</head>
<body>
<div class="header">Home Tutor Booking</div>
<h2>Update Tutor Details</h2>
<% Tutor tutor = (Tutor) session.getAttribute("tutor");%>
<form action="update-tutor" method="POST">
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
    <input type="submit" value="Update Tutor">
</form>

</body>
</html>