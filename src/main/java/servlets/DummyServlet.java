package servlets;

import dao.DB;
import dao.repairJobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class DummyServlet extends HttpServlet {
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        //get staff id
        String[] staff_id = request.getParameterValues("technician");
        if (staff_id == null) {
            request.setAttribute("msgs", "Null");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/assign-technician.jsp");
            rd.forward(request, response);
            return;
        }
        
        List<String> list = new ArrayList<String>(Arrays.asList(staff_id));
        
        // data in list
        for (int i = 0; i < list.size(); i++) {
            String id = (String) list.get(i);
            String id_split[] = id.split(",");
            
            out.print("<br>"+id_split[0]+"<br>");
            out.print("<br>"+id_split[1]+"<br>");
        }
        
        repairJobDAO rjd = new repairJobDAO(DB.createConnection());
        
        // update repair order
        if (rjd.assignTechnician(list)) {
            request.setAttribute("msgs", "Success");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/assign-technician.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msgs", "Fail");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/assign-technician.jsp");
            rd.forward(request, response);
        }
        
        
//        Use this to remove any null node
//        list.removeAll(Collections.singleton(""));

    }
}
