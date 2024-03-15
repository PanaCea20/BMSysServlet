<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Action Result</title>
    <style>
        .message { color: green; }
        .error { color: red; }
    </style>
</head>
<body>
    <h2>Action Result</h2>

    <%-- Display success message if exists --%>
    <% if (request.getAttribute("message") != null) { %>
        <p class="message"><%= request.getAttribute("message") %></p>
    <% } %>

    <%-- Display error message if exists --%>
    <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
    <% } %>

    <a href="index.jsp">Return to Home</a> | <a href="addEntry.jsp">Add Another Entry</a>
</body>
</html>
