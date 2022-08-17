
package servlets;

import dao.DB;
import dao.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateTechnician extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // get parameter
        String staff_id = request.getParameter("staff_id");
        String fullname = request.getParameter("fullname");
        
        // DAO
        StaffDAO sd = new StaffDAO(DB.createConnection());
        // remove any doublespace to be 1 spaces only
        String fullname_trim = fullname.trim().replaceAll(" +", " ");
        
        if (sd.updateFullname(staff_id,fullname_trim)) {
            request.setAttribute("msgs", "SuccessUpdate");
            request.setAttribute("id", staff_id);
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/view-Technician.jsp?id="+staff_id);
            rd.forward(request, response);
        }else{
            request.setAttribute("msgs", "FailUpdate");
            request.setAttribute("id", staff_id);
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/view-Technician.jsp"+staff_id);
            rd.forward(request, response);
        }
        
    }

}
