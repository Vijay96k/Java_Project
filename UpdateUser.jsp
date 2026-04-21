<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

try{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/userdb",
        "root",
        ""
    );

    PreparedStatement ps = con.prepareStatement(
        "UPDATE users SET name=?, email=?, password=? WHERE id=?"
    );

    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, password);
    ps.setInt(4, Integer.parseInt(id));

    ps.executeUpdate();

    response.sendRedirect("ViewUsersServlet");

}catch(Exception e){
    out.println(e);
}
%>