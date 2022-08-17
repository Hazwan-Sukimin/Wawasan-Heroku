package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class dupDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    ResultSet rs = null;
    
    public dupDAO(Connection conn){
        this.conn = conn;
    }
    
    public int getPartID(String partName){
        int part_id = 0;
        
        try{
            Connection conn = DB.createConnection();
            
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM part WHERE parts_name = ? OR parts_id = ?");
            ps.setString(1,partName);
            ps.setString(2,partName);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                part_id = rs.getInt("parts_id");
            }
            
        }
        catch(Exception e){
            System.out.print(e);
        } finally{
            close(ps,rs);
        }
        
        return part_id;
    }
    
    // check the quantity must not exceed the quantity that owner register
    public boolean checkQuantity(String part_id, int quantity){
        try{
            Connection conn = DB.createConnection();
            
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM part WHERE parts_id = ?");
            ps.setString(1,part_id);
            
            rs = ps.executeQuery();
            while(rs.next()) {
                if (quantity > rs.getInt("parts_qty")) {
                    return true;
                }
            }
        }
        catch(Exception e){
            System.out.print(e);
        } finally{
            close(ps,rs);
        }
        return false;
    }
    
    public boolean newDUP(int device_id, int parts_id, int dup_qty){
        try{
            conn = DB.createConnection();
            
            ps3 = conn.prepareStatement("SELECT PARTS_QTY FROM PART WHERE PARTS_ID = ?");
            ps3.setInt(1, parts_id);
            
            rs = ps3.executeQuery();
            
            int current_qty=0;
            if(rs.next()){
                current_qty = Integer.parseInt(rs.getString("PARTS_QTY"));
            }
            
            if(current_qty <= 0){
                return false;
            }
            else{  
                ps = conn.prepareStatement("INSERT INTO DEVICE_USED_PARTS (QUANTITY, DATE_USED, DEVICE_ID, PARTS_ID) VALUES (?,CONVERT_TZ(NOW(),'+00:00','+8:00'),?,?)");
                ps.setInt(1, dup_qty);
                ps.setInt(2, device_id);
                ps.setInt(3, parts_id);

                ps.executeUpdate();

                current_qty = current_qty - dup_qty;
                ps2 = conn.prepareStatement("UPDATE PART SET PARTS_QTY=? WHERE PARTS_ID=?");
                ps2.setInt(1,current_qty);
                ps2.setInt(2,parts_id);
                
                ps2.executeUpdate();
                
                return true;
            }
        }
        catch(Exception e){
            System.out.print(e);
        }
        return false;
    }
    
    // close connection
    private void close(PreparedStatement stmt, ResultSet rs){
        try {
            if (rs != null) {
                rs.close();
            }
            
            if (stmt != null) {
                stmt.close();
            }
        } catch (Exception e) {e.printStackTrace();}
    }
}
