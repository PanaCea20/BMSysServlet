<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.dissysservlet.Entry" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
    <h2>Search Results</h2>
    <% if (request.getAttribute("searchResults") != null) {
        List<Entry> searchResults = (List<Entry>) request.getAttribute("searchResults");
        if (!searchResults.isEmpty()) {
            for (Entry entry : searchResults) {
    %>
                <p>Entry: <%= entry.getDescription() %> - Amount: <%= entry.getAmount() %></p>
    <%
            }
        } else {
    %>
        <p>No entries found for the specified amount.</p>
    <%
        }
    }
    if (request.getAttribute("error") != null) {
    %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <%
    }
    %>
    <a href="index.jsp">Return to Home</a>
</body>
</html>
