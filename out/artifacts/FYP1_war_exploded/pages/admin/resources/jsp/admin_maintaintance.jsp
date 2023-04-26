<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

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

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    <link href="../css/dashboard.css" rel="stylesheet">
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <style>
        .sidebar {
            position: fixed;
            top: 95px;
        }

         body {
             padding-top: 70px;
         }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

    </style>

    <script type="text/javascript">
        function logout(){
            if(!confirm("Do you really want to quit?")){
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
    String tableName = "administrator";
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
                    <a class="navbar-right" href="admin_profile.jsp">The user who is logging in is：${sessionScope.user.username}(admin)</a>
                </li>
                <li class="nav-item active">
                    <a class="navbar-right" href="${pageContext.request.contextPath}//FYP1_war_exploded/LoginOutServlet" onclick="return logout()">logout</a>
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
                <li><a href="admin_user.jsp">user information</a></li>
                <li><a href="admin_water.jsp">water bill management</a></li>
                <li><a href="admin_electricity.jsp">electricity bill management</a></li>
                <li ><a href="admin_personal.jsp">administrator information</a></li>
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

<!-- Begin Page Content -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Charts</h1>


    <!-- Content Row -->
    <div class="row">

        <div class="col-xl-8 col-lg-7">

            <!-- Area Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Area Chart</h6>
                </div>
                <div class="card-body">
                    <div class="chart-area">
                        <canvas id="myAreaChart"></canvas>
                    </div>
                    <hr>
                    showing the water fee that each person has to pay
                </div>
            </div>

            <!-- Bar Chart -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
                </div>
                <div class="card-body">
                    <div class="chart-bar">
                        <canvas id="myBarChart"></canvas>
                    </div>
                    <hr>
                    showing the electricity fee that each person has to pay
                </div>
            </div>

        </div>

        <!-- Donut Chart -->
        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4">
                        <canvas id="myPieChart"></canvas>
                    </div>
                    <hr>
                    the proportional relationship between water and electricity charges
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2023</span>
        </div>
    </div>
</footer>
</div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="../vendor/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
<script src="../js/demo/chart-area-demo.js"></script>
<script src="../js/demo/chart-pie-demo.js"></script>
<script src="../js/demo/chart-bar-demo.js"></script>
</body>
</html>



