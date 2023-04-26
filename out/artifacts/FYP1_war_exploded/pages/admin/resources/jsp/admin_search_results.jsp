<%@ page import="java.util.List" %>
<%@ page import="JAVABEAN.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>water and electricity management system</title>

  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/dashboard.css" rel="stylesheet">

  <script type="text/javascript">
    function logout(){
      if(!confirm("Do you really want to quit?")){
        window["event"].returnValue = false;
      }
    }
  </script>
</head>

<body>



<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand text-primary" href="index.jsp">water and electricity management system</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav justify-content-end">
        <li class="nav-item active">
          <a class="navbar-right" href="admin_information.jsp">The user who is logging in is：${sessionScope.user.username}(admin)</a>
        </li>
        <li class="nav-item active">
          <a class="navbar-right" href="${pageContext.request.contextPath}/FYP1_war_exploded/LoginOutServlet" onclick="return logout()">logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-3 col-md-2 sidebar hidden-xs">
      <ul class="nav nav-sidebar">
        <li><a href="admin_information.jsp">homepage</a></li>
        <li><a href="admin_price.jsp">water and electricity price</a></li>
        <li class="active"><a href="admin_user.jsp">user information</a></li>
        <li><a href="admin_water.jsp">water bill management</a></li>
        <li><a href="admin_electricity.jsp">electricity bill management</a></li>
        <li><a href="admin_personal.jsp">administrator information</a></li>
        <li><a href = "admin_maintaintance.jsp">basic data mataintance</a></li>
      </ul>
    </div>
    <div class="visible-xs">
      <li><a href="admin_information.jsp">homepage</a></li>
      <li><a href="admin_price.jsp">water and electricity price</a></li>
      <li><a href="admin_user.jsp">user information</a></li>
      <li><a href="admin_water.jsp">water bill management</a></li>
      <li><a href="admin_electricity.jsp">electricity bill management</a></li>
      <li><a href="admin_personal.jsp">administrator information</a></li>
      <li><a href = "admin_maintaintance.jsp">basic data mataintance</a></li>
    </div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <h3 style="text-align: center">user information</h3>
      <div style="float: right; margin: 5px;">
        <a class="btn btn-primary" href="${pageContext.request.contextPath }/pages/admin/resources/jsp/admin_adduser.jsp">add user</a>
        <a class="btn btn-primary" href="${pageContext.request.contextPath }/pages/admin/resources/jsp/admin_deleteuser.jsp">delete user</a>
        <a class="btn btn-primary" href="${pageContext.request.contextPath }/pages/admin/resources/jsp/admin_changeuser.jsp">change user</a>
      </div>

        <% List<User> users = (List<User>) request.getAttribute("users"); %>

        <table border="1" class="table table-bordered table-hover">
          <thead>
          <tr>

            <th>username</th>
            <th>password</th>
            <th>name</th>
            <th>email</th>
            <th>telephone</th>
            <th>operation</th>
          </tr>
          <tr>
            <th>Chenghao</th>
            <th>xch123456</th>
            <th>Waterford</th>
            <th>3530920232</th>
            <th>Mary</th>
            <th>true</th>

          </tr>
          </thead>

        </table>
      </div>
      <div style="position: fixed; bottom: 0; right: 0;">
        <img src="../images/SETU_LOGO.png" alt="SETU Logo">
      </div>
    </div>

  </div>
</div>
  <!-- Bootstrap core JavaScript -->
  <script src="../js/jquery-3.6.0.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
</body>
</html>
