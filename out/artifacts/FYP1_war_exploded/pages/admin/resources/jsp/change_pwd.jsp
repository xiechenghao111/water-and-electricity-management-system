<%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 2/1/2023
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>change password</title>
  <!-- 导入基础样式 -->
  <link rel="stylesheet" href="../css/base.css">
  <link rel="stylesheet" href="../css/change_pwd.css">
  <script src="../js/change_pwd.js"></script>
</head>
<body>
<div class="container">
  <form action="/FYP1_war_exploded/HandlePwdServlet" method="post" id="myform">
    <h2>change password</h2>
    <div class="item">username：<input type="text" name="username" id="username" required></div>
    <div class="item">change ：<input type="password" name="password" id="password" required></div>
    <div class="item">confirm ：<input type="password" name="again_password" id="again_password" required></div>
    <div class="button">
      <input type="submit" value="confirm" id="submit">
      <input type="reset" value="reset" id="reset">
    </div>
  </form>
</div>
</body>
</html>