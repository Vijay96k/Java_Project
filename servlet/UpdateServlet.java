package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import dao.UserDAO;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get form data
            String idStr = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Validation
            if (idStr == null || idStr.isEmpty()) {
                response.getWriter().println("Invalid ID!");
                return;
            }

            if (name == null || email == null || password == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty()) {
                response.getWriter().println("All fields are required!");
                return;
            }

            // Convert ID safely
            int id = Integer.parseInt(idStr);

            // Call DAO
            UserDAO dao = new UserDAO();
            dao.updateUser(id, name, email, password);

            // Redirect to display page
            response.sendRedirect("DisplayServlet");

        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid ID format!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Update Failed!");
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}