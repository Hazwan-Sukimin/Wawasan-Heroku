package servlets;

import bean.Customer;
import bean.DeviceBean;
import bean.PartsBean;
import bean.RepairJobBean;
import bean.ServicesBean;
import dao.DB;
import dao.PartsDao;
import dao.ServicesDao;
import dao.customerDAO;
import dao.deviceDAO;
import dao.repairJobDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "createRepairServlet", urlPatterns = {"/createRepairServlet"})
public class createRepairServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Param
        String information = request.getParameter("description");
        String description = request.getParameter("information");
        
        String quantity = request.getParameter("quantity");
        

        String phone = request.getParameter("phone");
        if (phone.length() > 11 || phone.length() < 10) {
            request.setAttribute("msgs", "PhoneFormat");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
            rd.forward(request, response);
            return;
        }
        if (!phone.substring(0,2).equals("01")) {
            request.setAttribute("msgs", "PhoneFormat");
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
            rd.forward(request, response);
            return;
        }
        
        String service_id = request.getParameter("service_id");
        String device_id = request.getParameter("device_id");
        String used_part_id = request.getParameter("part_id");
        
        
        Customer c = new Customer();
        c.setPhone(phone);
        
        ServicesBean sb = new ServicesBean();
        sb.setId(Integer.parseInt(service_id));
        
        DeviceBean db = new DeviceBean();
        db.setDevice_id(Integer.parseInt(device_id));
        
        RepairJobBean rjb;
        
        
        repairJobDAO rjd = new repairJobDAO(DB.createConnection());
        
        if (used_part_id.equalsIgnoreCase("")) {
            rjb = new RepairJobBean(service_id, device_id, phone, information, description);
            if (rjd.registerNewRepairJobnUP(rjb)) {
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
                rd.forward(request, response);
                return;
            } else {
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
                rd.forward(request, response);
                return;
            }   
        } else {
            if (!quantity.equals("") || quantity.isEmpty()) {
                rjb = new RepairJobBean(service_id, device_id, used_part_id, phone, information, description);
                if (rjd.registerNewRepairJobwUP(rjb,used_part_id, quantity)) {
                    request.setAttribute("msgs", "Success");
                    RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("msgs", "Fail");
                    RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("msgs", "fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
                rd.forward(request, response);
            }
        }
        
        
        // check out of stock
        
        // check customer exist && services && device
        
    }
}
