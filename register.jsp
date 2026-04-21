<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");

if(name != null && email != null && password != null){

    Connection con = null;
    PreparedStatement ps = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/userdb",
            "root",
            ""
        );

        String query = "INSERT INTO users(name,email,password) VALUES(?,?,?)";
        ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);

        int i = ps.executeUpdate();

        if(i > 0){
            response.sendRedirect("ViewUsersServlet");
        } else {
            out.println("<h3>Registration Failed</h3>");
        }

    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
}
%>
