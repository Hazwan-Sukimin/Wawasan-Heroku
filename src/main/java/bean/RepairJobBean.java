package bean;
import java.sql.Date;


public class RepairJobBean {
    private int repair_job_id, invoice_id, service_id, staff_id, device_id, used_part_id, customer_id;
    String information, description, status, phone;
    double total_price;
    

    public RepairJobBean() {
    }

    public RepairJobBean(int repair_job_id, int invoice_id, int service_id, int staff_id, int device_id, int used_part_id, int customer_id, String information, String description, double total_price, String status) {
        this.repair_job_id = repair_job_id;
        this.invoice_id = invoice_id;
        this.service_id = service_id;
        this.staff_id = staff_id;
        this.device_id = device_id;
        this.used_part_id = used_part_id;
        this.customer_id = customer_id;
        this.information = information;
        this.description = description;
        this.total_price = total_price;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public RepairJobBean(int repair_job_id, int invoice_id, int service_id, int staff_id, int device_id, int used_part_id, int customer_id, String information, String description, double total_price) {
        this.repair_job_id = repair_job_id;
        this.invoice_id = invoice_id;
        this.service_id = service_id;
        this.staff_id = staff_id;
        this.device_id = device_id;
        this.used_part_id = used_part_id;
        this.customer_id = customer_id;
        this.information = information;
        this.description = description;
        this.total_price = total_price;
    }
    
    public RepairJobBean(String service_id, String device_id, String used_part_id, String phone, String information, String description) {
        this.service_id = Integer.parseInt(service_id);
        this.device_id = Integer.parseInt(device_id);
        this.used_part_id = Integer.parseInt(used_part_id);
        this.phone = phone;
        this.information = information;
        this.description = description;
    }
    public RepairJobBean(String service_id, String device_id, String phone, String information, String description) {
        this.service_id = Integer.parseInt(service_id);
        this.device_id = Integer.parseInt(device_id);
        this.phone = phone;
        this.information = information;
        this.description = description;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    

    public int getRepair_job_id() {
        return repair_job_id;
    }

    public void setRepair_job_id(int repair_job_id) {
        this.repair_job_id = repair_job_id;
    }

    public int getInvoice_id() {
        return invoice_id;
    }

    public void setInvoice_id(int invoice_id) {
        this.invoice_id = invoice_id;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }

    public int getDevice_id() {
        return device_id;
    }

    public void setDevice_id(int device_id) {
        this.device_id = device_id;
    }

    public int getUsed_part_id() {
        return used_part_id;
    }

    public void setUsed_part_id(int used_part_id) {
        this.used_part_id = used_part_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    @Override
    public String toString() {
        return "RepairJobBean{" + "repair_job_id=" + repair_job_id + ", invoice_id=" + invoice_id + ", service_id=" + service_id + ", staff_id=" + staff_id + ", device_id=" + device_id + ", used_part_id=" + used_part_id + ", customer_id=" + customer_id + ", information=" + information + ", description=" + description + ", total_price=" + total_price + '}';
    }
    
    
}
