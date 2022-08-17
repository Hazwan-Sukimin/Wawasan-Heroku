package servlets;

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


@WebServlet(name = "updateCustomerServlet", urlPatterns = {"/updateCustomerServlet"})
public class updateCustomerServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // parameter
        String customer_id = request.getParameter("customer_id");
        String phone = request.getParameter("phone");
        if (phone.length() > 11 || phone.length() < 10) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        if (!phone.substring(0,2).equals("01")) {
            request.setAttribute("msgs", "Format");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        
        String password = request.getParameter("password");
        if (password.length() < 8) {
            request.setAttribute("msgs", "FormatPassword");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
            rd.forward(request, response);
            return;
        }
        
        String email = request.getParameter("email");
        
        if (password.equals("") || phone.equals("") || email.equals("") ) {
            request.setAttribute("msgs", "Null");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
            rd.forward(request, response);
        }
        
        customerDAO cd = new customerDAO(DB.createConnection());
        Customer c = new Customer();
        c.setCustomer_id(customer_id);
        c.setPhone(phone);
        c.setPassword(password);
        c.setEmail(email);

        if (cd.isExist(c)) {
            request.setAttribute("msgs", "Duplicate");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
            rd.forward(request, response);
        } else {
            if (cd.updateCustomer(c)) {
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
                rd.forward(request, response);
            }
        }
        
    }
}
