package modle;

public class User {
    private String username;
    private String password;



    public User() {}

    public User(String username, String password) {
        this.username = username;
        this.password = password;

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




}