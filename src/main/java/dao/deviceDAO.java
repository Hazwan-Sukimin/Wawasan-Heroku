package dao;

import bean.DeviceBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class deviceDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    ResultSet rs = null;
    static deviceDAO dd = new deviceDAO(DB.createConnection());
    
    public deviceDAO(Connection conn) {
        this.conn = conn;
    }
    
    // get all device
    public ArrayList getAllDevice(){
        DeviceBean db = new DeviceBean();
        ArrayList al = new ArrayList();
        
        try {
            String sql = "SELECT * FROM device";
            
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                db.setDevice_id(rs.getInt("device_id"));
                db.setType(rs.getString("type"));
                db.setName(rs.getString("name"));
                db.setBrand(rs.getString("brand"));
                db.setModel(rs.getString("model"));
                
                al.add(db);
                db = new DeviceBean();
            }

            return al;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
    }
    
    //Check Duplicate
    public boolean isExist(DeviceBean db){
        String name = db.getName();
        String brand = db.getBrand();
        String model = db.getModel();
        
        ArrayList al = dd.getAllDevice();
        for (int i = 0; i < al.size(); i++) {
            DeviceBean device = (DeviceBean) al.get(i);
            
            if (device.getName().equalsIgnoreCase(name) && device.getBrand().equalsIgnoreCase(brand) && device.getModel().equalsIgnoreCase(model)) {
                return true;
            }
        }
        return false;
    }
    
    public boolean isExistId(DeviceBean db){
        int id = db.getDevice_id();
        
        ArrayList al = dd.getAllDevice();
        for (int i = 0; i < al.size(); i++) {
            DeviceBean device = (DeviceBean) al.get(i);
            
            if (device.getDevice_id() == id) {
                return true;
            }
        }
        return false;
    }
    
    public boolean isExistId(int id){
        
        ArrayList al = dd.getAllDevice();
        for (int i = 0; i < al.size(); i++) {
            DeviceBean device = (DeviceBean) al.get(i);
            
            if (device.getDevice_id() == id) {
                return true;
            }
        }
        return false;
    }
    
//    public static void main(String[] args) {
//        
//        DeviceBean db = new DeviceBean();
//        db.setDevice_id(1);
//        System.out.println(dd.isExistId(db));
//    }
    
    // Register New Device
    public boolean registerNewDevice(DeviceBean d){
        try{
            String sql = "INSERT INTO `device` (`type`, `name`, `model`, `brand`) VALUES (?, ?, ?, ?)"; 
            ps = this.conn.prepareStatement(sql);
            
            ps.setString(1, d.getType());
            ps.setString(2, d.getName());
            ps.setString(3, d.getModel());
            ps.setString(4, d.getBrand());
            
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
}
