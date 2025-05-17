<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/10/2025
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.demo.models.User" %>
<%@ page session="true" %>
<%
    User currentUser = (User) session.getAttribute("logged-in-user");
    if (currentUser == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<html>
<head>
    <title>My Profile</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/user-profile.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/header.css">
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
            </nav>
        </div>
    </div>
</header>

<div class="profile-container">
    <h2>Welcome, <%= currentUser.getName() %>!</h2>

    <img class="profile-image" src="<%= request.getContextPath() %>/images/<%= currentUser.getGender().equals("male") ? "user-male-profile.png" : "user-female-profile.png" %>"/>

    <table>
        <tr><td>Email:</td><td><%= currentUser.getEmail() %></td></tr>
        <tr><td>Contact No:</td><td><%= currentUser.getContactNo() %></td></tr>
        <tr><td>Age:</td><td><%= currentUser.getAge() %></td></tr>
        <tr><td>Gender:</td><td><%= currentUser.getGender() %></td></tr>
    </table>

    <div class="button-group">
        <button value="Edit Profile" class="btn-edit" onClick="editProfile(<%=currentUser.getID()%>)"> Edit Profile </button>

        <form action="<%=request.getContextPath()%>/delete-user-account" method="post" onsubmit="return confirm('Are you sure you want to delete your account?')">
            <input type="hidden" value="<%=currentUser.getID()%>" name="user-id">
            <input type="submit" value="Delete Account" class="btn-remove"/>
        </form>
    </div>

    <script>
        function editProfile(userID){
            if (confirm("Are you sure you want to edit your account?")){
                window.location.href = "update.jsp?userID=" + userID;
            }
        }
    </script>
</div>

</body>
</html>

