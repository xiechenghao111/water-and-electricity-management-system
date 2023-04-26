package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import JAVABEAN.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserPaginationServlet", value = "/UserPaginationServlet")
public class UserPaginationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int currentPage = request.getParameter("currentPage") != null ? Integer.parseInt(request.getParameter("currentPage")) : 1;
        int itemsPerPage = 10;
        int startIndex = (currentPage - 1) * itemsPerPage;
        String driverName = "com.mysql.jdbc.Driver";
        String userName = "chenghao";
        String userPasswd = "chenghao";
        String dbName = "demo";
        String tableName = "user";
        String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="
                + userName + "&password=" + userPasswd;

        List<User> userList = new ArrayList<>(); // 定义 userList 变量

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection(url);
            Statement statement = connection.createStatement();

            // Modify the SQL query to include the LIMIT clause for pagination
            String sql = "SELECT * FROM " + tableName + " LIMIT " + startIndex + ", " + itemsPerPage;
            ResultSet rs = statement.executeQuery(sql);

            // Save the ResultSet to a List or any other data structure
            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString(1));
                user.setPassword(rs.getString(2));
                user.setAddress(rs.getString(3));
                user.setTelephone(rs.getString(4));
                user.setAdminName(rs.getString(5));
                userList.add(user);
            }

            // 获取总记录数（总用户数）
            String countSql = "SELECT COUNT(*) FROM " + tableName;
            ResultSet countRs = statement.executeQuery(countSql);
            countRs.next();
            int totalCount = countRs.getInt(1);

            // 计算总页数
            int totalPages = (int) Math.ceil((double) totalCount / itemsPerPage);

            // 设置请求属性
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);

            // Close the ResultSet and the connection
            rs.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (userList == null) {
            userList = new ArrayList<>(); // Ensure userList is an empty list if it's null
        }
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/pages/admin/resources/jsp/admin_user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}