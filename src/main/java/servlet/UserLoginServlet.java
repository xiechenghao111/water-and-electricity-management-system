package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import modle.DAO;
import modle.JDBCUtil;
import modle.JsonResult;
import modle.User;

@WebServlet(name = "/FYP1_war_exploded/UserLoginServlet", value = "/FYP1_war_exploded/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String code = request.getParameter("code");

        System.out.println(password);
        System.out.println(email);
        System.out.println(code);

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


            if (username != null && password != null) {
                //解决中文字符乱码
                byte[] bytes = username.getBytes("ISO-8859-1");
                username = new String(bytes, "utf-8");
                System.out.println(username);

                JDBCUtil db = new JDBCUtil();
                // 创建一个用户保存下将密码和用户名保存
                User user = new User(username, password);
                DAO dao = new DAO();
                try {
                    //数据库连接
                    Connection conn = db.getConn();

                    if (dao.login(conn, user) != null) {
                        request.getSession().setAttribute("user", user);
                        response.sendRedirect("pages/admin/resources/jsp/student_personal.jsp");
                    } else {
                        out.println("<h1>Username or password error, authentication failed</h1>");
                        out.println("<h2>Jump back to the login page after 3 seconds</h2>");
                        response.setHeader("Refresh", "3;url=pages/admin/resources/jsp/userlogin.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    out.close();
                }
            } else if (email != null && code != null) { //邮箱验证码方式
                // 判断emailCode是否正确
                String s_emailCode = (String) request.getSession().getAttribute("emailCode");
                JsonResult jr = new JsonResult();
                if (!code.equalsIgnoreCase(s_emailCode)) {
                    out.println("<h1>Email verification code error, verification failed</h1>");
                    out.println("<h2>Jump back to the login page after 3 seconds</h2>");
                    response.setHeader("Refresh", "3;url=pages/admin/resources/jsp/userlogin.jsp");
                } else { // 验证成功
                    response.sendRedirect("pages/admin/resources/jsp/student_personal.jsp");
                }
                out.close();
            }


    }

}
