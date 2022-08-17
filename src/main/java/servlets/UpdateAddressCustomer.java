package servlets;

import bean.Address;
import dao.AddressDao;
import dao.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateAddressCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String line1 = request.getParameter("line1");
        String line2 = request.getParameter("line2");
        String postcode = request.getParameter("postcode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String customer_id = request.getParameter("customer_id");
        

        
        Address a = new Address(line1,line2,postcode,city,state);
        AddressDao ad = new AddressDao(DB.createConnection());
        
        // if exist insert then update customer address id
        if (line1.equalsIgnoreCase("") || line2.equalsIgnoreCase("") || postcode.equalsIgnoreCase("") || city.equalsIgnoreCase("") || state.equalsIgnoreCase("")) {
            out.print("asd");
            request.setAttribute("msgs", "Null");
            RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
            rd.forward(request, response);
        } else {
            if (ad.isExist(a)!=0) {
                // address is exist then update customer address id
                int address_id = ad.isExist(a);
                
                if (ad.updateAddress(address_id, customer_id)) {
                    request.setAttribute("msgs", "Success");
                    RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("msgs", "Fail");
                    RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
                    rd.forward(request, response);
                }
            } else {
                // create new address
                if (ad.updateAddress(a,customer_id)) {
                    request.setAttribute("msgs", "Success");
                    RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("msgs", "Fail");
                    RequestDispatcher rd = request.getRequestDispatcher("Login/CUSTOMER/myProfile.jsp");
                    rd.forward(request, response);
                }
            }
        }
        
        
        
    }

}
