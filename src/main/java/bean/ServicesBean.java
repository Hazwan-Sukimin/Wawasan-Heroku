package bean;

public class ServicesBean {
    private int id;
    private String title;
    private String description;
    private double price;

    public ServicesBean() {
    }

    public ServicesBean(int id, String title, String description, double price) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.price = price;
    }
    public ServicesBean(String title, String description, String price) {
        this.title = title;
        this.description = description;
        this.price = Double.parseDouble(price);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ServicesBean{" + "id=" + id + ", title=" + title + ", description=" + description + ", price=" + price + '}';
    }
    

    
}
