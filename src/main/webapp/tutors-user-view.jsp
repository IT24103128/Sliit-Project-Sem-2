<%@ page import="com.example.demo.models.Tutor" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% User user = (User) session.getAttribute("user"); %>
<html>
<head>
    <title>Home Tutor Booking</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/tutors-user-view.css">
</head>
<body>
<div class="header">Home Tutor Booking</div>
<h2 style="text-align:center;">List of Tutors</h2>

<div class="controls">
    <form method="get" action="sort-tutor">
        <button type="submit" name="sort" value="expertise" class="btn-sort">Sort by Subject Expertise</button>
    </form>

    <form method="get" action="search-tutor">
        <input type="text" name="subject" class="search-input" placeholder="Search subject e.g. Math" required>
        <button type="submit" class="btn-search">Search</button>
    </form>

    <form method="get" action="tutors-user-view">
        <button type="submit" class="btn-reset">Reset View</button>
    </form>
</div>

<% ArrayList<Tutor> tutors = (ArrayList<Tutor>) session.getAttribute("tutors"); %>
<div class="tutors">
    <%if (!tutors.isEmpty()) {%>
        <% for (Tutor tutor : tutors) { %>
        <div class="profile-card">
            <img class="profile-image" src="<%= request.getContextPath() %>/images/<%= tutor.getGender().equals("male") ? "male-profile.png" : "female-profile.png" %>" alt="profile-image">
            <h3><%= tutor.getName() %></h3>
            <h4>Age : <%= tutor.getAge() %></h4>
            <h4>Subject : <%= tutor.getSubject() %></h4>
            <h4>Expertise Level : <%= tutor.getSubjectExpertise() %></h4>
            <p>Session Cost (per hour): $<%= tutor.getCostPerHour() %></p>
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
            window.location.href = "payment.jsp?tutorID=" + tutorID;
        }
    }
</script>
</body>
</html>
