<%--
  Created by IntelliJ IDEA.
  User: Ahamed
  Date: 4/10/2025
  Time: 9:05 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/user-register.css">
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
                <a class="nav-btn" href="<%=request.getContextPath()%>/index.jsp">User Login</a>
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/user/register.jsp">User Register</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/admin/login.jsp">Admin Login</a>
            </nav>
        </div>
    </div>
</header>

<h2>Enter Your Details</h2>

<form action="<%=request.getContextPath()%>/user-register" method="Post">
    <table >
        <thead></thead>
        <tbody>
        <tr>
            <th>
                Name
            </th>
            <th>:</th>
            <td>
                <input type="text" name="name" required>
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
                Gender
            </th>
            <th>:</th>
            <td>
                <input type="radio" name="gender" value="male" required> Male  <input type="radio" name="gender" value="female" required> Female
            </td>
        </tr>

        <tr>
            <th>
                Contact Number
            </th>
            <th>:</th>
            <td>
                <input type="tel" name="contact-no" required>
            </td>
        </tr>

        <tr>
            <th>
                Age
            </th>
            <th>:</th>
            <td>
                <input type="number" min="1" name="age" required>
            </td>
        </tr>

        </tbody>
    </table>

    <p class="error-message">
        <% String error = (String)session.getAttribute("email-already-used");
            if (error != null ) { %>
        <%=error%>
        <%session.removeAttribute("email-already-used");%>
        <% } %>
    </p>

    <input type="submit" value="Register">
    <p class="login-msg">Already have an Account ? <a href="<%=request.getContextPath()%>/index.jsp">Sign In</a></p>

    <%
        String successMessage = (String) session.getAttribute("registration-success");
        if (successMessage != null) {
    %>
    <div class="success-message">
        <%= successMessage %>
        <a href="../../index.jsp" class="back-to-login-msg">Back to Login</a>
    </div>
    <%
            session.removeAttribute("registration-success"); // So it doesn't show again on refresh
        }
    %>

</form>

</body>
</html>