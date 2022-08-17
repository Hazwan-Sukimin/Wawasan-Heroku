package dao;

import bean.Warranty;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WarrantyDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    static WarrantyDao sd = new WarrantyDao(DB.createConnection());

    public WarrantyDao(Connection conn){
        this.conn = conn;
    }
    
    //get all data
    public ArrayList getAllWarranty(){
        ArrayList al = new ArrayList();
        Warranty w = new Warranty();
        
        try{
            String sql = "SELECT * FROM warranty";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                w.setWarranty_id(rs.getInt("warranty_id"));
                w.setStart_date(rs.getString("start_date"));
                w.setEnd_date(rs.getString("end_date"));
                
                al.add(w);
                w = new Warranty();
            }
            
            return al;
        }catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    
    //highest id
    public int highestId(){
        Warranty w = new Warranty();
        
        try{
            String sql = "SELECT * FROM warranty ORDER BY warranty_id DESC LIMIT 1";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                w.setWarranty_id(rs.getInt("warranty_id"));
                
            }
            
            return w.getWarranty_id();
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    
    
}
