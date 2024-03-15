<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Account</title>
</head>
<body>
    <h2>Create a New Account</h2>
    <form action="AccountController" method="post">
        <input type="hidden" name="action" value="createAccount">
        <label for="accountName">Account Name:</label><br>
        <input type="text" id="accountName" name="accountName" required><br><br>
     <button type="submit">Create Account</button>
    </form>
</body>
</html>
