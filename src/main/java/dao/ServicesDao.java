package dao;

import bean.ServicesBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ServicesDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    static ServicesDao sd = new ServicesDao(DB.createConnection());
    
    public ServicesDao(Connection conn){
        this.conn = conn;
    }
    
    // Get All Services
    public ArrayList getAllServices(){
        ArrayList al = new ArrayList();
        ServicesBean sb = new ServicesBean();
        
        try{
            String sql = "SELECT * FROM services";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                sb.setId(rs.getInt("service_id"));
                sb.setTitle(rs.getString("title"));
                sb.setDescription(rs.getString("description"));
                sb.setPrice(rs.getDouble("price"));
                
                al.add(sb);
                sb = new ServicesBean();
            }
            return al;
            
        } catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
    }
    
    public double getPrice(int service_id){
        double price = 0;
        try{
            String sql = "SELECT * FROM services WHERE service_id = "+service_id+";";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                price = rs.getInt("price");
            }
            
            return price;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return 0;
    }
    
    
    // check duplicate
    public boolean isExist(ServicesBean sb){
        String title = sb.getTitle();
        
        ArrayList al = sd.getAllServices();
        for (int i = 0; i < al.size(); i++) {
            ServicesBean service = (ServicesBean) al.get(i);
            
            if (service.getTitle().equalsIgnoreCase(title)) {
                return true;
            }
        }
        return false;
    }
    
    public boolean isExistId(ServicesBean sb){
        int id = sb.getId();
        
        ArrayList al = sd.getAllServices();
        for (int i = 0; i < al.size(); i++) {
            ServicesBean service = (ServicesBean) al.get(i);
            
            if (service.getId() == id) {
                return true;
            }
        }
        return false;
    }
    
    public boolean isExistId(int id){
        
        ArrayList al = sd.getAllServices();
        for (int i = 0; i < al.size(); i++) {
            ServicesBean service = (ServicesBean) al.get(i);
            
            if (service.getId() == id) {
                return true;
            }
        }
        return false;
    }
    
    //Register new services
    public boolean registerNewServices(ServicesBean sb){
        try{
            
            String sql = "INSERT INTO `services` (`title`, `description`, `price`) VALUES (?, ?, ?)";
            
            // register customer using this address id
            ps = this.conn.prepareStatement(sql);

            ps.setString(1, sb.getTitle());
            ps.setString(2, sb.getDescription());
            ps.setDouble(3, sb.getPrice());

            ps.executeUpdate();
            
            return true;
            
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return false;
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
