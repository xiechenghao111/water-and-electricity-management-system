
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
    <link rel="icon" href="../images/FINN.ico">

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

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand text-primary" href="index.jsp">water and electricity management system</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav justify-content-end">
                <li class="nav-item active">
                    <a class="navbar-right" href="student_information.jsp">The user who is logging in is：${sessionScope.user.username}(student)</a>
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
                <li><a href="student_information.jsp">homepage</a></li>
                <li class="active"><a href="student_personal.jsp">personal information</a></li>
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

            <h2 class="sub-header">personal information</h2>


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

                    <tr>
                        <th>chenghao</th>
                        <th>xch20100118</th>
                        <th>Waterford</th>
                        <th>3530920232</th>
                        <th>Mary</th>
                        <th>true</th>
                    </tr>
                    <tr>
                        <th>Isarwi</th>
                        <th>qsz123456</th>
                        <th>Nanjing</th>
                        <th>180203292</th>
                        <th>Mary</th>
                        <th>true</th>
                    </tr>
                    <tr>
                        <th>Jack</th>
                        <th>jack12121</th>
                        <th>Dublin</th>
                        <th>3532027322</th>
                        <th>North</th>
                        <th>false</th>
                    </tr>
                    <tr>
                        <th>Mike</th>
                        <th>mike001122</th>
                        <th>London</th>
                        <th>3532124643</th>
                        <th>North</th>
                        <th>true</th>
                    </tr>

                    </thead>

                </table>
            </div>
            <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/AdminSearchServlet" method="post">
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
            <div style="position: fixed; bottom: 0; right: 0;">
                <img src="../images/SETU_LOGO.png" alt="SETU Logo">
            </div>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</body>
</html>

