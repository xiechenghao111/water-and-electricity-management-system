package modle;


public class Electricity {

  private long ID;
  private String username;
  private String telephone;
  private java.sql.Date add_Time;
  private long consumption;
  private long amount_Price;
  private long unit_Price;
  private String stage;


  public long getID() {
    return ID;
  }

  public void setID(long ID) {
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
    return add_Time;
  }

  public void setAdd_Time(java.sql.Date add_Time) {
    this.add_Time = add_Time;
  }


  public long getConsumption() {
    return consumption;
  }

  public void setConsumption(long consumption) {
    this.consumption = consumption;
  }


  public long getAmount_Price() {
    return amount_Price;
  }

  public void setAmount_Price(long amount_Price) {
    this.amount_Price = amount_Price;
  }


  public long getUnit_Price() {
    return unit_Price;
  }

  public void setUnit_Price(long unit_Price) {
    this.unit_Price = unit_Price;
  }


  public String getStage() {
    return stage;
  }

  public void setStage(String stage) {
    this.stage = stage;
  }

}
