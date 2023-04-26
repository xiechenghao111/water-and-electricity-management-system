package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import modle.DAO;
import modle.JDBCUtil;
import modle.Changeprice;

@WebServlet(name = "ChangePriceServlet", value = "/ChangePriceServlet")
public class ChangePriceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type").trim();
        String unit_price = request.getParameter("unit_price").trim();
        String last_months_price = request.getParameter("last_months_price").trim();
        String fluctuation = request.getParameter("fluctuation").trim();
        Integer ID = Integer.parseInt(request.getParameter("ID").trim());

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBCUtil db = new JDBCUtil();
        Changeprice changeprice = new Changeprice(type, unit_price, last_months_price, fluctuation, ID);
        DAO dao = new DAO();
        try {
            Connection conn = db.getConn();
            if (dao.changePrice(conn, changeprice)) {
                out.println("<h1>Successfully updated price information</h1>");
                out.println("<h2>Jump back to the price page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_price.jsp");
            } else {
                out.println("<h1>Failed to update price information</h1>");
                out.println("<h2>Jump back to the change price page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_price.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}