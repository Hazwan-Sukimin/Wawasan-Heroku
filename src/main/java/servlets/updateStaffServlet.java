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


@WebServlet(name = "updateStaffServlet", urlPatterns = {"/updateStaffServlet"})
public class updateStaffServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        
        String staff_id = request.getParameter("staff_id");
        String email = request.getParameter("email");
        
        String phone = request.getParameter("phone");
        out.print(phone.length());
        if (phone.length() > 11 || phone.length() < 10) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (!phone.substring(0,2).equals("01")) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        String password = request.getParameter("password");
        if (password.length() < 8) {
            request.setAttribute("msgs", "FormatPassword");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (password.equals("") || phone.equals("") || email.equals("") ) {
            request.setAttribute("msgs", "Null");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myProfile.jsp");
            rd.forward(request, response);
        }
        
        StaffBean sb = new StaffBean();
        sb.setPassword(password);
        sb.setPhone(phone);
        sb.setEmail(email);
        sb.setStaff_id(staff_id);
        
        
        StaffDAO sd = new StaffDAO(DB.createConnection());
         
        if (sd.isExist(sb)) {
            request.setAttribute("msgs", "Duplicate");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myProfile.jsp");
            rd.forward(request, response);
        } else {
            if (sd.updateStaff(sb)) {
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myProfile.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myProfile.jsp");
                rd.forward(request, response);
            }
        }
        
    }
}
