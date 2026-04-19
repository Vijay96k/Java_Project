import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class ViewUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/userdb",
                "root",
                ""
            );

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users");

            request.setAttribute("data", rs);

            RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}