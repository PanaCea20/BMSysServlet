<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Change Current Account</title>
</head>
<body>
    <h2>Change Current Account</h2>
    <%
        // Assuming 'accountList' is a List<String> of account names stored in the session
        List<String> accountList = (List<String>) request.getSession().getAttribute("accountList");
        String currentAccount = (String) request.getSession().getAttribute("currentAccount");
    %>
    <form action="AccountController" method="post">
        <input type="hidden" name="action" value="changeAccount">
        <label for="newAccount">Select New Account:</label><br>
        <select id="newAccount" name="newAccount">
            <% if (accountList != null) {
                for (String accountName : accountList) {
                    // Mark the current account as selected in the dropdown
                    boolean isSelected = accountName.equals(currentAccount);
            %>
            <option value="<%= accountName %>" <%= isSelected ? "selected" : "" %>><%= accountName %></option>
            <%
                    }
                } %>
        </select><br><br>
        <button type="submit">Change Account</button>
    </form>
    <a href="index.jsp">Return to Home</a>
</body>
</html>