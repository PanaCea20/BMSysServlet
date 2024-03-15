<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bank Account Management System</title>
</head>
<body>
<h2>Welcome to the Bank Account Management System</h2>
<form action="AccountController" method="post">
    <div>
        <input type="radio" id="createAccount" name="action" value="create">
        <label for="createAccount">Create a new account</label>
    </div>
    <div>
        <input type="radio" id="changeAccount" name="action" value="change">
        <label for="changeAccount">Change the current account</label>
    </div>
    <div>
        <input type="radio" id="searchEntry" name="action" value="search">
        <label for="searchEntry">Search for an accounting entry</label>
    </div>
    <div>
        <input type="radio" id="addEntry" name="action" value="add">
        <label for="addEntry">Add a new accounting entry</label>
    </div>
    <div>
        <input type="radio" id="showEntries" name="action" value="show">
        <label for="showEntries">Show all accounting entries</label>
    </div>
    <div>
        <input type="radio" id="changeEntry" name="action" value="changeAmount">
        <label for="changeEntry">Change the amount of an entry</label>
    </div>
    <br>
    <button type="submit">Proceed</button>
</form>
</body>
</html>