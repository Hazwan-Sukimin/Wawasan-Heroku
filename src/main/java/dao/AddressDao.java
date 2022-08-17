package dao;

import bean.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class AddressDao {
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    static AddressDao ad = new AddressDao(DB.createConnection());

    public AddressDao(Connection conn) {
        this.conn = conn;
    }
    
    //Add New Services
    public boolean registerNewAddress(Address ad){
        try {
            String sql = "INSERT INTO `address` (`line1`, `line2`, `postcode`, `city`, `state`, `country`) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = this.conn.prepareStatement(sql);

            pstmt.setString(1, ad.getLine1());
            pstmt.setString(2, ad.getLine2());
            pstmt.setInt(3, ad.getPostcode());
            pstmt.setString(4, ad.getCity());
            pstmt.setString(5, ad.getState());
            pstmt.setString(6, ad.getCountry());

            pstmt.executeUpdate();

            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return false;
    }
    
    //Fetch all Address
    public ArrayList getAllAddress(){
        Address a = new Address();
        ArrayList al = new ArrayList();
        try {
            String sql = "SELECT * FROM address";
            
            pstmt = this.conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            while (rs.next()) {
                a.setAddress_id(rs.getInt("address_id"));
                a.setLine1(rs.getString("line1"));
                a.setLine2(rs.getString("line2"));
                a.setPostcode(rs.getInt("postcode"));
                a.setCity(rs.getString("city"));
                a.setState(rs.getString("state"));
                a.setCountry(rs.getString("country"));
                
                al.add(a);
                a = new Address();
                
            }

            return al;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
    }
    
//    public static void main(String[] args) {
//        Address a = new Address("1233","123",43200,"123","123","123");
//        System.out.println(ad.isExist(a));
//    }
    
    // check existing address
    public int isExist(Address a){
        String line1_0 = a.getLine1().replaceAll("\\s+","").toLowerCase();
        String line2_0 = a.getLine2().replaceAll("\\s+","").toLowerCase();
        
        ArrayList al = ad.getAllAddress();
        for(int i=0; i< al.size(); i++){   
            Address address = (Address) al.get(i); 
            String line1 = address.getLine1().replaceAll("\\s+","").toLowerCase();
            String line2 = address.getLine2().replaceAll("\\s+","").toLowerCase();
            
            if (line1_0.equals(line1) && line2_0.equals(line2)) {
                return address.getAddress_id();
            }
        }
        return 0;
    }
    
    public boolean updateAddress(Address a,String customer_id){
        try{
            if(ad.registerNewAddress(a)){
                int high_id = ad.highestId();
                pstmt = conn.prepareStatement("UPDATE customer SET address_id=? WHERE customer_id = ?");
                pstmt.setInt(1, high_id);
                pstmt.setString(2, customer_id);
                
                pstmt.executeUpdate();
                
                return true;
            } else {
                return false;
            }
            
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return false;
    }
    
    public boolean updateAddress(int a,String customer_id){
        try{
                
            pstmt = conn.prepareStatement("UPDATE customer SET address_id=? WHERE customer_id = ?");
            pstmt.setInt(1, a);
            pstmt.setString(2, customer_id);

            pstmt.executeUpdate();

            return true;
            
            
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        
        return false;
    }
    
    public int highestId(){
        Address a = new Address();
        
        try{
            String sql = "SELECT * FROM address ORDER BY address_id DESC LIMIT 1";
            pstmt = this.conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                a.setAddress_id(rs.getInt("address_id"));
                
            }
            
            return a.getAddress_id();
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    
    //Close Connection
    private void close(Connection conn, PreparedStatement pstmt, ResultSet rs){
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
