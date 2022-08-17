package dao;

import bean.Address;
import bean.StaffBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class StaffDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    ResultSet rs = null;
    static StaffDAO sd = new StaffDAO(DB.createConnection());
    
    public StaffDAO(Connection conn){
        this.conn = conn;
    }
    
    public StaffBean getStaff(int st_id, String st_password)
    {
        StaffBean staff = new StaffBean();
        
        try{
            ps = conn.prepareStatement("SELECT * FROM staff WHERE staff_id = ? AND password = ? AND status='active'");
            ps.setInt(1, st_id);
            ps.setString(2, st_password);
            
            rs = ps.executeQuery();
            
            if(rs.next()){
                staff.setStaff_id(rs.getInt("staff_id"));
                staff.setFullname(rs.getString("fullname"));
                staff.setEmail(rs.getString("email"));
                staff.setPhone(rs.getString("phone"));
                staff.setAddress_id(rs.getInt("address_id"));
                staff.setPosition(rs.getString("position"));
                staff.setStatus(rs.getString("status"));
                
                return staff;
            }
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return null;
    }
    
    
    // Get All Staff Information
    public ArrayList getAllStaff(){
        StaffBean sb = new StaffBean();
        ArrayList al = new ArrayList();
        
        try {
            String sql = "SELECT * FROM staff";
            
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                sb.setStaff_id(rs.getInt("staff_id"));
                sb.setFullname(rs.getString("fullname"));
                sb.setEmail(rs.getString("email"));
                sb.setPhone(rs.getString("phone"));
                sb.setAddress_id(rs.getInt("address_id"));
                sb.setPosition(rs.getString("position"));
                sb.setPassword(rs.getString("password"));
                sb.setStatus(rs.getString("status"));
                
                
                al.add(sb);
                sb = new StaffBean();
            }

            return al;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
        
    }
    
    // check if staff is exist
    public boolean isExist(StaffBean sb){
        String phone = sb.getPhone();
        String email = sb.getEmail();
        
        ArrayList al = sd.getAllStaff();
        for (int i = 0; i < al.size(); i++) {
            StaffBean staff = (StaffBean) al.get(i);
            if (staff.getEmail().equals(email) || staff.getPhone().equals(phone)) {
                return true;
            }
        }
        return false;
    }
    
    //Register New Customer
    public boolean registerNewStaff(StaffBean c,Address a){
        
        try {        
            // check address if exist than get its id
            AddressDao ad = new AddressDao(DB.createConnection());
            String sql = "";
            int address_id = ad.isExist(a);
            
            if (address_id != 0) {
                // register customer using this address id
                sql = "INSERT INTO `staff` (`fullname`, `email`, `phone`, `address_id`) VALUES (?, ?, ?, "+address_id+")";
                ps = this.conn.prepareStatement(sql);
                
                ps.setString(1, c.getFullname());
                ps.setString(2, c.getEmail());
                ps.setString(3, c.getPhone());
                
                ps.executeUpdate();
                
            } else {
                // create new address id
                sql = "INSERT INTO `address` (`line1`, `line2`, `postcode`, `city`, `state`, `country`) VALUES (?, ?, ?, ?, ?, ?)";
                ps = this.conn.prepareStatement(sql);
                ps.setString(1, a.getLine1());
                ps.setString(2, a.getLine2());
                ps.setInt(3, a.getPostcode());
                ps.setString(4, a.getCity());
                ps.setString(5, a.getState());
                ps.setString(6, a.getCountry());
                
                ps.executeUpdate();
                
                // Register New Customer With new address id
                address_id = ad.isExist(a);
                String sql2 = "INSERT INTO `staff` (`fullname`, `email`, `phone`, `address_id`, `position`, `password`, `status`) VALUES (?, ?, ?, "+address_id+", ?, ?, ?)";
                ps = this.conn.prepareStatement(sql2);
                
                ps.setString(1, c.getFullname());
                ps.setString(2, c.getEmail());
                ps.setString(3, c.getPhone());
                ps.setString(4, c.getPosition());
                ps.setString(5, c.getPassword());
                ps.setString(6, c.getStatus());
                
                ps.executeUpdate();
            }
            
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return false;
    }
    
    public boolean updateStaff(StaffBean staff){
         
        try{
            ps = conn.prepareStatement("UPDATE staff SET password = ?, phone = ? WHERE staff_id = ?");
            ps.setString(1, staff.getPassword());
            ps.setString(2, staff.getPhone());
            ps.setInt(3, staff.getStaff_id());
            
            ps.executeUpdate();
            
            return true;
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return false;
    }
    
    public boolean updateFullname(String id, String fullname){
         
        try{
            ps = conn.prepareStatement("UPDATE staff SET fullname=? WHERE staff_id = ?");
            ps.setString(1, fullname);
            ps.setString(2, id);
            
            ps.executeUpdate();
            
            return true;
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return false;
    }
    
    // Add new Staff
    public boolean addStaff(StaffBean sb){
        // if ic is null gender and age will be null
        try {
            String sql = "INSERT INTO staff(staff_password,staff_name,staff_phone,staff_address,staff_access,account_status) VALUES(?,?,?,?,'TECHNICIAN','ACTIVE')";
        
            ps = this.conn.prepareStatement(sql);
            
//            ps.setString(1, sb.getStaffPhone());
//            ps.setString(2, sb.getStaffName());
//            ps.setString(3, sb.getStaffPhone());
//            ps.setString(4, sb.getStaffAddress());
            
            ps.executeUpdate();
            
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            close(conn,ps,rs);
        }
        
        return false;
    }
    
    public boolean updateStaffStatus(List list){
        try{
            String sql = "UPDATE `staff` SET `status`=? WHERE  `staff_id`=?";
            ps2 = conn.prepareStatement(sql);
            
            for (int i = 0; i < list.size(); i++) {
                String id = (String) list.get(i);
                String id_split[] = id.split(",");
                
                ps2.setString(2, id_split[0]);
                ps2.setString(1, id_split[1].toLowerCase());
                ps2.addBatch();
            }
            
            int[] record = ps2.executeBatch();
            
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return false;
    }
    
//    public static void main(String[] args) {
//        String[] status = new String[3];
//        status[0] = "2,INACTIVE";
//        status[1] = "3,INACTIVE";
//        status[2] = "9,INACTIVE";
//        
//        List<String> list = new ArrayList<String>(Arrays.asList(status));
//        System.out.println(sd.updateStaffStatus(list));
//        
//    }
    
    private void close(Connection conn, PreparedStatement stmt, ResultSet rs){
        try {
            if (rs != null) {
                rs.close();
            }
            
            if (stmt != null) {
                stmt.close();
            }
            
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {e.printStackTrace();}
    }
    
}
