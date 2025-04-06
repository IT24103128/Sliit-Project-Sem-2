<%--
  Created by IntelliJ IDEA.
  User: KHThi
  Date: 4/2/2025
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Tutor</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/add-tutor.css">
</head>
<body>
<div class="header">Home Tutor Booking</div>
<h2>Enter Tutor Details</h2>

<form action="user-login" method="POST">
    <table>
        <tr>
            <th><label for="email">Email</label></th>
            <th>:</th>
            <td> <input type="email" id="email" name="email" required> </td>
        </tr>
        <tr>
            <th><label for="password">Subject Expertise</label></th>
            <th>:</th>
            <td><input type="password" id="password" name="password" required></td>
        </tr>
    </table>
    <input type="submit" value="Add Tutor">
</form>

</body>
</html>