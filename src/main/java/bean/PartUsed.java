package bean;

public class PartUsed {
    private int used_part_id, part_id, quantity, warranty_id, total_price;

    public PartUsed() {
    }

    public PartUsed(int used_part_id, int part_id, int quantity, int warranty_id, int total_price) {
        this.used_part_id = used_part_id;
        this.part_id = part_id;
        this.quantity = quantity;
        this.warranty_id = warranty_id;
        this.total_price = total_price;
    }
    
    public PartUsed(int part_id, int quantity, int warranty_id) {
        this.part_id = part_id;
        this.quantity = quantity;
        this.warranty_id = warranty_id;
    }

    public int getUsed_part_id() {
        return used_part_id;
    }

    public void setUsed_part_id(int used_part_id) {
        this.used_part_id = used_part_id;
    }
    public void setUsed_part_id(String used_part_id) {
        this.used_part_id = Integer.parseInt(used_part_id);
    }

    public int getPart_id() {
        return part_id;
    }

    public void setPart_id(int part_id) {
        this.part_id = part_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getWarranty_id() {
        return warranty_id;
    }

    public void setWarranty_id(int warranty_id) {
        this.warranty_id = warranty_id;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }
    
    

    
    
}
