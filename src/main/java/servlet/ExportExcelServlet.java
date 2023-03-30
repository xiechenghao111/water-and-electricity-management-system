package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import modle.Water;
import org.apache.poi.ss.util.CellRangeAddress;

@WebServlet(name = "ExportExcelServlet", value = "/ExportExcelServlet")
public class ExportExcelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/demo?user=chenghao", "chenghao", "chenghao");

            // 执行SQL查询
            String sql = "SELECT * FROM water";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            // 将查询结果存储在List中
            List<Water> dataList = new ArrayList<>();
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnName(i);
                System.out.println("Column " + i + " name: " + columnName);
            }
            while (rs.next()) {
                Water water = new Water();
                water.setId(rs.getLong("id"));
                water.setUsername(rs.getString("username"));
                water.setTelephone(rs.getString("telephone"));
                water.setAdd_Time(rs.getDate("add_time"));
                water.setConsumption(rs.getLong("consumption"));
                water.setAmount_Price(rs.getLong("amount_price"));
                water.setUnit_Price(rs.getLong("unit_price"));
                water.setStage(rs.getString("stage"));
                dataList.add(water);
            }

            // 导出数据到Excel文件
            Workbook workbook = new HSSFWorkbook();
            Sheet sheet = workbook.createSheet("Water Bill");

            // 创建标题行
            Row titleRow = sheet.createRow(0);
            titleRow.createCell(0).setCellValue("ID");
            titleRow.createCell(1).setCellValue("Username");
            titleRow.createCell(2).setCellValue("Telephone");
            titleRow.createCell(3).setCellValue("Add Time");
            titleRow.createCell(4).setCellValue("Consumption");
            titleRow.createCell(5).setCellValue("Amount Price");
            titleRow.createCell(6).setCellValue("Unit Price");
            titleRow.createCell(7).setCellValue("Stage");

            // 创建数据行
            int rowNum = 1;
            for (Water water : dataList) {
                Row dataRow = sheet.createRow(rowNum++);
                dataRow.createCell(0).setCellValue(water.getId());
                dataRow.createCell(1).setCellValue(water.getUsername());
                dataRow.createCell(2).setCellValue(water.getTelephone());
                dataRow.createCell(3).setCellValue(water.getAdd_Time().toString());
                dataRow.createCell(4).setCellValue(water.getConsumption());
                dataRow.createCell(5).setCellValue(water.getAmount_Price());
                dataRow.createCell(6).setCellValue(water.getUnit_Price());
                dataRow.createCell(7).setCellValue(water.getStage());
            }

            // 合并标题行


            // 设置样式
            CellStyle titleStyle = workbook.createCellStyle();
            titleStyle.setAlignment(HorizontalAlignment.CENTER);
            titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
            Font titleFont = workbook.createFont();
            titleFont.setBold(true);
            titleStyle.setFont(titleFont);
            titleRow.getCell(0).setCellStyle(titleStyle);
            for (int i = 1; i <= 7; i++) {
                titleRow.getCell(i).setCellStyle(titleStyle);
            }
            // 设置列宽
            sheet.setColumnWidth(0, 256 * 10);
            sheet.setColumnWidth(1, 256 * 15);
            sheet.setColumnWidth(2, 256 * 15);
            sheet.setColumnWidth(3, 256 * 20);
            sheet.setColumnWidth(4, 256 * 15);
            sheet.setColumnWidth(5, 256 * 15);
            sheet.setColumnWidth(6, 256 * 15);
            sheet.setColumnWidth(7, 256 * 15);

            // 下载Excel文件
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode("Water_Bill.xls", "UTF-8"));
            OutputStream out = response.getOutputStream();
            workbook.write(out);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
