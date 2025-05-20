<%--
  Created by IntelliJ IDEA.
  User: Alwis
  Date: 4/11/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.demo.models.Admin" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.demo.services.AdminManager" %>
<%@ page import="com.example.demo.models.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Admin : Admins</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/admin-dashboard.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/header-admin.css">
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
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/admin-view.jsp">User Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/review/admin-view.jsp">Review Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/admin-view.jsp">Payment History</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/admin-view.jsp">Booking History</a>
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/admin/admin-view.jsp">Admin Management</a>
                <form action="<%=request.getContextPath()%>/admin-logout" method="post" onsubmit="return confirm('Are you sure you want logout?')">
                    <input type="submit" value="Logout"  class="btn-logout">
                </form>
            </nav>
        </div>
    </div>
</header>

<h2>Admin List</h2>

<div>
    <form action="<%=request.getContextPath()%>/pages/admin/add.jsp" method="get">
        <button type="submit" class="add-button">
            + Add New Admin
        </button>
    </form>
</div>


<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Email</th>
        <th>Password</th>
        <th>Name</th>
        <th>Contact No</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        AdminManager.readAdmins();
        ArrayList<Admin> admins = AdminManager.getAdmins();
        if (!admins.isEmpty()) {
            for (Admin admin : admins) {
    %>
    <tr>
        <td><%= admin.getID() %></td>
        <td><%= admin.getEmail() %></td>
        <td><%= admin.getPassword() %></td>
        <td><%= admin.getName() %></td>
        <td><%= admin.getContactNo() %></td>
        <td>
            <form action="<%=request.getContextPath()%>/delete-admin" method="post"
                  onsubmit="return confirm('Are you sure you want to remove this admin')">
                <input type="hidden" name="admin-id" value="<%= admin.getID() %>">
                <input type="submit" class="btn-remove" value="Delete" <%=(admin.getID()==0)? "disabled":""%>>
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>

</body>
</html>
