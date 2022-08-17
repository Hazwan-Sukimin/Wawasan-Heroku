package servlets;

import bean.Customer;
import bean.CustomerBean;
import bean.StaffBean;
import dao.DB;
import dao.customerDAO;
import dao.StaffDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // to write any javascript in servlet
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        

        out.println("<link rel='stylesheet' type='text/css' href='"+request.getContextPath()+"/assets/css/loader.css' />");
        out.println("</head>");
        out.println("<body>");
        
        // get all parameter
        String radioType = request.getParameter("radioLogin");
        String firstInput = request.getParameter("first_input");
        String password = request.getParameter("password");
        
        // Customer Controller
        if (radioType.equals("customer")) {
            // customer process here
            customerDAO custDAO = new customerDAO(DB.createConnection());
            Customer customer = custDAO.authenticate(firstInput, password);
            
            HttpSession session = request.getSession();
            session.setAttribute("customer",customer);
                
            if (customer == null) {
                request.setAttribute("errorMsgs", "customer");
                request.setAttribute("firstInput", firstInput);
                request.setAttribute("password", password);
                request.getRequestDispatcher("Login/Login.jsp").forward(request, response);
            } else {
               
                
                out.println("<img src='"+request.getContextPath()+"/assets/loader/loader.gif' id='loading'/>");
                out.println("<script>");
                out.println("location='Login/CUSTOMER/dashboard.jsp';");
                out.println("</script>");
            }
        }
        
        
        // Staff Controller
        if (radioType.equals("staff")) {
            // staff process here
            StaffDAO sd = new StaffDAO(DB.createConnection());
            StaffBean staff = new StaffBean();
            staff = sd.getStaff(Integer.parseInt(firstInput), password);
            
            if (staff == null) {
                request.setAttribute("errorMsgs", "staff");
                request.setAttribute("firstInput", firstInput);
                request.setAttribute("password", password);
                request.getRequestDispatcher("Login/Login.jsp").forward(request, response);
            }
            
            // make HttpSession
            HttpSession session = request.getSession();
            session.setAttribute("staff",staff);
            
            // GOTO TECHNICIAN
            if(staff.getPosition().equals("technician")){
                out.println("<img src='"+request.getContextPath()+"/assets/loader/loader.gif' id='loading'/>");
                out.println("<script type=\"text/javascript\">");
                out.println("location='Login/TECHNICIAN/dashboard.jsp';");
                out.println("</script>");

            } else{
                out.println("<img src='"+request.getContextPath()+"/assets/loader/loader.gif' id='loading'/>");
                out.println("<script type=\"text/javascript\">");
                out.println("location='Login/OWNER/dashboard.jsp';");
                out.println("</script>");
            }
        }
        
        out.println("</body>");
        out.println("</html>");
    }
}
