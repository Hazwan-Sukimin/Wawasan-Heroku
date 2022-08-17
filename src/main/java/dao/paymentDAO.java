package dao;

import bean.CustomerBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class paymentDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    PreparedStatement ps4 = null;
    ResultSet rs = null;
    
    public paymentDAO(Connection conn){
        this.conn = conn;
    }
    
    public boolean newPayment(int repair_id, String payment_type, int status_id){
        try{
            ps = conn.prepareStatement("INSERT INTO PAYMENT (PAYMENT_DATETIME, PAYMENT_TYPE, REPAIR_ID) VALUES (CURRENT_TIMESTAMP(),?,?)");
            ps.setString(1, payment_type);
            ps.setInt(2, repair_id);
            
            ps.executeUpdate();
            
            ps2 = conn.prepareStatement("UPDATE REPAIR_JOB SET STATUS_ID=? WHERE REPAIR_ID=?");
            ps2.setInt(1, status_id);
            ps2.setInt(2, repair_id);
            
            ps2.executeUpdate();
            
            ps3 = conn.prepareStatement("SELECT PAYMENT_ID FROM PAYMENT ORDER BY PAYMENT_ID DESC LIMIT 1");
            rs = ps3.executeQuery();
            
            int payment_id=0;
            if(rs.next()){
                payment_id = Integer.parseInt(rs.getString("PAYMENT_ID"));
            }
            
            ps4 = conn.prepareStatement("INSERT INTO RECEIPT (RECEIPT_DATETIME, PAYMENT_ID) VALUES (CURRENT_TIMESTAMP(),?)");
            ps4.setInt(1, payment_id);
            
            ps4.executeUpdate();
            
            return true;
        }
        catch(SQLException e){
             e.printStackTrace();
        }
        return false;
    }
}
