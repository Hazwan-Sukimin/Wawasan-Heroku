package servlets;

import dao.DB;
import dao.paymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "registerPaymentServlet", urlPatterns = {"/registerPaymentServlet"})
public class registerPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int repair_id = Integer.parseInt(request.getParameter("repair_id"));
        String payment_type = request.getParameter("payment_type");
        int status_id = 9;
        
        paymentDAO payDAO = new paymentDAO(DB.createConnection());
        
        boolean flag = payDAO.newPayment(repair_id, payment_type, status_id);
        
        if(flag){
            out.println("<script type=\"text/javascript\">");
            out.println("var repair_id = " + repair_id);
            out.println("location='Login/CUSTOMER/viewRepair.jsp?id="+repair_id+"';");
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
