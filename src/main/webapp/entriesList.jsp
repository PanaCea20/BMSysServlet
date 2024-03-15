<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.dissysservlet.Entry" %>  <%-- Replace 'com.yourpackage' with your actual package name --%>
<html>
<head>
    <title>Entries List</title>
</head>
<body>
<h2>Entries List</h2>
<%
    List<Entry> entries = (List<Entry>) request.getAttribute("entries");
    if (entries != null && !entries.isEmpty()) {
        for (Entry entry : entries) {
%>
<p>Entry ID: <%= entry.getId() %>, Description: <%= entry.getDescription() %>, Amount: <%= entry.getAmount() %>, Date: <%= entry.getDate() %></p>
<%
    }
} else {
%>
<p>No entries found for the current account.</p>
<%
    }
%>
<a href="index.jsp">Return to Home</a>
</body>
</html>
