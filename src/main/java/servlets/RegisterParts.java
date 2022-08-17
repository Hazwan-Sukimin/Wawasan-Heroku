
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

@WebServlet(name = "RegisterParts", urlPatterns = {"/RegisterParts"})
public class RegisterParts extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String[] check = request.getParameterValues("check");
        String name = request.getParameter("name");
        String part_set = request.getParameter("part_set");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String buy_cost = request.getParameter("buy_cost");
        String sell_cost = request.getParameter("sell_cost");
        String quantity = request.getParameter("quantity");
        String warranty_period = request.getParameter("warranty_period");
        
        // trim whitespace
        String name_trim = name.trim().replaceAll(" +", " ");
        String brand_trim = brand.trim().replaceAll(" +", " ");
        String model_trim = model.trim().replaceAll(" +", " ");
        
        //split the device support
        String device_support = "";
        for (int i = 0; i < check.length; i++) {
            device_support += check[i]+", ";
        }
        device_support = device_support.substring(0,device_support.length()-2);
        
        
        // Create Object
        PartsBean p = new PartsBean(device_support,name_trim,part_set,brand_trim,model_trim,buy_cost,sell_cost,quantity,warranty_period);
        
        //Dao
        PartsDao pd = new PartsDao(DB.createConnection());
        
        if (pd.isExist(p)) {
            // Send to jsp page
            request.setAttribute("msgs", "Duplicate");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/partsList.jsp");
            rd.forward(request, response);
        } else {
            if (pd.registerNewParts(p)) {
                // Send to jsp page
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/partsList.jsp");
                rd.forward(request, response);
            } else {
                // Send to jsp page
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/partsList.jsp");
                rd.forward(request, response);
            }
        }
    }

}
