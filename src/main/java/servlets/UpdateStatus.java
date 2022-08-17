
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

public class UpdateStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String orderID = request.getParameter("job_id");
        repairJobDAO rjd = new repairJobDAO(DB.createConnection());
        
        if (rjd.updateStatus(orderID)) {
            request.setAttribute("msgs", "SuccessUpdate");
            request.setAttribute("job_id", orderID);
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msgs", "FailUpdate");
            request.setAttribute("job_id", orderID);
            RequestDispatcher rd = request.getRequestDispatcher("Login/TECHNICIAN/myRepairJob.jsp");
            rd.forward(request, response);
        }
    }

}
