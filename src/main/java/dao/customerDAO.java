package dao;

import bean.Address;
import bean.Customer;
import bean.CustomerBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class customerDAO {
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    static customerDAO cd = new customerDAO(DB.createConnection());
    
    public customerDAO(Connection conn){
        this.conn = conn;
    }
    
    // Get All Customer
    public ArrayList getAllCustomer(){
        Customer c = new Customer();
        ArrayList al = new ArrayList();
        try {
            String sql = "SELECT * FROM customer";
            
            pstmt = this.conn.prepareStatement(sql);
            
            rs2 = pstmt.executeQuery();
            while (rs2.next()) {
                c.setCustomer_id(rs2.getInt("customer_id"));
                c.setFullname(rs2.getString("fullname"));
                c.setPhone(rs2.getString("phone"));
                c.setEmail(rs2.getString("email"));
                c.setPassword(rs2.getString("password"));
                c.setAddress_id(rs2.getInt("address_id"));
                
                al.add(c);
                c = new Customer();
            }

            return al;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
    }
    
    public boolean isExist(Customer c){
        String phone = c.getPhone();
        String email = c.getEmail();
        
        ArrayList al = cd.getAllCustomer();
        for (int i = 0; i < al.size(); i++) {
            Customer customer = (Customer) al.get(i);
            if (customer.getEmail().equals(email) || customer.getPhone().equals(phone)) {
                return true;
            }
        }
        return false;
    }
    
    public boolean isExistPhone(Customer c){
        String phone = c.getPhone();
        
        ArrayList al = cd.getAllCustomer();
        for (int i = 0; i < al.size(); i++) {
            Customer customer = (Customer) al.get(i);
            if (customer.getPhone().equals(phone)) {
                return true;
            }
        }
        return false;
    }
    
    public boolean isExistPhone(String phone){
        
        ArrayList al = cd.getAllCustomer();
        for (int i = 0; i < al.size(); i++) {
            Customer customer = (Customer) al.get(i);
            if (customer.getPhone().equals(phone)) {
                return true;
            }
        }
        return false;
    }
    
//    public static void main(String[] args) {
//        
//    }
    
    public String findPhone(Customer c){
        
        ArrayList al = cd.getAllCustomer();
        for (int i = 0; i < al.size(); i++) {
            Customer customer = (Customer) al.get(i);
            if (customer.getPhone().equals(c.getPhone())) {
                return customer.getCustomer_id()+"";
            }
        }
        return "";
    }
    
    public Customer findPhoneCustomer(Customer c){
        
        ArrayList al = cd.getAllCustomer();
        for (int i = 0; i < al.size(); i++) {
            Customer customer = (Customer) al.get(i);
            if (customer.getPhone().equals(c.getPhone())) {
                return customer;
            }
        }
        return null;
    }
    
    // Update Customer
    public boolean updateCustomer(Customer c){
        try{
            pstmt = conn.prepareStatement("UPDATE customer SET password=?, phone=?, email=? WHERE customer_id=?");
            pstmt.setString(1, c.getPassword());
            pstmt.setString(2, c.getPhone());
            pstmt.setString(3, c.getEmail());
            pstmt.setInt(4, c.getCustomer_id());
            
            pstmt.executeUpdate();
            
            return true;
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return false;
    }
    
    
    public Customer authenticate(String cust_phone, String cust_password)
    {
        Customer customer = new Customer();
        
        try{
            pstmt = conn.prepareStatement("SELECT * FROM customer WHERE phone=? AND password=?");
            pstmt.setString(1, cust_phone);
            pstmt.setString(2, cust_password);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                customer.setCustomer_id(Integer.parseInt(rs.getString("customer_id")));
                customer.setPassword(rs.getString("password"));
                customer.setFullname(rs.getString("fullname"));
                customer.setPhone(rs.getString("phone"));
                customer.setEmail(rs.getString("email"));               
                
                return customer;
            }
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return null;
    }
    
    //Register New Customer
    public boolean registerNewCustomer(Customer c,Address a){
        
        try {        
            // check address if exist than get its id
            AddressDao ad = new AddressDao(DB.createConnection());
            String sql = "";
            int address_id = ad.isExist(a);
            
            if (address_id != 0) {
                // register customer using this address id
                sql = "INSERT INTO `customer` (`fullname`, `phone`, `email`, `password`, `address_id`) VALUES (?, ?, ?, ?, "+address_id+")";
                pstmt = this.conn.prepareStatement(sql);
                
                pstmt.setString(1, c.getFullname());
                pstmt.setString(2, c.getPhone());
                pstmt.setString(3, c.getEmail());
                pstmt.setString(4, c.getPassword());
                
                pstmt.executeUpdate();
                
            } else {
                // create new address id
                sql = "INSERT INTO `address` (`line1`, `line2`, `postcode`, `city`, `state`, `country`) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = this.conn.prepareStatement(sql);
                pstmt.setString(1, a.getLine1());
                pstmt.setString(2, a.getLine2());
                pstmt.setInt(3, a.getPostcode());
                pstmt.setString(4, a.getCity());
                pstmt.setString(5, a.getState());
                pstmt.setString(6, a.getCountry());
                
                pstmt.executeUpdate();
                
                // Register New Customer With new address id
                address_id = ad.isExist(a);
                String sql2 = "INSERT INTO `customer` (`fullname`, `phone`, `email`, `password`, `address_id`) VALUES (?, ?, ?, ?, "+address_id+")";
                pstmt = this.conn.prepareStatement(sql2);
                
                pstmt.setString(1, c.getFullname());
                pstmt.setString(2, c.getPhone());
                pstmt.setString(3, c.getEmail());
                pstmt.setString(4, c.getPassword());
                
                pstmt.executeUpdate();
            }
            
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return false;
    }
    
    public boolean registerCustomer(CustomerBean customer){
        try{
            pstmt = conn.prepareStatement("INSERT INTO customer (password, fullname, phone, email) VALUES (?,?,?,?)");
            pstmt.setString(1, customer.getCustPassword());
            pstmt.setString(2, customer.getCustName());
            pstmt.setString(3, customer.getCustPhone());
            pstmt.setString(4, customer.getCustEmail());
            
            pstmt.executeUpdate();
            
            return true;
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return false;
    }
    
    public boolean updateCustomerInfo(CustomerBean customer){
        
        try{
            pstmt = conn.prepareStatement("UPDATE CUSTOMER SET password=?, fullname=?, phone=?, email=? WHERE customer_id=?");
            pstmt.setString(1, customer.getCustPassword());
            pstmt.setString(2, customer.getCustName());
            pstmt.setString(3, customer.getCustPhone());
            pstmt.setString(4, customer.getCustEmail());
            pstmt.setInt(5, customer.getCustID());
            
            pstmt.executeUpdate();
            
            return true;
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return false;
    }
    
    //Close Connection
    private void close(Connection conn, PreparedStatement p, ResultSet rs){
        try {
            if (rs != null) {
                rs.close();
            }

            if (pstmt != null) {
                pstmt.close();
            }

            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
