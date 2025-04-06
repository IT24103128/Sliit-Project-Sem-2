<%--
  Created by IntelliJ IDEA.
  User: Dasun
  Date: 4/4/2025
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int tutorID = Integer.parseInt(request.getParameter("tutorID"));
    Tutor tutor = TutorsManager.findTutor(tutorID);
%>
<html>
<head>
    <title>Payment Page</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/payment.css">
</head>
<body>
<div class="header">Home Tutor Booking</div>
<h2>Confirm Your Booking</h2>
<div class="payment-container">
    <% if (tutor != null) { %>
    <div class="tutor-details">
        <div>
            <img class="profile-image" src="<%= request.getContextPath() %>/images/<%= (tutor.getGender().equals("male") ? "male-profile.png" : "female-profile.png")%>" alt="profile-image">
        </div>
        <div>
            <h3><%= tutor.getName() %></h3>
            <p><strong>Age:</strong> <%= tutor.getAge() %></p>
            <p><strong>Gender:</strong> <%= tutor.getGender() %></p>
            <p><strong>Subject:</strong> <%= tutor.getSubject() %></p>
            <p><strong>Expertise Level:</strong> Level <%= tutor.getSubjectExpertise() %></p>
            <p><strong>Cost per hour:</strong> $<%= tutor.getCostPerHour() %></p>
        </div>
    </div>
    <form action="confirmPayment.jsp" method="post" oninput="calculateCost()">
        <input type="hidden" name="tutorID" value="<%= tutor.getID() %>">

        <div class="form-group">
            <label for="date">Select Date:</label>
            <input type="date" name="date" id="date" required>
        </div>

        <div class="form-group">
            <label for="time">Select Time:</label>
            <input type="time" name="time" id="time" required>
        </div>

        <div class="form-group">
            <label for="hours">Booking Hours:</label>
            <input type="number" step="0.5" name="hours" id="hours" min="0.5" required>
        </div>

        <div class="calculated-cost">
            Total Cost: <span id="costDisplay">$0.00</span>
        </div>

        <button type="submit" class="btn-pay">Confirm and Pay</button>
    </form>
    <% } else { %>
    <p style="color: red;">Error: No tutor information found.</p>
    <% } %>

    <script>
        function calculateCost() {
            const hours = parseFloat(document.getElementById("hours").value);
            const rate = parseFloat(<%= tutor != null ? tutor.getCostPerHour() : 0 %>);
            const total = (hours && rate) ? (hours * rate).toFixed(2) : "0.00";
            document.getElementById("costDisplay").innerText = "$" + total;
        }
    </script>
</div>
</body>
</html>