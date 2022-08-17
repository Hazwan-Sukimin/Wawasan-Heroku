package bean;

public class Customer {
    private int customer_id;
    private String fullname;
    private String phone;
    private String email;
    private String password;
    private int address_id;

    public Customer() {}

    public Customer(int customer_id, String fullname, String phone, String email, String password, int address_id) {
        this.customer_id = customer_id;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.address_id = address_id;
    }
    
    public Customer(String fullname, String phone, String email, String password) {
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }
    public void setCustomer_id(String customer_id) {
        this.customer_id = Integer.parseInt(customer_id);
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    @Override
    public String toString() {
        return "Customer{" + "customer_id=" + customer_id + ", fullname=" + fullname + ", phone=" + phone + ", email=" + email + ", password=" + password + ", address_id=" + address_id + '}';
    }
    
}


