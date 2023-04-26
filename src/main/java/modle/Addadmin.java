package modle;

public class Addadmin {
    private String username;
    private String password;
    private String address;
    private String telephone;

    // 构造函数
    public Addadmin() {}

    public Addadmin(String username, String password,String address, String telephone) {
        this.username = username;
        this.password = password;
        this.address = address;
        this.telephone = telephone;

    }


    public String getUsername() {
        return username;
    }


    public void setUsersname(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }


    public void setAddress(String address) {
        this.address = address;
    }


    public String getTelephone() {
        return telephone;
    }


    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
