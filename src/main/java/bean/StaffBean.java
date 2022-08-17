package bean;

import dao.StaffDAO;

public class StaffBean {
    private int staff_id, address_id;
    String fullname, email, phone, position, password, status;

    public StaffBean() {}

    public StaffBean(int staff_id, int address_id, String fullname, String email, String phone, String position, String password, String status) {
        this.staff_id = staff_id;
        this.address_id = address_id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.position = position;
        this.password = password;
        this.status = status;
    }

    public StaffBean(String fullname, String phone, String email) {
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
    }
    
    

    public int getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(int staff_id) {
        this.staff_id = staff_id;
    }
    public void setStaff_id(String staff_id) {
        this.staff_id = Integer.parseInt(staff_id);
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "StaffBean{" + "staff_id=" + staff_id + ", address_id=" + address_id + ", fullname=" + fullname + ", email=" + email + ", phone=" + phone + ", position=" + position + ", password=" + password + ", status=" + status + '}';
    }
    
    

    
}
