package servlets;

import bean.ServicesBean;
import dao.DB;
import dao.ServicesDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateSer", urlPatterns = {"/UpdateSer"})
public class UpdateServices extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // request parameter
        String servicesid = request.getParameter("services_id");
        String desc = request.getParameter("desc");
        String cost = request.getParameter("cost");
        String warranty = request.getParameter("warranty");
        
        // Bean
        ServicesBean sb = new ServicesBean();
        
        // Dao
        ServicesDao pd = new ServicesDao(DB.createConnection());
        
        // Update to database
//        if (pd.updateServices(sb)) {
//            out.println("<script type='text/javascript'>");
//            out.println("alert('Update Successful');");
//            out.println("location='Login/OWNER/update-service.jsp?serviceid="+servicesid+"';");
//            out.println("</script>");
//        } else {
//            out.println("<script type='text/javascript'>");
//            out.println("alert('Update Fail');");
//            out.println("location='Login/OWNER/update-service.jsp?serviceid="+servicesid+"';");
//            out.println("</script>");
//        }
    }

}
