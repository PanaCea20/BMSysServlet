<%--
  Created by IntelliJ IDEA.
  User: nizar
  Date: 15/03/2024
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Entry Amount</title>
</head>
<body>
    <h2>Change Entry Amount</h2>
    <form action="AccountController" method="post">
        <input type="hidden" name="action" value="changeEntryAmount">
        <div>
            <label for="entryId">Entry ID:</label><br>
            <input type="number" id="entryId" name="entryId" required>
        </div>
        <div>
            <label for="newAmount">New Amount:</label><br>
            <input type="text" id="newAmount" name="newAmount" required>
        </div>
        <br>
        <button type="submit">Update Amount</button>
    </form>
</body>
</html>
