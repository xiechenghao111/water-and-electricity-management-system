<%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 3/28/2023
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LOGIN</title>

  <link rel="stylesheet" href="../css/base.css">

  <link rel="stylesheet" href="../css/login.css">

  <script src="../js/focus.js"></script>

  <script src="../js/animate.js"></script>

  <script src="../js/time.js"></script>

  <script src="../js/login.js"></script>
</head>

<body>
<div class="container">

  <header class="header">

    <div class="logo">

    </div>
    <div class="vline"></div>
    <h2 class="brand">water and electricity management system</h2>
    <div class="time">
      <h6 class="date"></h6>
      <h6 class="second"></h6>
    </div>
  </header>


  <main>

    <div class="left">
      <div class="left_container">
        <div class="focus">

          <a href="javascript:;" class="arrow-l"></a>

          <a href="javascript:;" class="arrow-r"></a>

          <ul>
            <li><img src="../images/1.jpg" alt=""></li>
            <li><img src="../images/2.png" alt=""></li>
            <li><img src="../images/3.png" alt=""></li>
          </ul>

          <ol class="circle">
          </ol>
        </div>
      </div>
    </div>


    <div class="right">
      <form action="/FYP1_war_exploded/AdminLoginServlet" method="post" class="login_container">

        <div class="login_method">
          <span><a href="javascript:;" class="account_a">admin</a></span>
          <span><a href="javascript:;" class="phone_a">email</a> </span>
        </div>



        <div class="hline"></div>


        <div class="input_box"></div>


        <div style="display: flex; justify-content: space-between; margin-top: 20px;margin-bottom: 20px;">
          <a href="userlogin.jsp" style="margin-right: 20px;">user login</a>
          <a href="change_pwd.jsp" style="margin-left: 20px;">change psw</a>
        </div>


        <input type="submit" class="click_login" value="login"/>




      </form>
    </div>
  </main>
</div>
</body>
</html>
