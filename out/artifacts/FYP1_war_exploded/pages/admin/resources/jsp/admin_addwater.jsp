<%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 2/7/2023
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>add the user</title>
  <!-- 导入基础样式 -->
  <link rel="stylesheet" href="../css/base.css">
  <link rel="stylesheet" href="../css/adduser.css">
  <script src="../js/change_pwd.js"></script>
</head>
<body>
<div class="container">
  <form action="/my_login/HandlePwdServlet" method="post" id="myform">
    <h2>add water information</h2>
    <div class="item">username：<input type="text" name="username" id="username" required></div>
    <div class="item">telephone ：<input type="text" name="telephone" id="telephone" required></div>
    <div class="item">consume ：<input type="text" name="consumption" id="consumption" required></div>
    <div class="item">amount：<input type="text" name="amount price" required></div>

    <div class="button">
      <input type="submit" value="confirm" id="submit">
      <input type="reset" value="reset" id="reset">
    </div>
  </form>
</div>
</body>
</html>

