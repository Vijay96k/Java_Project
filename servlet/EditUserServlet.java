package servlet;
 import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import dao.UserDAO;
import model.User;
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet{




protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    try {

        String idStr = request.getParameter("id");

        if(idStr == null || idStr.isEmpty()){
            response.getWriter().println("ID not found!");
            return;
        }

        int id = Integer.parseInt(idStr);

        UserDAO dao = new UserDAO();
        User user = dao.getUserById(id);

        if(user == null){
            response.getWriter().println("User not found!");
            return;
        }

        request.setAttribute("user", user);

        RequestDispatcher rd = request.getRequestDispatcher("/UpdateUser.jsp");  

        rd.forward(request, response);

    } catch(NumberFormatException e){
    response.getWriter().println("Invalid ID format!");
}
  
    catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("Error loading user data!");
    }
}
}
