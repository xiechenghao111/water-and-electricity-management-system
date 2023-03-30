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
            if(!confirm("真的要退出吗？")){
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
                    <a class="navbar-right" href="${pageContext.request.contextPath}/LoginOutServlet" onclick="return logout()">log out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar hidden-xs">
            <ul class="nav nav-sidebar">

                <li ><a href="student_information.jsp">homepage</a></li>
                <li><a href="student_personal.jsp">personal information</a></li>
                <li class="active"><a href="student_price.jsp">price query</a></li>
                <li ><a href="student_water.jsp">water query</a></li>
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
            <h2 class="sub-header">price query</h2>
            <div class="table-responsive">
                <table class="table table-striped" >
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>name</th>
                        <th>unit price</th>
                        <th>last_months price</th>
                        <th>float</th>

                    </tr>
                    <tr>
                        <th>1</th>
                        <th>water</th>
                        <th>2</th>
                        <th>1.9</th>
                        <th>higher</th>

                    </tr>
                    <tr>
                        <th>2</th>
                        <th>electricity</th>
                        <th>1.5</th>
                        <th>1.7</th>
                        <th>lower</th>


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

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>
