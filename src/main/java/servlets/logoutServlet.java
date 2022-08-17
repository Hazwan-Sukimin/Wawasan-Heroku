
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "logoutServlet", urlPatterns = {"/logoutServlet"})
public class logoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print("asdasdas");
        
        HttpSession session = request.getSession(false);
        if (session!=null){
            session.invalidate(); // remove all session
            request.getSession().invalidate();
            // redirect user to login pages
            request.setAttribute("msgs", "Success");
            RequestDispatcher rd = request.getRequestDispatcher("");
            rd.forward(request, response);
        }
    }
}