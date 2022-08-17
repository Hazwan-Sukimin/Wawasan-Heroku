package servlets;

import bean.ServicesBean;
import dao.DB;
import dao.ServicesDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServices", urlPatterns = {"/RegisterServices"})
public class RegisterServices extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // request parameter
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        
        
        // Bean
        ServicesBean sb = new ServicesBean(title,description,price);
        
        // Dao
        ServicesDao sd = new ServicesDao(DB.createConnection());
        
        // Inser to database
        if (sd.isExist(sb)) {
            // Send to jsp page
            request.setAttribute("msgs", "Duplicate");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/serviceList.jsp");
            rd.forward(request, response);
        } else {
            if (sd.registerNewServices(sb)) {
                // Send to jsp page
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/serviceList.jsp");
                rd.forward(request, response);
            } else {
                // Send to jsp page
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/serviceList.jsp");
                rd.forward(request, response);
            }
        }
    }

}
