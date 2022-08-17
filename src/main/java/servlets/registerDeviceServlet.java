package servlets;

import bean.DeviceBean;
import dao.DB;
import dao.deviceDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "registerDeviceServlet", urlPatterns = {"/registerDeviceServlet"})
public class registerDeviceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String type =request.getParameter("type");
        if (type == null) {
            request.setAttribute("msgs", "NullType");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/deviceList.jsp");
            rd.forward(request, response);
        }
        String name =request.getParameter("name");
        String brand =request.getParameter("brand");
        String model =request.getParameter("model");
        
        // trim whitespace
        String name_trim = name.trim().replaceAll(" +", " ");
        String brand_trim = brand.trim().replaceAll(" +", " ");
        String model_trim = model.trim().replaceAll(" +", " ");


        DeviceBean device = new DeviceBean(type,name_trim,brand_trim,model_trim);
        deviceDAO dd = new deviceDAO(DB.createConnection());
        
        // Inser to database
        if (dd.isExist(device)) {
            // Send to jsp page
            request.setAttribute("msgs", "Duplicate");
            RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/deviceList.jsp");
            rd.forward(request, response);
        } else {
            if (dd.registerNewDevice(device)) {
                // Send to jsp page
                request.setAttribute("msgs", "Success");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/deviceList.jsp");
                rd.forward(request, response);
            } else {
                // Send to jsp page
                request.setAttribute("msgs", "Fail");
                RequestDispatcher rd = request.getRequestDispatcher("Login/OWNER/deviceList.jsp");
                rd.forward(request, response);
            }
        }

        //        request.setAttribute("msgs", device.toString());
//        RequestDispatcher rd = request.getRequestDispatcher("dummy.jsp");
//        rd.forward(request, response);
    }
}
