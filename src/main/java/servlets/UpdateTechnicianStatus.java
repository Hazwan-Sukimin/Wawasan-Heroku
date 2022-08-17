package servlets;

import dao.DB;
import dao.StaffDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateTechnicianStatus extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        StaffDAO sd = new StaffDAO(DB.createConnection());
        
        String[] status = request.getParameterValues("status");
        List<String> list = new ArrayList<String>(Arrays.asList(status));
        
        if (sd.updateStaffStatus(list)) {
            request.setAttribute("msgs", "UpdateSuccess");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/technicianList.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msgs", "UpdateFail");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/technicianList.jsp");
            rd.forward(request, response);
        }
        
    }

}
