package bean;

public class Address {
    private int address_id;
    private String line1;
    private String line2;
    private int postcode;
    private String city;
    private String state;
    private String country;

    public Address() {
    }

    public Address(int address_id, String line1, String line2, int postcode, String city, String state, String country) {
        this.address_id = address_id;
        this.line1 = line1;
        this.line2 = line2;
        this.postcode = postcode;
        this.city = city;
        this.state = state;
        this.country = country;
    }
    
    public Address(String line1, String line2, int postcode, String city, String state, String country) {
        this.line1 = line1;
        this.line2 = line2;
        this.postcode = postcode;
        this.city = city;
        this.state = state;
        this.country = country;
    }
    public Address(String line1, String line2, String postcode, String city, String state) {
        this.line1 = line1;
        this.line2 = line2;
        this.city = city;
        this.postcode = Integer.parseInt(postcode);
        this.state = state;
        this.country = "Malaysia";
    }
    public Address(String line1, String line2, String postcode, String city, String state, String country) {
        this.line1 = line1;
        this.line2 = line2;
        this.postcode = Integer.parseInt(postcode);
        this.city = city;
        this.state = state;
        this.country = country;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public String getLine1() {
        return line1;
    }

    public void setLine1(String line1) {
        this.line1 = line1;
    }

    public String getLine2() {
        return line2;
    }

    public void setLine2(String line2) {
        this.line2 = line2;
    }

    public int getPostcode() {
        return postcode;
    }

    public void setPostcode(int postcode) {
        this.postcode = postcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return "Address{" + "address_id=" + address_id + ", line1=" + line1 + ", line2=" + line2 + ", postcode=" + postcode + ", city=" + city + ", state=" + state + ", country=" + country + '}';
    }
    
}
