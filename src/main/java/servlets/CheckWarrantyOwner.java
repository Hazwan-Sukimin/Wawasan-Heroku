package servlets;

import bean.PartUsed;
import dao.DB;
import dao.PartsUsedDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckWarrantyOwner extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String used_part_id = request.getParameter("used_part_id");
        
        // Check the parts
        PartsUsedDao upd = new PartsUsedDao(DB.createConnection());
        PartUsed pu = new PartUsed();
        pu.setUsed_part_id(used_part_id);
        
        if (upd.getEndDate(pu.getUsed_part_id()).equals("")) {
            request.setAttribute("msgs", "Not Found");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/dashboard.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("end_date", upd.getEndDate(pu.getUsed_part_id()));
            request.setAttribute("used_part_id", used_part_id);
            request.setAttribute("msgs", "Found");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/dashboard.jsp");
            rd.forward(request, response);
        }
    }

}
