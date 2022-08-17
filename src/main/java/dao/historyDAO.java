package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class historyDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    ResultSet rs = null;
    
    public historyDAO(Connection conn){
        this.conn = conn;
    }
    
    public boolean addHistory(int device_id, int status_id){
        
        try{
            conn = DB.createConnection();
            
            ps = conn.prepareStatement("INSERT INTO STATUS_HISTORY (HISTORY_DATETIME, DEVICE_ID, STATUS_ID) VALUES (CURRENT_TIMESTAMP(),?,?)");
            ps.setInt(1,device_id);
            ps.setInt(2, status_id);
            
            ps.executeUpdate();
            
            return true;
        }
        catch(Exception e){
            System.out.print(e);
        }
        return false;
    }
}
