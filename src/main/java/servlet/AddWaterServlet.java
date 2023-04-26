package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import modle.DAO;
import modle.JDBCUtil;
import modle.Water;

@WebServlet(name = "AddWaterServlet", value = "/AddWaterServlet")
public class AddWaterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long ID = Long.parseLong(request.getParameter("ID").trim());
        String username = request.getParameter("username").trim();
        String telephone = request.getParameter("telephone").trim();
        Date add_time = Date.valueOf(request.getParameter("add_time").trim());
        long consumption = Long.parseLong(request.getParameter("consumption").trim());
        long amount_price = Long.parseLong(request.getParameter("amount_price").trim());
        long unit_price = Long.parseLong(request.getParameter("unit_price").trim());
        String stage = request.getParameter("stage").trim();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBCUtil db = new JDBCUtil();
        Water water = new Water();
        water.setID(ID);
        water.setUsername(username);
        water.setTelephone(telephone);
        water.setAdd_Time(add_time);
        water.setConsumption(consumption);
        water.setAmount_Price(amount_price);
        water.setUnit_Price(unit_price);
        water.setStage(stage);
        DAO dao = new DAO();

        try {
            Connection conn = db.getConn();
            if (dao.addWater(conn, water)) {
                out.println("<h1>Water record added successfully</h1>");
                out.println("<h2>Jump back to the main page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_water.jsp");
            } else {
                out.println("<h1>Failed to add water record</h1>");
                out.println("<h2>Jump back to the add water page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_addwater.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}