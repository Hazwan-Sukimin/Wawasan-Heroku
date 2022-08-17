package servlets;

import dao.DB;
import dao.dupDAO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "registerDUPServlet", urlPatterns = {"/registerDUPServlet"})
public class registerDUPServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // device id to be assign a part to it
        int device_id = Integer.parseInt(request.getParameter("device_id"));
        
        // get parts id
        String partsData = request.getParameter("part_id");
        //int parts_id = Integer.parseInt(partsData);
        
        // get quantity of parts
        int dup_qty = Integer.parseInt(request.getParameter("dup_quantity"));
        
        dupDAO DupDAO = new dupDAO(DB.createConnection());
        
        // change parts name to id
        int parts_id = DupDAO.getPartID(partsData);
        if (parts_id == 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cannot find That part you requested, Please request your owner to register that parts you want');");
            out.println("window.history.back();");
            out.println("</script>");
        }
        
        /**
         * check quantity is enough or not
         * if true quantity technician key in is higher than stock quantity
         * if false quantity has enough stock.
         * */
        boolean flagQty = DupDAO.checkQuantity(partsData, dup_qty);
        if(flagQty) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Quantity is out of range');");
            out.println("window.history.back();");
            out.println("</script>");
        }
        
        boolean flag = DupDAO.newDUP(device_id, parts_id, dup_qty); 
        if(flag){
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Parts Added...');");
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
