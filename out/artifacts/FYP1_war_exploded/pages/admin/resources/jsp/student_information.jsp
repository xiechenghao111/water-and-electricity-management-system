
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
    <link rel="icon" href="images/FINN.ico">

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
                    <a class="navbar-right" href="student_profile.jsp">The user who is logging in is：${sessionScope.user.username}(student)</a>
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

                <li class="active"><a href="student_information.jsp">homepage</a></li>
                <li><a href="student_personal.jsp">personal information</a></li>
                <li><a href="student_price.jsp">price query</a></li>
                <li><a href="student_water.jsp">water query</a></li>
                <li><a href="student_electricity.jsp">electricity query</a></li>

            </ul>
        </div>
        <div class="visible-xs">
            <li><a href="student_information.jsp">homepage</a></li>
            <li><a href="student_personal.jsp">personal information</a></li>
            <li><a href="student_price.jsp">price query</a></li>
            <li><a href="student_water.jsp">water query</a></li>
            <li><a href="student_electricity.jsp">electricity query</a></li>

        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2>Welcome to Water and Electricity Management System</h2>
            <p>Here you can manage your users, roles and permissions.</p>
            <div class="row">

                <div class="col-md-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">personal information</h3>
                        </div>
                        <div class="panel-body">
                            <p>View user personal information</p>
                            <a href="student_personal.jsp" class="btn btn-success">enter</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">Price query</h3>
                        </div>
                        <div class="panel-body">
                            <p>Query the water and electricity price</p>
                            <a href="student_price.jsp" class="btn btn-info">enter</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-4">
                    <div class="panel panel-danger">
                        <div class="panel-heading">
                            <h3 class="panel-title">Water query</h3>
                        </div>
                        <div class="panel-body">
                            <p>Query water usage and payment status</p>
                            <a href="student_water.jsp" class="btn btn-danger">enter</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Electricity query</h3>
                        </div>
                        <div class="panel-body">
                            <p>Query electricity usage and payment status.</p>
                            <a href="student_electricity.jsp" class="btn btn-default">enter</a>
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</body>
</html>

