package bean;


public class DeviceBean {
    int device_id;
    String type, name, brand, model;

    public DeviceBean() {
    }

    public DeviceBean(int device_id, String type, String name, String brand, String model) {
        this.device_id = device_id;
        this.type = type;
        this.name = name;
        this.brand = brand;
        this.model = model;
    }
    public DeviceBean(String type, String name, String brand, String model) {
        this.type = type;
        this.name = name;
        this.brand = brand;
        this.model = model;
    }

    public int getDevice_id() {
        return device_id;
    }

    public void setDevice_id(int device_id) {
        this.device_id = device_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public void setModel(String model) {
        this.model = model;
    }

    @Override
    public String toString() {
        return "DeviceBean{" + "device_id=" + device_id + ", type=" + type + ", name=" + name + ", brand=" + brand + ", model=" + model + '}';
    }
    
}
