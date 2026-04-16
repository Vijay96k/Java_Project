<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // Basic validation (SERVER SIDE - MUST)
    if(name == null || name.trim().equals("") ||
       email == null || email.trim().equals("") ||
       password == null || password.trim().equals("")) {

        out.println("<h3 style='color:red;'>All fields are required!</h3>");
        return;
    }

    // DB Connection
    String url = "jdbc:mysql://localhost:3306/userdb";
    String dbUser = "root";
    String dbPass = ""; // change if needed

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, dbUser, dbPass);

        // 🔍 Check if email already exists
        String checkQuery = "SELECT * FROM users WHERE email=?";
        ps = con.prepareStatement(checkQuery);
        ps.setString(1, email);
        rs = ps.executeQuery();

        if(rs.next()) {
            out.println("<h3 style='color:red;'>Email already exists!</h3>");
        } else {

            // ✅ Insert new user
            String insertQuery = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";
            ps = con.prepareStatement(insertQuery);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);

            int i = ps.executeUpdate();

            if(i > 0) {
                out.println("<h3 style='color:green;'>Registration Successful!</h3>");
            } else {
                out.println("<h3 style='color:red;'>Registration Failed!</h3>");
            }
        }

    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        } catch(Exception e) {}
    }
%>