package servlets;

import dao.DB;
import dao.repairJobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdatePayment extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String[] id = request.getParameterValues("repair_job_id");
        repairJobDAO rjd = new repairJobDAO(DB.createConnection());
        
        if (rjd.updatePayment(id)) {
            request.setAttribute("msgs", "Success");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/payment.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msgs", "Fail");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/payment.jsp");
            rd.forward(request, response);
        }
    }

}
