package dao;

import bean.PartUsed;
import static dao.customerDAO.cd;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class PartsUsedDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    static PartsUsedDao pud = new PartsUsedDao(DB.createConnection());

    public PartsUsedDao(Connection conn){
        this.conn = conn;
    }
    
    public ArrayList getAllUsedParts(){
        ArrayList al = new ArrayList();
        PartUsed pu = new PartUsed();
        
        try{
            String sql = "SELECT * FROM parts_used";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                pu.setUsed_part_id(rs.getInt("used_part_id"));
                pu.setPart_id(rs.getInt("part_id"));
                pu.setQuantity(rs.getInt("quantity"));
                pu.setWarranty_id(rs.getInt("warranty_id"));
                pu.setTotal_price(rs.getInt("total_price"));
                
                al.add(pu);
                pu = new PartUsed();
            }
            
            return al;
        }catch(Exception e){
            e.printStackTrace();
        }
        return al;
    }
    
    public boolean isExist(int id){
        ArrayList al = pud.getAllUsedParts();
        for (int i = 0; i < al.size(); i++) {
            PartUsed pu = (PartUsed) al.get(i);
            if (pu.getPart_id()==id) {
                return true;
            }
        }
        return true;
    }
    
    public String getEndDate(int Used_Part_Id){
        try{
            String end_date= "";
            String sql = "SELECT DATE_FORMAT(end_date, '%d - %M - %Y') AS 'end_date' FROM parts_used JOIN warranty USING (warranty_id) WHERE used_part_id = ?";
            ps = this.conn.prepareStatement(sql);
            ps.setInt(1, Used_Part_Id);
            
            rs = ps.executeQuery();
            while(rs.next()){
                end_date = rs.getString("end_date");
            }
            return end_date;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return "";
    }

    //highest id
    public int highestId(){
        PartUsed pu = new PartUsed();
        
        try{
            String sql = "SELECT * FROM parts_used ORDER BY used_part_id DESC LIMIT 1";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                pu.setUsed_part_id(rs.getInt("used_part_id"));
                
            }
            
            return pu.getUsed_part_id();
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}
