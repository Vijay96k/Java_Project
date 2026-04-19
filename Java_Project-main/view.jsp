<%@ page import="java.sql.*" %>

<html>
<head>
<title>User List</title>

<style>
table {
    border-collapse: collapse;
    width: 60%;
    margin: auto;
}
th, td {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
}
th {
    background-color: lightblue;
}
</style>

</head>

<body>

<h2 align="center">Users</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
</tr>

<%
ResultSet rs = (ResultSet) request.getAttribute("data");

while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>
</tr>
<%
}
%>

</table>

</body>
</html>