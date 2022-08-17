package bean;

import java.util.Date;

public class Warranty {
    int warranty_id;
    String start_date, end_date;

    public Warranty() {
    }

    public Warranty(int warranty_id, String start_date, String end_date) {
        this.warranty_id = warranty_id;
        this.start_date = start_date;
        this.end_date = end_date;
    }
    public Warranty(String start_date, String end_date) {
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public int getWarranty_id() {
        return warranty_id;
    }

    public void setWarranty_id(int warranty_id) {
        this.warranty_id = warranty_id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    @Override
    public String toString() {
        return "Warranty{" + "warranty_id=" + warranty_id + ", start_date=" + start_date + ", end_date=" + end_date + '}';
    }
    
    

    

    
}
