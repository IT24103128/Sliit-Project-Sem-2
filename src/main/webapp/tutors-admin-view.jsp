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
<html>
<head>
    <title>Tutors List</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/tutors-admin-view.css">
</head>
<body>
<div class="header">Home Tutor Booking</div>
<h2> Tutors </h2>

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
        ArrayList<Tutor> tutors = (ArrayList<Tutor>) session.getAttribute("tutors");
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
        <td>
            <button class="btn-remove" onclick="removeTutor(<%= tutor.getID() %>)">Remove</button>
            <button class="btn-edit" onclick="editTutor(<%= tutor.getID() %>)" >Edit</button>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="10">No tutors available</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<script>
    function editTutor(tutorId) {
        if (confirm("Are you sure you want to edit this tutor?")) {
            window.location.href = "update-tutor.jsp?tutorID=" + tutorId;
        }
    }

    function removeTutor(tutorId) {
        if (confirm("Are you sure you want to remove this tutor?")) {
            window.location.href = "remove-tutor?tutorID=" + tutorId;
        }
    }
</script>

</body>
</html>
