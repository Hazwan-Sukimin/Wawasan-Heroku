package servlets;

import dao.DB;
import dao.historyDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "progressHistoryServlet", urlPatterns = {"/progressHistoryServlet"})
public class progressHistoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        int device_id = Integer.parseInt(request.getParameter("device_id"));
        int status_id = Integer.parseInt(request.getParameter("new_status_id"));
        
        historyDAO shDAO = new historyDAO(DB.createConnection());
        
        boolean flag = shDAO.addHistory(device_id, status_id);
        
        if(flag){
            out.println("<script type=\"text/javascript\">");
            out.println("var device_id = " + device_id);
            out.println("location='Login/TECHNICIAN/deviceInfo.jsp?id="+device_id+"';");
            out.println("</script>");
        }
        else{
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error!!');");
            out.println("window.history.back();");
            out.println("</script>");
        }
    }
}
