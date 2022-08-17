package servlets;

import bean.PartsBean;
import dao.DB;
import dao.PartsDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateParts", urlPatterns = {"/UpdateParts"})
public class UpdateParts extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // request parameter
        String partsid = request.getParameter("partsid");
        String name = request.getParameter("parts_name");
        String qty = request.getParameter("parts_qty");
        String buy = request.getParameter("parts_buy");
        String sell = request.getParameter("parts_sell");
        String warranty = request.getParameter("parts_warranty");
        
        // Bean
        PartsBean pb = new PartsBean();
        pb.setId(Integer.parseInt(partsid));
        pb.setName(name);
        
        // Dao
        PartsDao pd = new PartsDao(DB.createConnection());
        
        // Inser to database
//        if (pd)) {
//            out.println("<script type='text/javascript'>");
//            out.println("alert('Update Successful');");
//            out.println("location='Login/OWNER/update-parts.jsp?partid="+partsid+"';");
//            out.println("</script>");
//        } else {
//            out.println("<script type='text/javascript'>");
//            out.println("alert('Update Fail');");
//            out.println("location='Login/OWNER/update-parts.jsp?partid="+partsid+"';");
//            out.println("</script>");
//        }
    }

}
