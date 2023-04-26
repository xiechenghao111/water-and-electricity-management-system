package JDBC;
import java.sql.*;
public class DBUtils {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver"); // mysql8
        String url = "jdbc:mysql://127.0.0.1:3306/demo?user=chenghao";
        String username = "chenghao";
        String password = "chenghao";
        Connection conn = DriverManager.getConnection(url, username, password);
        return conn;
}
    public static void release(PreparedStatement stmt, Connection conn) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            stmt = null;
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn = null;
        }
    }

    public static void release(ResultSet rs, PreparedStatement stmt, Connection conn){
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            rs = null;
        }
        release(stmt, conn);
    }

}
