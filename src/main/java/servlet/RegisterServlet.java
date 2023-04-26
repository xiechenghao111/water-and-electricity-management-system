package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.io.IOException;
import modle.DAO;
import modle.JDBCUtil;
import modle.User;
@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
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

            if(username.length() < 5 || password.length() < 8 || !password.matches(".*\\d.*") || !password.matches(".*[a-zA-Z].*")) {
                out.println("<h2>Invalid username or password</h2>");
                out.println("<h2>Username should have at least 5 characters, and password should have at least 8 characters including at least one digit and one letter</h2>");
                out.println("<h2>Return to the registration page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/register.jsp");
            } else if(!password.equals(again_password)) {
                out.println("<h2>The two entered passwords do not match</h2>");
                out.println("<h2>Return to the registration page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/register.jsp");
            } else {
                if(dao.register(conn, user)) {
                    out.println("<h1>Successfully registered new user</h1>");
                    out.println("<h2>Jump back to the login page after 3 seconds</h2>");
                    response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/userlogin.jsp");
                } else {
                    out.println("<h1>Failed to register new user, username already exists</h1>");
                    out.println("<h2>Return to the registration page after 3 seconds</h2>");
                    response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/register.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
