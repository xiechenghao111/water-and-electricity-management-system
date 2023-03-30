package modle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DAO {

    public User login(Connection conn,User user) throws Exception{
        User resultUser = null;

        String sql="select * from user where username=? and password=?";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());
        pstatement.setString(2, user.getPassword());

        ResultSet rs = pstatement.executeQuery();
        if(rs.next()){
            resultUser = new User();
            resultUser.setUsersname(rs.getString("username"));
            resultUser.setPassword(rs.getString("password"));
        }

        return resultUser;
    }
    public Administrator login(Connection conn,Administrator administrator) throws Exception{
        Administrator resultAdministrator = null;

        String sql="select * from administrator where username=? and password=?";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, administrator.getUsername());
        pstatement.setString(2, administrator.getPassword());

        ResultSet rs = pstatement.executeQuery();
        if(rs.next()){
            resultAdministrator = new Administrator();
            resultAdministrator.setUsername(rs.getString("username"));
            resultAdministrator.setPassword(rs.getString("password"));
        }

        return resultAdministrator;
    }
    // 修改密码查找用户
    public User searchUser(Connection conn,User user) throws Exception {
        User resultUser = null;
        // sql 查询语句
        String sql="select * from user where username=?";
        // 获得执行sql语句的对象
        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());
        // 执行sql语句获得结果集
        ResultSet rs = pstatement.executeQuery();
        if(rs.next()){
            resultUser = new User();
            resultUser.setUsersname(rs.getString("username"));
        }

        return resultUser;
    }

    // 注册验证
    public boolean register(Connection conn,User user) throws Exception {
        boolean flag = false;
        // sql 查询语句
        String sql="insert into user(username,password)values(?,?)";
        // 获得执行sql语句的对象
        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());
        pstatement.setString(2, user.getPassword());
        // 执行sql语句获得结果集
        int res = pstatement.executeUpdate();
        if(res > 0) {
            flag = true;
        }
        return flag;
    }

    public boolean addUser(Connection conn,Adduser adduser) throws Exception {
        boolean flag = false;
        // sql 查询语句
        String sql="insert into user(username,password,address,telephone)values(?,?,?,?)";
        // 获得执行sql语句的对象
        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, adduser.getUsername());
        pstatement.setString(2, adduser.getPassword());
        pstatement.setString(3, adduser.getAddress());
        pstatement.setString(4, adduser.getTelephone());
        // 执行sql语句获得结果集
        int res = pstatement.executeUpdate();
        if(res > 0) {
            flag = true;
        }
        return flag;
    }
    public boolean deleteUser(Connection conn, Deleteuser deleteuser) throws Exception {
        boolean flag = false;
        // SQL 查询语句
        String sql = "DELETE FROM user WHERE username = ? AND password = ? AND address = ? AND telephone = ?";
        // 获得执行 SQL 语句的对象
        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setString(1, deleteuser.getUsername());
        pstatement.setString(2, deleteuser.getPassword());
        pstatement.setString(3, deleteuser.getAddress());
        pstatement.setString(4, deleteuser.getTelephone());
        // 执行 SQL 语句获得结果集
        int res = pstatement.executeUpdate();
        if (res > 0) {
            flag = true;
        }
        return flag;
    }
    public boolean addAdmin(Connection conn,Addadmin addadmin) throws Exception {
        boolean flag = false;
        // sql 查询语句
        String sql="insert into administrator(username,password,address,telephone)values(?,?,?,?)";
        // 获得执行sql语句的对象
        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, addadmin.getUsername());
        pstatement.setString(2, addadmin.getPassword());
        pstatement.setString(3, addadmin.getAddress());
        pstatement.setString(4, addadmin.getTelephone());
        // 执行sql语句获得结果集
        int res = pstatement.executeUpdate();
        if(res > 0) {
            flag = true;
        }
        return flag;
    }
}