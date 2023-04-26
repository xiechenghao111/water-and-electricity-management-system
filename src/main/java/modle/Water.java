package modle;


public class Water {

  private long ID;
  private String username;
  private String telephone;
  private java.sql.Date add_time;
  private long consumption;
  private long amount_price;
  private long unit_price;
  private String stage;


  public long getID() {
    return ID;
  }

  public void setID(long id) {
    this.ID = ID;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getTelephone() {
    return telephone;
  }

  public void setTelephone(String telephone) {
    this.telephone = telephone;
  }


  public java.sql.Date getAdd_Time() {
    return add_time;
  }

  public void setAdd_Time(java.sql.Date add_time) {
    this.add_time = add_time;
  }


  public long getConsumption() {
    return consumption;
  }

  public void setConsumption(long consumption) {
    this.consumption = consumption;
  }


  public long getAmount_Price() {
    return amount_price;
  }

  public void setAmount_Price(long amount_price) {
    this.amount_price = amount_price;
  }


  public long getUnit_Price() {
    return unit_price;
  }

  public void setUnit_Price(long unit_price) {
    this.unit_price = unit_price;
  }


  public String getStage() {
    return stage;
  }

  public void setStage(String stage) {
    this.stage = stage;
  }

}
