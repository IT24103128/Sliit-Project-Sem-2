<%--
  Created by IntelliJ IDEA.
  User: Alwis
  Date: 4/11/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin-login.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/header-admin.css">
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
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/register.jsp">User Register</a>
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/admin/login.jsp">Admin Login</a>
            </nav>
        </div>
    </div>
</header>

<h2>Enter Admin Login Details</h2>
<form action="<%=request.getContextPath()%>/admin-login" method="post">
    <table >
        <thead></thead>
        <tbody>
            <tr>
                <th>Email</th>
                <th>:</th>
                <td><input type="email" name="email"></td>
            </tr>
            <tr>
                <th>Password</th>
                <th>:</th>
                <td><input type="password" name="password"></td>
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


    <input type="submit" value="Login">
</form>

</body>
</html>