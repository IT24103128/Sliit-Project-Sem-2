<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/2/2025
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Home Tutor Booking</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/tutors-user-view.css">
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

<h2>List of Tutors</h2>

<div class="controls">
    <form method="get" action="<%=request.getContextPath()%>/sort-tutor-asc">
        <button type="submit" name="sort" value="expertise" class="btn-sort">Subject Expertise (Low to High)</button>
    </form>

    <form method="get" action="<%=request.getContextPath()%>/sort-tutor-dsc">
        <button type="submit" name="sort" value="expertise" class="btn-sort">Subject Expertise (High to Low)</button>
    </form>

    <form method="get" action="<%=request.getContextPath()%>/search-tutor">
        <label>
            <input type="text" name="subject" class="search-input" placeholder="Search subject e.g. Math" required>
        </label>
        <button type="submit" class="btn-search">Search</button>
    </form>

    <form method="get" action="<%=request.getContextPath()%>/tutors-user-view">
        <button type="submit" class="btn-reset">Reset View</button>
    </form>
</div>

<%
    ArrayList<Tutor> tutors = (ArrayList<Tutor>) session.getAttribute("tutors");
    if (tutors==null) { %>
        <h2> Something went wrong</h2>
        <% return;
    }
%>

<div class="tutors">
    <%if (!tutors.isEmpty()) {%>
        <% for (Tutor tutor : tutors) { %>
        <div class="profile-card">
            <img class="profile-image" src="<%= request.getContextPath() %>/images/<%= tutor.getGender().equals("male") ? "tutor-male-profile.png" : "tutor-female-profile.png" %>" alt="profile-image">
            <h3><%= tutor.getName() %></h3>
            <h4>Age : <%= tutor.getAge() %></h4>
            <h4>Subject : <%= tutor.getSubject() %></h4>
            <h4>Expertise Level : <%= tutor.getSubjectExpertise() %></h4>
            <p>Session Cost (per hour): $<%= tutor.getCostPerHour() %></p>
            <button class="btn-view-profile" onclick="openTutorProfile('<%= tutor.getID() %>')">View Profile</button>
            <button class="btn-book" onclick="bookTutor('<%= tutor.getID() %>')">Book now</button>
        </div>
        <% } %>
    <% } else { %>
        <h3>No Tutors Found ....!</h3>
    <% } %>
</div>

<script>
    function bookTutor(tutorID) {
        if (confirm("Are you sure you want to book this tutor?")) {
            window.location.href = "<%=request.getContextPath()%>/pages/booking/form.jsp?tutorID=" + tutorID;;
        }
    }
    function openTutorProfile(tutorID){
        if(confirm("Are you sure you want to open this profile ?")){
            window.location.href = "<%=request.getContextPath()%>/pages/review/tutor-profile.jsp?tutorID=" + tutorID;
        }
    }
</script>
</body>
</html>
