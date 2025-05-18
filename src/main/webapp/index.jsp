<%@ page import="com.example.demo.services.*" %>
<%@ page import="java.io.File" %>
<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/9/2025
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    try {
        String dirPath = request.getServletContext().getRealPath("/WEB-INF/data/");
        File dir = new File(dirPath);
        if (!dir.exists()) {
            dir.mkdirs(); // create the directory if it does not exist
        }

        String filePath = dirPath  + "a.txt"; // add separator for safety
        File file = new File(filePath);
        if (!file.exists()) {
            boolean created = file.createNewFile();
            if (created) {
                System.out.println("File created at: " + filePath);
            } else {
                System.out.println("Failed to create file at: " + filePath);
            }
        } else {
            System.out.println("File already exists at: " + filePath);
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
%>

<%
    UserManager.readUsers();
    AdminManager.readAdmins();
    PaymentManager.readPayments();
    ReviewManager.readReviews();
    TutorsManager.readTutors();
    BookingManager.readBookings();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/user-login.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/header-user.css">
</head>
<body>

<header>
    <div class="header">
        <div>
            <h2 class="header-title">Tutor Booking System</h2>
        </div>
        <div>
            <nav>
                <a class="nav-btn-clicked" href="index.jsp">User Login</a>
                <a class="nav-btn" href="pages/user/register.jsp">User Register</a>
                <a class="nav-btn" href="pages/admin/login.jsp">Admin Login</a>
            </nav>
        </div>
    </div>
</header>

<h2>Login to Your Account</h2>

<form action="user-login" method="post">
    <table >
        <thead></thead>
        <tbody>
        <tr>
            <th>
                Email
            </th>
            <th>:</th>
            <td>
                <input type="email" name="email" required>
            </td>
        </tr>

        <tr>
            <th>
                Password
            </th>
            <th>:</th>
            <td>
                <input type="password" name="password" required>
            </td>
        </tr>
        </tbody>
    </table>

    <p class="error-message">
        <% String error = (String)session.getAttribute("email-password-incorrect");
            if (error != null ) { %>
        <%=error%>
        <%session.removeAttribute("email-password-incorrect");%>
        <% } %>
    </p>


    <input type="submit" value="Login"><br>
    <p class="register-msg">You don't have a account ? <a href="pages/user/register.jsp">Sign Up</a></p>
</form>
</body>
</html>