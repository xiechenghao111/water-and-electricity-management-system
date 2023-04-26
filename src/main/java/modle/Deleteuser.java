package modle;

public class Deleteuser {
    private String username;
    private String password;
    private String address;
    private String telephone;

    private  String admin_name;

    private    String operation;


    public Deleteuser() {}

    public Deleteuser(String username, String password,String address, String telephone, String admin_name, String operation) {
        this.username = username;
        this.password = password;
        this.address = address;
        this.telephone = telephone;
        this.admin_name = admin_name;
        this.operation = operation;

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

    // 设置密码
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    public String getAdmin_name() {
        return admin_name;
    }


    public void setAdmin_name(String adminName) {
        this.admin_name = adminName;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

}
