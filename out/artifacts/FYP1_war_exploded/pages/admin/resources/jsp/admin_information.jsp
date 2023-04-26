<%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 2/2/2023
  Time: 3:09 PM
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
            if(!confirm("Do you really want to quit?")){
                window["event"].returnValue = false;
            }
        }
    </script>
    <style>
        .sidebar {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            z-index: 1000;
            padding: 20px 0;
            overflow-x: hidden;
            overflow-y: auto;
            border-right: 1px solid #eee;
        }
    </style>
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
                    <a class="navbar-right" href="admin_profile.jsp">The user who is logging in is：${sessionScope.user.username}(admin)</a>
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
                <li ><a href="admin_information.jsp">homepage</a></li>
                <li><a href="admin_price.jsp">water and electricity price</a></li>
                <li ><a href="admin_user.jsp">user information</a></li>
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
            <li><a href = "admin_maintaintance.jsp">basic data maintaintance</a></li>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2>Welcome to Water and Electricity Management System</h2>
            <p>Here you can manage your users, roles and permissions.</p>
            <div class="row">

                <div class="col-md-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Water and electricity prices</h3>
                        </div>
                        <div class="panel-body">
                            <p>View and modify utility price information.</p>
                            <a href="admin_price.jsp" class="btn btn-success">enter</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">User information</h3>
                        </div>
                        <div class="panel-body">
                            <p>Manage user information in the system.</p>
                            <a href="admin_user.jsp" class="btn btn-info">enter</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3 class="panel-title">Water bill management</h3>
                        </div>
                        <div class="panel-body">
                            <p>Manage water bills and related information.</p>
                            <a href="admin_water.jsp" class="btn btn-warning">enter</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">Electricity bill management</h3>
                        </div>
                        <div class="panel-body">
                            <p>Manage electricity bills and related information.</p>
                            <a href="admin_electricity.jsp" class="btn btn-danger">enter</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">administrator information</h3>
                        </div>
                        <div class="panel-body">
                            <p>View and manage administrator information.</p>
                            <a href="administrator_information.jsp" class="btn btn-default">enter</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">basic data maintenance</h3>
                        </div>
                        <div class="panel-body">
                            <p>Perform basic data maintenance</p>
                            <a href="admin_maintaintance.jsp" class="btn btn-primary">enter</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



</div>
        </div>
        <div style="position: fixed; bottom: 0; right: 0;">
            <img src="../images/SETU_LOGO.png" alt="SETU Logo">
        </div>

        </div>
    </div>
</div>

<!
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>

