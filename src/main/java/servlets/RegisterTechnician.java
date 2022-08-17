package servlets;

import bean.Address;
import bean.StaffBean;
import dao.DB;
import dao.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterTechnician", urlPatterns = {"/RegisterTechnician"})
public class RegisterTechnician extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Technician Information
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        if (phone.length() > 11 || phone.length() < 10) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/technicianList.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (!phone.substring(0,2).equals("01")) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/technicianList.jsp");
            rd.forward(request, response);
            return;
        }
        
        String email = request.getParameter("email");
        
        // Address Information
        String line1 = request.getParameter("line1");
        String line2 = request.getParameter("line2");
        String postcode = request.getParameter("postcode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
       
        StaffBean sb = new StaffBean(fullname,phone,email);
        Address a = new Address(line1,line2,postcode,city,state,country);
        
//        request.setAttribute("msgs", sb.toString());
//        RequestDispatcher rd = request.getRequestDispatcher("dummy.jsp");
//        rd.forward(request, response);
        
        // Dao
        StaffDAO sd = new StaffDAO(DB.createConnection());
        
        
        // Inser to database
        if (sd.isExist(sb)) {
            // Send to jsp page
            request.setAttribute("msgs", "Duplicate");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/technicianList.jsp");
            rd.forward(request, response);
        } else {
            if (sd.registerNewStaff(sb, a)) {
                // Send to jsp page
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/technicianList.jsp");
                rd.forward(request, response);
            } else {
                // Send to jsp page
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/technicianList.jsp");
                rd.forward(request, response);
            }
        }
    }

}
