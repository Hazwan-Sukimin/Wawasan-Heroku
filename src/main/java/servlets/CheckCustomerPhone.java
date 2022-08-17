package servlets;

import bean.Customer;
import bean.RepairJobBean;
import dao.DB;
import dao.customerDAO;
import dao.repairJobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCustomerPhone extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        // Check which button is clicked
        String buttonPhone = request.getParameter("buttonPhone");
        String phone = request.getParameter("phone");
        //out.print("buttonPhone");
        
        // check customer phone
        Customer c = new Customer();
        c.setPhone(phone);
        customerDAO cd = new customerDAO(DB.createConnection());
        
        if (cd.isExistPhone(c)) {
            c = cd.findPhoneCustomer(c);
            
            request.setAttribute("customer", c);
            request.setAttribute("msgs", "true");
            
        } else {
            request.setAttribute("msgs", "false");
        }
        
        request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp").forward(request, response);
        
        
        // Bean
        RepairJobBean repair = new RepairJobBean();
        
        // DAO
        repairJobDAO repairDAO = new repairJobDAO(DB.createConnection());
    }

}
