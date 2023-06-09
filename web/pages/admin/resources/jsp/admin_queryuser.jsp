
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 2/7/2023
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">

  <title>water and electricity management system</title>

  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/dashboard.css" rel="stylesheet">

  <script type="text/javascript">
    function logout(){
      if(!confirm("Do you really want to quit？")){
        window["event"].returnValue = false;
      }
    }
  </script>
</head>

<body>
<%

  String driverName = "com.mysql.jdbc.Driver";

  String userName = "chenghao";

  String userPasswd = "chenghao";

  String dbName = "demo";

  String tableName = "user";

  String url = "jdbc:mysql://localhost:3306/" + dbName + "?user="
          + userName + "&password=" + userPasswd;

  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection connection = DriverManager.getConnection(url);
  Statement statement = connection.createStatement();
  String sql = "SELECT * FROM " + tableName;
  ResultSet rs = statement.executeQuery(sql);
%>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand text-primary" href="index.jsp">water and electricity management system</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav justify-content-end">
        <li class="nav-item active">
          <a class="navbar-right" href="admin_information.jsp">The user who is logging in is：${sessionScope.dormadminname}(admin)</a>
        </li>
        <li class="nav-item active">
          <a class="navbar-right" href="${pageContext.request.contextPath}/LoginOutServlet" onclick="return logout()">logout</a>
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

      <h2 class="sub-header">user information &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        <a href="admin_adduser.jsp" >add the user</a>
      </h2>


      <div class="table-responsive">
        <table class="table table-striped" >
          <thead>
          <tr>
            <th>username</th>
            <th>password</th>
            <th>address</th>
            <th>telephone</th>
            <th>admin_name</th>
            <th>operation</th>

          </tr>
          <%
            while (rs.next()) {
          %>
          <tr>
            <th> <%
              out.print(rs.getString(1));
            %>  </th>

          </tr>

          </thead>
          <%
            }
          %>
        </table>
      </div>
      <form class="form-horizontal" role="form" action="/FYP1_war_exploded/AdminSearchServlet" method="post">
        <input type="hidden" name="per" value="service">
        <div class="form-group">
          <label class="col-sm-2 control-label">username</label>
          <div class="col-lg-4">
            <input type="text" class="form-control" placeholder="input username" name="studentid">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">password</label>
          <div class="col-lg-4">
            <input type="text" class="form-control" placeholder="input password" name="studentname">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">address</label>
          <div class="col-lg-4">
            <input type="text" class="form-control" placeholder="input address" name="major">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">telephone</label>
          <div class="col-lg-4">
            <input type="text" class="form-control" placeholder="input telephone" name="department">
          </div>
        </div>

        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">query</button>
          </div>
        </div>
      </form>

    </div>
  </div>
</div>



</div>
</div>
</div>

<!
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>


