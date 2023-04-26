<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  String username = request.getParameter("username");

  String dbURL = "jdbc:mysql://127.0.0.1:3306/demo?user=chenghao";
  String dbUser = "chenghao";
  String dbPassword = "chenghao";

  try (Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
    String updateSql = "UPDATE water SET stage = 'paid' WHERE username = ?";
    try (PreparedStatement preparedStatement = connection.prepareStatement(updateSql)) {
      preparedStatement.setString(1, username);
      preparedStatement.executeUpdate();
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Payment Success</title>
</head>
<body>
<h1>Payment Success</h1>
<p>Thank you for your payment. Your order status has been updated.</p>
<a href="student_water.jsp">Back to water query</a>
</body>
</html>