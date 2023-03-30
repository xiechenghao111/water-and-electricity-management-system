package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import modle.Deleteuser;
import modle.DAO;
import modle.JDBCUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet(name = "DeleteUserServlet", value = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String address = request.getParameter("address").trim();
        String telephone = request.getParameter("telephone").trim();
        byte[] bytes = username.getBytes("ISO-8859-1");
        username = new String(bytes,"utf-8");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBCUtil db = new JDBCUtil();
        // 创建一个用户保存下将密码和用户名保存
        Deleteuser user = new Deleteuser(username,password,address,telephone);
        DAO dao = new DAO();
        try {
            //数据库连接
            Connection conn = db.getConn();

            if(dao.deleteUser(conn, user)) {
                out.println("<h1>Successfully delete the user</h1>");
                out.println("<h2>Jump back to the admin_user page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_user.jsp");
            } else {
                out.println("<h1>Failed to delete the user</h1>");
                out.println("<h2>Jump back to the add user page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_deleteuser.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }

    }
}
