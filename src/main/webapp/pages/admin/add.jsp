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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin-add.css">
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
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/tutor/admin-view.jsp">Tutor Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/user/admin-view.jsp">User Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/review/admin-view.jsp">Review Management</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/payment/admin-view.jsp">Payment History</a>
                <a class="nav-btn" href="<%=request.getContextPath()%>/pages/booking/admin-view.jsp">Booking History</a>
                <a class="nav-btn-clicked" href="<%=request.getContextPath()%>/pages/admin/admin-view.jsp">Admin Management</a>
            </nav>
        </div>
    </div>
</header>


<h2>Enter Admin Details</h2>

<form action="<%=request.getContextPath()%>/add-admin" method="Post">
    <table >
        <thead></thead>
        <tbody>
            <tr>
                <th>Name</th>
                <th>:</th>
                <td><input type="text" name="name"></td>
            </tr>
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
            <tr>
                <th>Contact Number
                </th>
                <th>:</th>
                <td><input type="tel" name="contact-no" ></td>
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

    <input type="submit" value="Sign up">


</form>

</body>
</html>