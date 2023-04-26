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

    public User searchUser(Connection conn,User user) throws Exception {
        User resultUser = null;

        String sql="select * from user where username=?";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());

        ResultSet rs = pstatement.executeQuery();
        if(rs.next()){
            resultUser = new User();
            resultUser.setUsersname(rs.getString("username"));
        }

        return resultUser;
    }


    public boolean register(Connection conn,User user) throws Exception {
        boolean flag = false;

        String sql="insert into user(username,password)values(?,?)";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, user.getUsername());
        pstatement.setString(2, user.getPassword());

        int res = pstatement.executeUpdate();
        if(res > 0) {
            flag = true;
        }
        return flag;
    }

    public boolean addUser(Connection conn,Adduser adduser) throws Exception {
        boolean flag = false;

        String sql="insert into user(username,password,address,telephone,admin_name,`operation`)values(?,?,?,?,?,?)";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, adduser.getUsername());
        pstatement.setString(2, adduser.getPassword());
        pstatement.setString(3, adduser.getAddress());
        pstatement.setString(4, adduser.getTelephone());
        pstatement.setString(5, adduser.getAdmin_name());
        pstatement.setString(6, adduser.getOperation());

        int res = pstatement.executeUpdate();
        if(res > 0) {
            flag = true;
        }
        return flag;
    }
    public boolean deleteUser(Connection conn, Deleteuser deleteuser) throws Exception {
        boolean flag = false;

        String sql = "DELETE FROM user WHERE username = ? AND password = ? AND address = ? AND telephone = ? AND admin_name = ? AND operation = ?";

        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setString(1, deleteuser.getUsername());
        pstatement.setString(2, deleteuser.getPassword());
        pstatement.setString(3, deleteuser.getAddress());
        pstatement.setString(4, deleteuser.getTelephone());
        pstatement.setString(5, deleteuser.getAdmin_name());
        pstatement.setString(6, deleteuser.getOperation());

        int res = pstatement.executeUpdate();
        if (res > 0) {
            flag = true;
        }
        return flag;
    }
    public boolean changeUser(Connection conn, Changeuser changeuser) throws Exception {
        boolean flag = false;
        String sql = "UPDATE user SET password=?, address=?, telephone=?, admin_name=?, operation=? WHERE username=?";
        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setString(1, changeuser.getPassword());
        pstatement.setString(2, changeuser.getAddress());
        pstatement.setString(3, changeuser.getTelephone());
        pstatement.setString(4, changeuser.getAdmin_name());
        pstatement.setString(5, changeuser.getOperation());
        pstatement.setString(6, changeuser.getUsername());
        int res = pstatement.executeUpdate();
        if (res > 0) {
            flag = true;
        }
        return flag;
    }

    public boolean changePrice(Connection conn, Changeprice changeprice) throws Exception {
        boolean flag = false;
        String sql = "UPDATE price SET type=?, unit_price=?, last_months_price=?, fluctuation=? WHERE ID=?";
        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setString(1, changeprice.getType());
        pstatement.setString(2, changeprice.getUnit_price());
        pstatement.setString(3, changeprice.getLast_months_price());
        pstatement.setString(4, changeprice.getFluctuation());
        pstatement.setInt(5, changeprice.getID());
        int res = pstatement.executeUpdate();
        if (res > 0) {
            flag = true;
        }
        return flag;
    }
    public boolean addAdmin(Connection conn,Addadmin addadmin) throws Exception {
        boolean flag = false;

        String sql="insert into administrator(username,password,address,telephone)values(?,?,?,?)";

        PreparedStatement pstatement =conn.prepareStatement(sql);
        pstatement.setString(1, addadmin.getUsername());
        pstatement.setString(2, addadmin.getPassword());
        pstatement.setString(3, addadmin.getAddress());
        pstatement.setString(4, addadmin.getTelephone());

        int res = pstatement.executeUpdate();
        if(res > 0) {
            flag = true;
        }
        return flag;
    }
    public boolean addWater(Connection conn, Water water) throws Exception {
        String sql = "INSERT INTO water (ID, username, telephone, add_Time, consumption, amount_Price, unit_Price, stage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setLong(1, water.getID());
        pstatement.setString(2, water.getUsername());
        pstatement.setString(3, water.getTelephone());
        pstatement.setDate(4, water.getAdd_Time());
        pstatement.setLong(5, water.getConsumption());
        pstatement.setLong(6, water.getAmount_Price());
        pstatement.setLong(7, water.getUnit_Price());
        pstatement.setString(8, water.getStage());
        int res = pstatement.executeUpdate();
        return res > 0;
    }



    public boolean deleteWater(Connection conn, Water water) throws Exception {
        boolean flag = false;


        StringBuilder sqlBuilder = new StringBuilder("DELETE FROM water WHERE ID=? AND username=? AND telephone=? AND add_Time=? AND consumption=? AND amount_Price=? AND unit_Price=?");


        if (water.getStage() == null) {
            sqlBuilder.append(" AND stage IS NULL");
        } else {
            sqlBuilder.append(" AND stage=?");
        }


        PreparedStatement pstatement = conn.prepareStatement(sqlBuilder.toString());
        pstatement.setLong(1, water.getID());
        pstatement.setString(2, water.getUsername());
        pstatement.setString(3, water.getTelephone());
        pstatement.setDate(4, water.getAdd_Time());
        pstatement.setLong(5, water.getConsumption());
        pstatement.setLong(6, water.getAmount_Price());
        pstatement.setLong(7, water.getUnit_Price());

        if (water.getStage() != null) {
            pstatement.setString(8, water.getStage());
        }


        int res = pstatement.executeUpdate();
        if (res > 0) {
            flag = true;
        }
        return flag;
    }

    public boolean ChangeWater(Connection conn, Water water) throws Exception {
        String sql = "UPDATE water SET username=?, telephone =?, add_time =?, consumption =?, amount_price=?,unit_price=?, stage=? WHERE ID=?";
        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setLong(1, water.getID());
        pstatement.setString(2, water.getUsername());
        pstatement.setString(3, water.getTelephone());
        pstatement.setDate(4, water.getAdd_Time());
        pstatement.setLong(5, water.getConsumption());
        pstatement.setLong(6, water.getAmount_Price());
        pstatement.setLong(7, water.getUnit_Price());
        pstatement.setString(8, water.getStage());
        int res = pstatement.executeUpdate();
        return res > 0;
    }
    public boolean addElectricity(Connection conn, Electricity electricity) throws Exception {
        String sql = "INSERT INTO electricity (ID, username, telephone, add_Time, consumption, amount_Price, unit_Price, stage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setLong(1, electricity.getID());
        pstatement.setString(2, electricity.getUsername());
        pstatement.setString(3, electricity.getTelephone());
        pstatement.setDate(4, electricity.getAdd_Time());
        pstatement.setLong(5, electricity.getConsumption());
        pstatement.setLong(6, electricity.getAmount_Price());
        pstatement.setLong(7, electricity.getUnit_Price());
        pstatement.setString(8, electricity.getStage());
        int res = pstatement.executeUpdate();
        return res > 0;
    }
    public boolean deleteElectricity(Connection conn, Electricity electricity) throws Exception {
        boolean flag = false;


        StringBuilder sqlBuilder = new StringBuilder("DELETE FROM electricity WHERE ID=? AND username=? AND telephone=? AND add_Time=? AND consumption=? AND amount_Price=? AND unit_Price=?");


        if (electricity.getStage() == null) {
            sqlBuilder.append(" AND stage IS NULL");
        } else {
            sqlBuilder.append(" AND stage=?");
        }


        PreparedStatement pstatement = conn.prepareStatement(sqlBuilder.toString());
        pstatement.setLong(1, electricity.getID());
        pstatement.setString(2, electricity.getUsername());
        pstatement.setString(3, electricity.getTelephone());
        pstatement.setDate(4, electricity.getAdd_Time());
        pstatement.setLong(5, electricity.getConsumption());
        pstatement.setLong(6, electricity.getAmount_Price());
        pstatement.setLong(7, electricity.getUnit_Price());

        if (electricity.getStage() != null) {
            pstatement.setString(8, electricity.getStage());
        }


        int res = pstatement.executeUpdate();
        if (res > 0) {
            flag = true;
        }
        return flag;
    }
    public boolean ChangeElectricity(Connection conn, Electricity electricity) throws Exception {
        String sql = "UPDATE electricity SET username=?, telephone =?, add_time =?, consumption =?, amount_price=?,unit_price=?, stage=? WHERE ID=?";
        PreparedStatement pstatement = conn.prepareStatement(sql);
        pstatement.setLong(1, electricity.getID());
        pstatement.setString(2, electricity.getUsername());
        pstatement.setString(3, electricity.getTelephone());
        pstatement.setDate(4, electricity.getAdd_Time());
        pstatement.setLong(5, electricity.getConsumption());
        pstatement.setLong(6, electricity.getAmount_Price());
        pstatement.setLong(7, electricity.getUnit_Price());
        pstatement.setString(8, electricity.getStage());
        int res = pstatement.executeUpdate();
        return res > 0;
    }
}
