package dao;

import bean.PartsBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

public class PartsDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    static PartsDao pd = new PartsDao(DB.createConnection());
    
    
    public PartsDao(Connection conn){
        this.conn = conn;
    }
    
    // Get All Parts
    public ArrayList getAllParts(){
        ArrayList al = new ArrayList();
        PartsBean pb = new PartsBean();
        
        try{
            String sql = "SELECT * FROM parts";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                pb.setId(rs.getInt("part_id"));
                pb.setDevice_support(rs.getString("device_support"));
                pb.setName(rs.getString("name"));
                pb.setPart_set(rs.getString("part_set"));
                pb.setBrand(rs.getString("brand"));
                pb.setModel(rs.getString("model"));
                pb.setBuy_cost(rs.getDouble("buy_cost"));
                pb.setSell_cost(rs.getDouble("sell_cost"));
                pb.setQuantity(rs.getInt("quantity"));
                pb.setWarranty_period(rs.getInt("warranty_period"));
                
                al.add(pb);
                pb = new PartsBean();
            }
            return al;
            
        } catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
    }
    
    public PartsBean fetchId(String id){
        PartsBean pb = new PartsBean();
        
        try{
            String sql = "SELECT * FROM parts WHERE part_id = ?";
            ps = this.conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                pb.setId(rs.getInt("part_id"));
                pb.setDevice_support(rs.getString("device_support"));
                pb.setName(rs.getString("name"));
                pb.setPart_set(rs.getString("part_set"));
                pb.setBrand(rs.getString("brand"));
                pb.setModel(rs.getString("model"));
                pb.setBuy_cost(rs.getDouble("buy_cost"));
                pb.setSell_cost(rs.getDouble("sell_cost"));
                pb.setQuantity(rs.getInt("quantity"));
                pb.setWarranty_period(rs.getInt("warranty_period"));
                
            }
            return pb;
            
        } catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
    }
    
    // Check Duplicate
    public boolean isExist(PartsBean pb){
        String name = pb.getName();
        String brand = pb.getBrand();
        String model = pb.getModel();
        
        ArrayList al = pd.getAllParts();
        for (int i = 0; i < al.size(); i++) {
            PartsBean part = (PartsBean) al.get(i);
            
            if (part.getName().equalsIgnoreCase(name) && part.getBrand().equalsIgnoreCase(brand) && part.getModel().equalsIgnoreCase(model)) {
                return true;
            }
        }
        return false;
    }
    
    // Register new parts
    public boolean registerNewParts(PartsBean pb){
        try{
            
            String sql = "INSERT INTO `parts` (`device_support`, `name`, `part_set`, `brand`, `model`, `buy_cost`, `sell_cost`,`quantity`, `warranty_period`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            // register customer using this address id
            ps = this.conn.prepareStatement(sql);

            ps.setString(1, pb.getDevice_support());
            ps.setString(2, pb.getName());
            ps.setString(3, pb.getPart_set());
            ps.setString(4, pb.getBrand());
            ps.setString(5, pb.getModel());
            ps.setDouble(6, pb.getBuy_cost());
            ps.setDouble(7, pb.getSell_cost());
            ps.setInt(8, pb.getQuantity());
            ps.setInt(9, pb.getWarranty_period());

            ps.executeUpdate();
            
            return true;
            
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return false;
    }
    
    // Get warranty period
    public String warrantyPeriod(PartsBean p){
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
        
        String cur_date = sdf.format(d);
        LocalDate date = LocalDate.parse(cur_date);
        
        String end_date = date.plusYears(p.getWarranty_period()).toString();
        
        
        return end_date;
    }
    
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
