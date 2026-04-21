<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

String name="", email="", password="";

if(id != null){
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/userdb",
            "root",
            ""
        );

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            name = rs.getString("name");
            email = rs.getString("email");
            password = rs.getString("password");
        }

    }catch(Exception e){
        out.println(e);
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">

    <div class="title">Edit User</div>

    <form action="UpdateUser.jsp" method="post">

        <input type="hidden" name="id" value="<%= id %>">

        <div class="user-details">

            <div class="input-box">
                <label class="details">Name</label>
                <input type="text" name="name" value="<%= name %>" required>
            </div>

            <div class="input-box">
                <label class="details">Email</label>
                <input type="text" name="email" value="<%= email %>" required>
            </div>

            <div class="input-box">
                <label class="details">Password</label>
                <input type="text" name="password" value="<%= password %>" required>
            </div>

        </div>

        <div class="button">
            <input type="submit" value="Update">
        </div>

    </form>

</div>

</body>
</html>