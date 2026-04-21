<%@ page import="java.sql.*" %>

<%
String id = request.getParameter("id");

if(id != null){
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/userdb",
            "root",
            ""
        );

        PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));

        ps.executeUpdate();

        response.sendRedirect("ViewUsersServlet");

    }catch(Exception e){
        out.println(e);
    }
}
%>