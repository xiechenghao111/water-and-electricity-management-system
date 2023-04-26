package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.io.IOException;

import modle.Adduser;
import modle.DAO;
import modle.JDBCUtil;
import modle.Addadmin;
@WebServlet(name = "AddAdminServlet", value = "/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
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

        Addadmin addadmin = new Addadmin(username,password,address,telephone);
        DAO dao = new DAO();
        try {

            Connection conn = db.getConn();

            if(dao.addAdmin(conn, addadmin)) {
                out.println("<h1>Successfully add new adminstrator</h1>");
                out.println("<h2>Jump back to the admin_personal page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_personal.jsp");
            } else {
                out.println("<h1>Failed to add new user</h1>");
                out.println("<h2>Jump back to the add user page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_personal.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
