package bean;

public class PartsBean {
    private int id;
    private String device_support;
    private String name;
    private String part_set;
    private String brand;
    private String model;
    private double buy_cost;
    private double sell_cost;
    private int quantity;
    private int warranty_period;

    public PartsBean() {
    }

    public PartsBean(int id, String device_support, String name, String part_set, String brand, String model, double buy_cost, double sell_cost, int quantity, int warranty_period) {
        this.id = id;
        this.device_support = device_support;
        this.name = name;
        this.part_set = part_set;
        this.brand = brand;
        this.model = model;
        this.buy_cost = buy_cost;
        this.sell_cost = sell_cost;
        this.quantity = quantity;
        this.warranty_period = warranty_period;
    }
    
    public PartsBean(String device_support, String name, String part_set, String brand, String model, String buy_cost, String sell_cost, String quantity, String warranty_period) {
        this.device_support = device_support;
        this.name = name;
        this.part_set = part_set;
        this.brand = brand;
        this.model = model;
        this.buy_cost = Double.parseDouble(buy_cost);
        this.sell_cost = Double.parseDouble(sell_cost);
        this.quantity = Integer.parseInt(quantity);
        this.warranty_period = Integer.parseInt(warranty_period);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDevice_support() {
        return device_support;
    }

    public void setDevice_support(String device_support) {
        this.device_support = device_support;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPart_set() {
        return part_set;
    }

    public void setPart_set(String part_set) {
        this.part_set = part_set;
    }
    
    

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }
    
    public double getTotalPrice(int quantity) {
        double price = this.sell_cost*quantity;
        return price;
    }
    
    public int UpdateStock(int quantity) {
        int stock = this.quantity-quantity;
        return stock;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getBuy_cost() {
        return buy_cost;
    }

    public void setBuy_cost(double buy_cost) {
        this.buy_cost = buy_cost;
    }

    public double getSell_cost() {
        return sell_cost;
    }

    public void setSell_cost(double sell_cost) {
        this.sell_cost = sell_cost;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getWarranty_period() {
        return warranty_period;
    }

    public void setWarranty_period(int warranty_period) {
        this.warranty_period = warranty_period;
    }
    
    

    @Override
    public String toString() {
        return "PartsBean{" + "id=" + id + ", device_support=" + device_support + ", name=" + name + ", part_set=" + part_set + ", brand=" + brand + ", model=" + model + ", buy_cost=" + buy_cost + ", sell_cost=" + sell_cost + ", quantity=" + quantity + ", warranty_period=" + warranty_period + '}';
    }

    
}
