<%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 1/31/2023
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <title>Simpla Admin</title>




  <link rel="stylesheet" href="../css/reset.css" type="text/css" media="screen" />


  <link rel="stylesheet" href="../css/main.css" type="text/css" media="screen" />


  <link rel="stylesheet" href="../css/invalid.css" type="text/css" media="screen" />




  <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen" />

  <script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>


  <script type="text/javascript" src="../js/simpla.jquery.configuration.js"></script>


  <script type="text/javascript" src="../js/facebox.js"></script>

 <script type="text/javascript" src="../js/jquery.bgiframe.js"></script>





  <script type="text/javascript" src="../js/DD_belatedPNG_0.0.7a.js"></script>
  <script type="text/javascript">
    DD_belatedPNG.fix('.png_bg, img, li');
  </script>
  <![endif]-->

</head>

<body>
<div id="body-wrapper">
  <!-- Page Head -->
  <div align="center"><h2></h2></div>



  <div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

      <h3>water and electricity management system</h3>

      <div class="clear"></div>

    </div> <!-- End .content-box-header -->

    <div class="content-box-content">

      <div class="tab-content default-tab" id="tab1"> <!-- This is the target div. id must match the href of this div's tab -->

        <div class="notification attention png_bg">
          <a href="#" class="close"><img src="../images/icons/cross_grey_small.png" title="Close this notification" alt="close" /></a>
          <div>
            welcome ${user.username} enter water and electricity management system
          </div>

        </div>
      </div> <!-- End #tab1 -->


    </div> <!-- End .content-box-content -->

  </div> <!-- End .content-box -->


  <div class="clear"></div>



  <!-- End Notifications -->


</div> <!-- End #main-content -->
</body>
</html>
