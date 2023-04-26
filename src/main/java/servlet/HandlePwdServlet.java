package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import modle.DAO;
import modle.JDBCUtil;
import modle.User;

@WebServlet(name = "HandlePwdServlet", value = "/HandlePwdServlet")
public class HandlePwdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String again_password = request.getParameter("again_password").trim();

        byte[] bytes = username.getBytes("ISO-8859-1");
        username = new String(bytes,"utf-8");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBCUtil db = new JDBCUtil();

        User user = new User(username,password);
        DAO dao = new DAO();

        try {

            Connection conn = db.getConn();

            if(dao.searchUser(conn, user) == null) {
                out.println("<h2>The user does not exist, please register first</h2>");
                out.println("<h2>Return to the password change page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=pages/admin/resources/jsp/change_pwd.jsp");
            } else {
                if(!password.equals(again_password)) {
                    out.println("<h2>The two entered passwords do not match</h2>");
                    out.println("<h2>Return to the password change page after 3 seconds</h2>");
                    response.setHeader("Refresh", "3;url=pages/admin/resources/jsp/change_pwd.jsp");
                } else {
                    String sql="update user set password=? where username=?";

                    PreparedStatement pstatement =conn.prepareStatement(sql);
                    pstatement.setString(1, user.getPassword());
                    pstatement.setString(2, user.getUsername());

                    int res = pstatement.executeUpdate();
                    if(res != 0) {
                        out.println("<h1>password has been updated</h1>");
                        out.println("<h2>Jump back to the login page after 3 seconds</h2>");
                        response.setHeader("Refresh", "3;url=pages/admin/resources/jsp/userlogin.jsp");
                    } else {
                        out.println("<h2>Failed to change password</h2>");
                        out.println("<h2>Return to the password change page after 3 seconds</h2>");
                        response.setHeader("Refresh", "3;url=pages/admin/resources/jsp/change_pwd.jsp");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
