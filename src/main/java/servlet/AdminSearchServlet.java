package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import DAO.StudentDao;
import JAVABEAN.User;
import  JDBC.DBUtils;
import modle.JDBCUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "/AdminSearchServlet", value = "/AdminSearchServlet")
public class AdminSearchServlet extends HttpServlet {
    protected List<User> search(String username, String password, String telephone) {
        List<User> users = new ArrayList<User>();
        DBUtils db = new DBUtils();
        try {
            // 获取数据库连接
            Connection conn = db.getConnection();
            // 构造 SQL 查询语句
            String sql = "SELECT * FROM user WHERE 1=1";
            if (username != null && !username.isEmpty()) {
                sql += " AND username = '" + username + "'";
            }
            if (password != null && !password.isEmpty()) {
                sql += " AND password = '" + password + "'";
            }
            if (telephone != null && !telephone.isEmpty()) {
                sql += " AND telephone = '" + telephone + "'";
            }
            // 执行 SQL 查询，并将结果保存到 users 列表中
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setTelephone(rs.getString("telephone"));
                users.add(user);
            }
            // 关闭连接
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return users;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String telephone = request.getParameter("telephone");

        // 处理搜索逻辑，查询数据库或调用外部API
        List<User> users = search(username, password, telephone); // 返回User对象列表
        // 将搜索结果保存到request中
        request.setAttribute("users", users);
        // 转发到结果页面
        response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_search_results.jsp");
    }


    }

