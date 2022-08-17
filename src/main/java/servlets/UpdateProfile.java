package servlets;

import bean.StaffBean;
import dao.DB;
import dao.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // request parameter
        String staffid = request.getParameter("staffid");
        String pass = request.getParameter("password");
        String name = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        
        
        // DAO
        StaffDAO sd = new StaffDAO(DB.createConnection());
        
        // Bean
        StaffBean sb = new StaffBean();
        sb.setStaff_id(staffid);
        sb.setPassword(pass);
        sb.setPhone(phone);
        
        
//        out.print(phone.length());
        if (phone.length() > 11 || phone.length() < 10) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (!phone.substring(0,2).equals("01")) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (pass.length() < 8) {
            request.setAttribute("msgs", "FormatPassword");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        
        
        
//        request.setAttribute("staff", sb);
//        RequestDispatcher rd = request.getRequestDispatcher("dummy.jsp");
//        rd.forward(request, response);

        // Insert to database
        if (sd.updateStaff(sb)) {
            request.setAttribute("msgs", "Success");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/myProfile.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msgs", "Fail");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/myProfile.jsp");
            rd.forward(request, response);
        }
    }

}
