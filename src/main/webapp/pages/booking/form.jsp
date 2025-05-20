<%--
  Created by IntelliJ IDEA.
  User: Dasun
  Date: 4/4/2025
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="com.example.demo.services.TutorsManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int tutorID = Integer.parseInt(request.getParameter("tutorID"));
    Tutor tutor = TutorsManager.findTutor(tutorID);
    if (tutor==null) { %>
        <h2> Something went wrong</h2>
        <% return;
    }
%>
<html>
<head>
    <title> </title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/booking-form.css">
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
                <a class="nav-btn-clicked" href="user-view.jsp">Book Tutors</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/profile-view.jsp">Your Profile</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/user-view.jsp">Booking Details</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/user-view.jsp">Payment History</a>
                <form action="<%=request.getContextPath()%>/user-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                    <input type="submit" value="Logout" class="btn-logout">
                </form>
            </nav>
        </div>
    </div>
</header>

<h2>Confirm Your Booking</h2>
<div class="booking-container">
    <div class="tutor-details">
        <div>
            <img class="profile-image" src="<%= request.getContextPath() %>/images/<%= (tutor.getGender().equals("male") ? "user-male-profile.png" : "user-female-profile.png")%>" alt="profile-image">
        </div>
        <div>
            <h3><%= tutor.getName() %></h3>
            <table>
                <tr>
                    <th>Age</th>
                    <th>:</th>
                    <td><%= tutor.getAge() %></td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <th>:</th>
                    <td><%= tutor.getGender() %></td>
                </tr>
                <tr>
                    <th>Subject</th>
                    <th>:</th>
                    <td><%= tutor.getSubject() %></td>
                </tr>
                <tr>
                    <th>Expertise Level</th>
                    <th>:</th>
                    <td> Level <%= tutor.getSubjectExpertise() %></td>
                </tr>
                <tr>
                    <th>Cost per hour</th>
                    <th>:</th>
                    <td> $<%= tutor.getCostPerHour() %></td>
                </tr>
            </table>
        </div>
    </div>
    <form action="<%=request.getContextPath()%>/pages/payment/form.jsp" method="get" oninput="calculateCost()"
          class="form-booking" >
        <input type="hidden" name="tutorID" value="<%= tutor.getID() %>"">

        <table>
            <tr>
                <th>Date</th>
                <th>:</th>
                <td><input type="date" name="date" id="date" required></td>
            </tr>

            <tr>
                <th>Select Time</th>
                <th>:</th>
                <td><input type="time" name="time" id="time" required></td>
            </tr>

            <tr>
                <th>Duration (Hours):</th>
                <th>:</th>
                <td><input type="number" step="0.5" name="duration" id="hours" min="0.5" required></td>
            </tr>
        </table>

        <div class="calculated-cost">
            Total Cost: <span id="costDisplay">$0.00</span>
        </div>

        <input type="submit" class="btn-pay" value="Confirm"/>
    </form>

    <script>
        function calculateCost() {
            const hours = parseFloat(document.getElementById("hours").value);
            const rate = parseFloat(<%= tutor.getCostPerHour() %>);
            const total = (hours && rate) ? (hours * rate).toFixed(2) : "0.00";
            document.getElementById("costDisplay").innerText = "$" + total;
        }
    </script>
</div>
</body>
</html>