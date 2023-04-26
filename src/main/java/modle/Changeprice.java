package modle;

public class Changeprice {
    private Integer ID;
    private String type;
    private String unit_price;
    private String last_months_price;

    private String fluctuation;


    // 构造函数
    public Changeprice() {}

    public Changeprice( String type, String unit_price, String last_months_price, String fluctuation,Integer ID) {

        this.type = type;
        this.unit_price = unit_price;
        this.last_months_price = last_months_price;
        this.fluctuation = fluctuation;
        this.ID = ID;

    }


    public Integer getID() {
        return ID;
    }


    public void setID(Integer ID) {
        this.ID = ID;
    }


    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }

    public String getUnit_price() {
        return unit_price;
    }


    public void setUnit_price(String unit_price) {
        this.unit_price = unit_price;
    }


    public String getLast_months_price() {
        return last_months_price;
    }


    public void setLast_months_price(String last_months_price) {
        this.last_months_price = last_months_price;
    }
    public String getFluctuation() {
        return fluctuation;
    }


    public void setFluctuation(String fluctuation) {
        this.fluctuation = fluctuation;
    }


}
