package servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.io.IOException;

@WebServlet(name = "UpdateRecordServlet", value = "/UpdateRecordServlet")

public class UpdateRecordServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/demo?user=chenghao";
    private static final String DB_USERNAME = "chenghao";
    private static final String DB_PASSWORD = "chenghao";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recordId = request.getParameter("recordId");

        if (recordId != null) {
            try {
                updateDatabaseRecord(recordId);
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void updateDatabaseRecord(String recordId) throws SQLException {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD)) {
            String updateQuery = "UPDATE water SET stage = 'paid' WHERE ID = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
                pstmt.setString(1, recordId);
                pstmt.executeUpdate();
            }
        }
    }

}
