<%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 2/1/2023
  Time: 11:08 AM
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
    <!-- 导入基础样式 -->
    <link rel="stylesheet" href="../css/base.css">
    <!-- 导入登录页面的样式 -->
    <link rel="stylesheet" href="../css/login.css">
    <!-- 导入轮播图的js -->
    <script src="../js/focus.js"></script>
    <!-- 导入animate.js -->
    <script src="../js/animate.js"></script>
    <!-- 导入时间的js -->
    <script src="../js/time.js"></script>
    <!-- 导入登录的js -->
    <script src="../js/login.js"></script>
</head>

<body>
<div class="container">
    <!-- 顶部导航栏 -->
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

    <!-- 主体内容 -->
    <main>
        <!-- 左侧轮播图 -->
        <div class="left">
            <div class="left_container">
                <div class="focus">
                    <!-- 左侧按钮 -->
                    <a href="javascript:;" class="arrow-l"></a>
                    <!-- 右侧按钮 -->
                    <a href="javascript:;" class="arrow-r"></a>
                    <!-- 轮播图的图片 -->
                    <ul>
                        <li><img src="../images/1.jpg" alt=""></li>
                        <li><img src="../images/2.png" alt=""></li>
                        <li><img src="../images/3.png" alt=""></li>
                    </ul>
                    <!-- 小圆点 -->
                    <ol class="circle">
                    </ol>
                </div>
            </div>
        </div>

        <!-- 右侧登陆界面 -->
        <div class="right">
            <form action="/FYP1_war_exploded/UserLoginServlet" method="post" class="login_container">
                <!-- 登录方式 -->
                <div class="login_method">
                    <span><a href="javascript:;" class="account_a">account</a></span>
                    <span><a href="javascript:;" class="phone_a">email</a> </span>
                </div>


                <!-- 分割线 -->
                <div class="hline"></div>

                <!-- 输入框 用来占位 -->
                <div class="input_box"></div>

                <div style="display: flex; justify-content: space-between; margin-top: 20px;margin-bottom: 20px;">
                    <a href="adminlogin.jsp" style="margin-right: 20px;">admin login</a>
                    <a href="change_pwd.jsp" style="margin-left: 20px;">change psw</a>
                </div>


                <input type="submit" class="click_login" value="login"/>


                <a href="register.jsp" class="to_register">Not registered? go to register first</a>

            </form>
        </div>
    </main>
</div>
</body>
</html>