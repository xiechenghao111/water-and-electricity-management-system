package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import jakarta.servlet.*;

import modle.DAO;
import modle.JDBCUtil;
import modle.Electricity;
import modle.Water;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
@WebServlet(name = "ChangeElectricityServlet", value = "/ChangeElectricityServlet")
public class ChangeElectricityServlet extends HttpServlet {
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
        Electricity electricity = new Electricity();
        electricity.setID(ID);
        electricity.setUsername(username);
        electricity.setTelephone(telephone);
        electricity.setAdd_Time(add_time);
        electricity.setConsumption(consumption);
        electricity.setAmount_Price(amount_price);
        electricity.setUnit_Price(unit_price);
        electricity.setStage(stage);
        DAO dao = new DAO();

        try {
            Connection conn = db.getConn();
            if (dao.ChangeElectricity(conn, electricity)) {
                out.println("<h1>Water record updated successfully</h1>");
                out.println("<h2>Jump back to the main page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_electricity.jsp");
            } else {
                out.println("<h1>Failed to update water record</h1>");
                out.println("<h2>Jump back to the update water page after 3 seconds</h2>");
                response.setHeader("Refresh", "3;url=/FYP1_war_exploded//pages/admin/resources/jsp/admin_changeelectricity.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

}
