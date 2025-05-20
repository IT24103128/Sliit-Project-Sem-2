<%--
  Created by IntelliJ IDEA.
  User: Ahamed
  Date: 4/2/2025
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo.models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.services.UserManager" %>
<html>
<head>
  <title>Admin : Users</title>
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
        <a class="nav-btn" href="<%=request.getContextPath()%>/pages/tutor/admin-view.jsp">Tutor Management</a>
        <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/user/admin-view.jsp">User Management</a>
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

<h2> User List </h2>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Email</th>
    <th>Name</th>
    <th>Contact No.</th>
    <th>Age</th>
    <th>Gender</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <%
    UserManager.readUsers();
    ArrayList<User> users = UserManager.getUsers();
    if (!users.isEmpty()) {
      for (User user : users) {
  %>
  <tr>
    <td><%= user.getID() %></td>
    <td><%= user.getEmail() %></td>
    <td><%= user.getName() %></td>
    <td><%= user.getContactNo() %></td>
    <td><%= user.getAge() %></td>
    <td><%= user.getGender() %></td>
    <td>
      <form action="<%=request.getContextPath()%>/delete-user" method="post"
            onsubmit="return confirm('Are you sure you want to delete this user account?');">
        <input type="hidden" name="user-id" value="<%= user.getID() %>">
        <input type="submit" class="btn-remove" value="Delete">
      </form>
    </td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="7">No Users Available</td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>


</body>
</html>
