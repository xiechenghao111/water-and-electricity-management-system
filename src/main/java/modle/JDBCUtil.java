package modle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class JDBCUtil {

    private String dbUrl="jdbc:mysql://127.0.0.1:3306/demo?user=chenghao";
    private String dbUsername="chenghao";
    private String dbPassword="chenghao";


    public Connection getConn() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
        Connection conn = null;

        try {

            conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }


    public void close(ResultSet resultSet) throws Exception {
        if(resultSet != null) {
            resultSet.close();
        }
    }


    public void close(Statement statement) throws Exception {
        if(statement != null) {
            statement.close();
        }
    }


    public void close(Connection conn) throws Exception {
        if(conn != null) {
            conn.close();
        }
    }


}