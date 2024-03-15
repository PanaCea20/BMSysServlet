<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Accounting Entry</title>
</head>
<body>
    <h2>Search for an Accounting Entry</h2>
    <form action="AccountController" method="post">
        <input type="hidden" name="action" value="searchEntry">
        <div>
            <label for="searchAmount">Amount:</label><br>
            <input type="number" id="searchAmount" name="searchAmount" step="0.01" required>
        </div>
        <br>
        <button type="submit">Search</button>
    </form>
    <a href="index.jsp">Return to Home</a>
</body>
</html>
