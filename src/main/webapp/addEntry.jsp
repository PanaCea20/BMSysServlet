<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Entry</title>
    <style>
        .error { color: red; }
    </style>
</head>
<body>
    <h2>Add New Entry</h2>

    <%-- Display error message if exists --%>
    <% if (request.getAttribute("error") != null) { %>
    <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <form action="AccountController" method="post">
        <input type="hidden" name="action" value="addEntry">

        <div>
            <label for="description">Description:</label><br>
            <input type="text" id="description" name="description" required pattern=".{3,}" title="Description must be at least 3 characters long.">
        </div>
        <div>
            <label for="amount">Amount (USD):</label><br>
            <input type="number" id="amount" name="amount" step="0.01" required min="0.01" title="Amount must be a positive number.">
        </div>
        <div>
            <label for="date">Date (DD-MM-YYYY):</label><br>
            <input type="text" id="date" name="date" required pattern="\d{4}-\d{2}-\d{2}">
            <div class="note">Format: DD-MM-YYYY, e.g., 2023-01-31</div>
        </div>
        <br>
        <button type="submit">Add Entry</button>
    </form>

    <a href="index.jsp">Return to Home</a>
</body>
</html>
