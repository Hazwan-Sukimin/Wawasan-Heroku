package servlets;

import bean.Address;
import bean.Customer;
import bean.CustomerBean;
import dao.DB;
import dao.customerDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "registerCustomerServlet", urlPatterns = {"/registerCustomerServlet"})
public class registerCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String fullname = request.getParameter("fullname");
        
        String phone = request.getParameter("phone");
        if (phone.length() > 11 || phone.length() < 10) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/custReg.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (!phone.substring(0,2).equals("01")) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/custReg.jsp");
            rd.forward(request, response);
            return;
        }
        
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        
        String line1 = request.getParameter("line1");
        String line2 = request.getParameter("line2");
        String postcode = request.getParameter("postcode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        
        // trim whitespace
        String fullname_trim = fullname.trim().replaceAll(" +", " ");
        String line1_trim = line1.trim().replaceAll(" +", " ");
        String line2_trim = line2.trim().replaceAll(" +", " ");
        
        
        Customer c = new Customer(fullname_trim,phone,email,password);
        Address a = new Address(line1_trim,line2_trim,postcode,city,state,country);
        
        // Instantiate an Data Access Object
        customerDAO cd = new customerDAO(DB.createConnection());
        
        if (cd.isExist(c)) {
            // Send to jsp page
            request.setAttribute("msgs", "Fail");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/custReg.jsp");
            rd.forward(request, response);
        } else {
            //checking instances
            if (cd.registerNewCustomer(c, a)) {
                // Send to jsp page
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/custReg.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/custReg.jsp");
                rd.forward(request, response);
            }
        }
        
        
    }
}
