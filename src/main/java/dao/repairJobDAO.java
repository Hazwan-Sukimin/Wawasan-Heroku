package dao;

import bean.PartsBean;
import bean.RepairJobBean;
import static dao.deviceDAO.dd;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class repairJobDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    static repairJobDAO rjd = new repairJobDAO(DB.createConnection());
    static ServicesDao sd = new ServicesDao(DB.createConnection());
    static PartsDao pd = new PartsDao(DB.createConnection());
    static WarrantyDao wd = new WarrantyDao(DB.createConnection());
    static PartsUsedDao upd = new PartsUsedDao(DB.createConnection());
    static customerDAO cd = new customerDAO(DB.createConnection());
    
    public repairJobDAO(Connection conn){
        this.conn = conn;
    }
    
    // get All repair Job
    public ArrayList getAllRepairJob(){
        RepairJobBean rjb = new RepairJobBean();
        ArrayList al = new ArrayList();
        
        try{
            String sql = "SELECT * FROM repair_job";
            
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                rjb.setRepair_job_id(rs.getInt("repair_job_id"));
                rjb.setInvoice_id(rs.getInt("invoice_id"));
                rjb.setService_id(rs.getInt("service_id"));
                rjb.setStaff_id(rs.getInt("staff_id"));
                rjb.setDevice_id(rs.getInt("device_id"));
                rjb.setUsed_part_id(rs.getInt("used_part_id"));
                rjb.setCustomer_id(rs.getInt("customer_id"));
                rjb.setInformation(rs.getString("information"));
                rjb.setDescription(rs.getString("description"));
                rjb.setTotal_price(rs.getDouble("total_price"));
            }
            return al;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return null;
    }
    
    public RepairJobBean fetchId(String id){
        RepairJobBean rjb = new RepairJobBean();
        
        try{
            String sql = "SELECT * FROM repair_job WHERE repair_job_id = ?";
            ps = this.conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                rjb.setRepair_job_id(rs.getInt("repair_job_id"));
                rjb.setInvoice_id(rs.getInt("invoice_id"));
                rjb.setService_id(rs.getInt("service_id"));
                rjb.setStaff_id(rs.getInt("staff_id"));
                rjb.setDevice_id(rs.getInt("device_id"));
                rjb.setUsed_part_id(rs.getInt("used_part_id"));
                rjb.setCustomer_id(rs.getInt("customer_id"));
                rjb.setInformation(rs.getString("information"));
                rjb.setDescription(rs.getString("description"));
                rjb.setTotal_price(rs.getDouble("total_price"));
                rjb.setStatus(rs.getString("status"));
            }
            return rjb;
            
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    // Create New Repair Job
    public boolean registerNewRepairJobnUP(RepairJobBean rjb){
        // check customer existed or not
        
        if (!cd.isExistPhone(rjb.getPhone()) && !sd.isExistId(rjb.getService_id()) && !dd.isExistId(rjb.getDevice_id())) {
            return false;
        }
        
        double price = sd.getPrice(rjb.getService_id());  
        try{
            
            String sql = "INSERT INTO `repair_job` (`service_id`, `device_id`, `customer_id`, `description`, `information`, `total_price`) VALUES (?, ?, ?, ?, ?, ?)";
            String sql1 = "INSERT INTO `repair_history` (`repair_job_id`) VALUES (?)";
            // register customer using this address id
            ps = this.conn.prepareStatement(sql);

            ps.setInt(1, rjb.getService_id());
            ps.setInt(2, rjb.getDevice_id());
            ps.setInt(3, rjb.getCustomer_id());
            ps.setString(4, rjb.getDescription());
            ps.setString(5, rjb.getInformation());
            ps.setDouble(6, price);

            ps.executeUpdate();
            
            
            int repairJobId = rjd.highestId();
            // add repair history
            ps = this.conn.prepareStatement(sql1);
            ps.setInt(1, repairJobId);
            ps.executeUpdate();
            return true;
            
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return false;
    }
    
    public int highestId(){
        RepairJobBean w = new RepairJobBean();
        
        try{
            String sql = "SELECT * FROM repair_job ORDER BY repair_job_id DESC LIMIT 1";
            ps = this.conn.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                w.setRepair_job_id(rs.getInt("repair_job_id"));
                
            }
            
            return w.getRepair_job_id();
        }catch(Exception e){
            e.printStackTrace();
        }
        return 0;
    }
    
    
    public boolean registerNewRepairJobwUP(RepairJobBean rjb, String part_id, String quantity){
        if (!cd.isExistPhone(rjb.getPhone()) && !sd.isExistId(rjb.getService_id()) && !dd.isExistId(rjb.getDevice_id())) {
            return false;
        }
        
        try{
            String sql1 = "INSERT INTO `warranty` (`end_date`) VALUES (?)";
            String sql2 = "INSERT INTO `parts_used` (`part_id`, `quantity`, `warranty_id`, `total_price`) VALUES (?, ?, ?, ?)";
            String sql = "INSERT INTO `repair_job` (`service_id`, `device_id`, `customer_id`,`used_part_id`, `description`, `information`, `total_price`) VALUES (?,?, ?, ?, ?, ?, ?)";
            
            
            int qty = Integer.parseInt(quantity);
            
            PartsBean pb = pd.fetchId(part_id);
            if (Integer.parseInt(quantity) > pb.getQuantity()) {
                return false;
            }
            
            //create warranty - 1
            ps = this.conn.prepareStatement(sql1);
            ps.setString(1, pd.warrantyPeriod(pb));
            ps.executeUpdate();
            
            // execute warranty database and get highest id
            
            int warranty_id = wd.highestId();
            
            
            //create parts_used - 2
            ps = this.conn.prepareStatement(sql2);
            ps.setString(1, part_id);
            ps.setString(2, quantity);
            ps.setInt(3, warranty_id);
            ps.setDouble(4, pb.getTotalPrice(qty));
            ps.executeUpdate();
            
            // execute warranty database and get highest id
            
            String hupid = upd.highestId()+"";
            
            // Update Stock
            String sql3 = "UPDATE `parts` SET `quantity`= ? WHERE `part_id` = ? ";
            ps = this.conn.prepareStatement(sql3);
            ps.setInt(1, pb.UpdateStock(qty));
            ps.setString(2, part_id);
            ps.executeUpdate();
            
            // get services price
            double total_price = sd.getPrice(rjb.getService_id()) + pb.getTotalPrice(qty);
            
            // register customer using this address id - 3
            ps = this.conn.prepareStatement(sql);

            ps.setInt(1, rjb.getService_id());
            ps.setInt(2, rjb.getDevice_id());
            ps.setInt(3, rjb.getCustomer_id());
            ps.setInt(4, Integer.parseInt(hupid));
            ps.setString(5, rjb.getDescription());
            ps.setString(6, rjb.getInformation());
            ps.setDouble(7, total_price);

            ps.executeUpdate();
            
            String sql4 = "INSERT INTO `repair_history` (`repair_job_id`) VALUES (?)";
            int repairJobId = rjd.highestId();
            // add repair history
            ps = this.conn.prepareStatement(sql4);
            ps.setInt(1, repairJobId);
            ps.executeUpdate();
            
            return true;
            
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
        }
        return false;
    }
    
    public int getCustID(String phone){
        int cust_id = 0;
        
        try{
            Connection conn = DB.createConnection();
            
            PreparedStatement ps = conn.prepareStatement("SELECT cust_id FROM customer WHERE cust_phone = ?");
            ps.setString(1,phone);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                cust_id = rs.getInt("cust_id");
            }
            
        }
        catch(Exception e){
            System.out.print(e);
        } finally{
            close(ps,rs);
        }
        
        return cust_id;
    }

    public boolean updateStatus(String id){
        try{
            conn = DB.createConnection();
            ps = conn.prepareStatement("UPDATE repair_job SET status='FINISHED' WHERE repair_job_id=?");
            ps.setString(1, id);
            ps.executeUpdate();
            return true;
        }
        catch(Exception e){
            System.out.print(e);
        }
        
        return false;
    }
    
    public boolean updatePayment(String[] id){
        try{
            conn = DB.createConnection();
            
            ps = conn.prepareStatement("UPDATE repair_job SET status='PAID' WHERE repair_job_id=?");
            
            for (int i = 0; i < id.length; i++) {
                ps.setString(1, id[i]);
                ps.addBatch();
            }
            int[] affectedRecords = ps.executeBatch();
            return true;
        }
        catch(Exception e){
            System.out.print(e);
        }
        
        return false;
    }
    
    public boolean checkStatusPayment(String[] id){
        ArrayList al = rjd.getAllRepairJob();
        
        for (int i = 0; i < id.length; i++) {
            RepairJobBean rjb = rjd.fetchId(id[i]);
            if (rjb.getStatus().equals("FINISHED")) {
                return true;
            }
        }
        
        return false;
    }
    
    
    public boolean assignTechnician(List list){
        // 
        try{
            String sql = "UPDATE `repair_job` SET `staff_id`=?, `status`='ASSIGNED' WHERE  `repair_job_id`=?";
            ps = this.conn.prepareStatement(sql);
            
            for (int i = 0; i < list.size(); i++) {
                String id = (String) list.get(i);
                String id_split[] = id.split(",");
                
                ps.setString(1, id_split[0]);
                ps.setString(2, id_split[1]);
                ps.addBatch();

            }
            int[] affectedRecords = ps.executeBatch();
            return true;
        }catch(Exception e){
            e.printStackTrace();
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
