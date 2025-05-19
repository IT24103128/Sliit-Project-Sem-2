<%--
  Created by IntelliJ IDEA.
  User: Alwis
  Date: 4/11/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.demo.models.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My profile</title>
    <link rel="stylesheet" href="./css/admin.css">
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>
<%@ page session="true" %>
<%
    Admin currentAdmin = (Admin) session.getAttribute("logged-in-admin");
    if (currentAdmin == null) {
        response.sendRedirect("login.jsp");
    return;
}
%>
<header>
    <div class="header">
        <div>
            <h2 class="header-title">Tutor Booking System</h2>
        </div>
        <div>
            <nav>
                <a>Book Tutors</a>
                <a>Your Profile</a>
                <a>Booking Details</a>
            </nav>
        </div>
    </div>
</header>

<div class="profile-container">
    <h2>Welcome, <%= currentAdmin.getName() %>!</h2>

   <%-- <img class="profile-image" src="<%= request.getContextPath() %>/images/<%= currentAdmin.getGender().equals("male") ? "user-male-profile.png" : "user-female-profile.png" %>"/>
--%>
    <table>
        <tr><td>Email:</td><td><%= currentAdmin.getEmail() %></td></tr>
        <tr><td>Contact No:</td><td><%= currentAdmin.getContactNo() %></td></tr>

    </table>

    <div class="button-group">
        <button value="Edit Profile" class="btn-edit" onClick="editProfile(<%=currentAdmin.getID()%>)"> Edit Profile </button>

        <form action="<%=request.getContextPath()%>/delete-admin-account" method="post" onsubmit="return confirm('Are you sure you want to delete your account?')">
            <input type="hidden" value="<%=currentAdmin.getID()%>" name="admin-id">
            <input type="submit" value="Delete Account" class="btn-remove"/>
        </form>
    </div>

    <script>
        function editProfile(adminID){
            if (confirm("Are you sure you want to edit your account?")){
                window.location.href = "update.jsp?adminID=" + adminID;
            }
        }
    </script>
</div>


</body>
</html>