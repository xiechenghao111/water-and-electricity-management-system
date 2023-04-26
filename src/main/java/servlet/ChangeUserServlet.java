package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import modle.DAO;
import modle.JDBCUtil;
import modle.Changeuser;

@WebServlet(name = "ChangeUserServlet", value = "/ChangeUserServlet")
public class ChangeUserServlet extends HttpServlet {
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
        String admin_name = request.getParameter("admin_name").trim();
        String operation = request.getParameter("operation").trim();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBCUtil db = new JDBCUtil();
        Changeuser changeuser = new Changeuser(username, password, address, telephone, admin_name, operation);
        DAO dao = new DAO();
        try {
            Connection conn = db.getConn();
            if (dao.changeUser(conn, changeuser)) {
                out.println("<h1>Successfully updated user information</h1>");
                out.println("<h2>Jump back to the admin_user page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_user.jsp");
            } else {
                out.println("<h1>Failed to update user information</h1>");
                out.println("<h2>Jump back to the change user page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_changeuser.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}