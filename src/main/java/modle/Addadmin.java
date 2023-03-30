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

    // 获取用户名
    public String getUsername() {
        return username;
    }

    // 设置用户名
    public void setUsersname(String username) {
        this.username = username;
    }

    // 获取密码
    public String getPassword() {
        return password;
    }

    // 设置密码
    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    // 设置用户名
    public void setAddress(String address) {
        this.address = address;
    }

    // 获取密码
    public String getTelephone() {
        return telephone;
    }

    // 设置密码
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
