<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">

    <div class="title">User List</div>

    <table border="3">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>

<%
ResultSet rs = (ResultSet) request.getAttribute("data");

if(rs != null){
    while(rs.next()){
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("email") %></td>

    <td>
        <a href="editUser.jsp?id=<%= rs.getInt("id") %>">Edit</a>
        <a href="DeleteUser.jsp?id=<%= rs.getInt("id") %>">Delete</a>
    </td>
</tr>
<%
    }
}
%>

    </table>

</div>

</body>
</html>