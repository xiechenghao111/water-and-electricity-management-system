<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>Simpla Admin</title>


	<link rel="stylesheet" href="<%=path %>../css/reset.css" type="text/css" media="screen" />


	<link rel="stylesheet" href="<%=path %>../css/style.css" type="text/css" media="screen" />


	<link rel="stylesheet" href="<%=path %>../css/invalid.css" type="text/css" media="screen" />


			<link rel="stylesheet" href="<%=path %>../css/ie.css" type="text/css" media="screen" />

	<script type="text/javascript" src="<%=path %>../js/jquery-1.3.2.min.js"></script>

	<!-- jQuery Configuration -->
	<script type="text/javascript" src="<%=path %>../js/simpla.jquery.configuration.js"></script>

	<!-- Facebox jQuery Plugin -->
	<script type="text/javascript" src="<%=path %>../js/facebox.js"></script>

	<!-- jQuery WYSIWYG Plugin -->
	<script type="text/javascript" src="<%=path %>../js/jquery.wysiwyg.js"></script>

	<!-- jQuery Datepicker Plugin -->
	<script type="text/javascript" src="<%=path %>../js/jquery.datePicker.js"></script>
	<script type="text/javascript" src="<%=path %>../js/jquery.date.js"></script>
	<!--[if IE]><script type="text/javascript" src="<%=path %>../js/jquery.bgiframe.js"></script><![endif]-->


	<!-- Internet Explorer .png-fix -->

	<!--[if IE 6]>
			<script type="text/javascript" src="<%=path %>../js/DD_belatedPNG_0.0.7a.js"></script>
			<script type="text/javascript">
				DD_belatedPNG.fix('.png_bg, img, li');
			</script>


</head>

<body><div id="body-wrapper">

	<div id="sidebar">
		<div id="sidebar-wrapper">

		<h1 id="sidebar-title"><a href="#">Simpla Admin</a></h1>


		<a href="#"><img id="logo" src="<%=path %>../images/logo.png" alt="Simpla Admin logo" /></a>


		<div id="profile-links">
			Hello,<c:if test="${usertype==0}" >管理员：<a href="#" title="Edit your profile">${user.username}</a></c:if>
			<c:if test="${usertype==1}" >用户：<a href="#" title="Edit your profile">${user.username}</a></c:if>

			<br />
			<br />
			<a href="./main.jsp" target=main title="View the Site">返回首页</a> |
			<a  onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="./userlogin.jsp" target=_top title="Sign Out">注销</a>
		</div>

		<ul id="main-nav">  <!-- Accordion Menu -->

			<li>
				<a href="#" class="nav-top-item no-submenu"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
					关闭导航
				</a>
			</li>
			<c:if test="${usertype==0}" >
				<li>
					<a href="#" class="nav-top-item current"> <!-- Add the class "current" to current menu item -->
						基本数据维护
					</a>
					<ul>

						<li><a target="main" href="<%=path %>/getAllMoneyInfo.do">水电价格</a></li>
						<li><a target="main" href="<%=path %>/listUser.do">用户信息</a></li> <!-- Add class "current" to sub menu items also -->
						<li><a target="main" href="<%=path %>/listWater.do">水费管理</a></li>
						<li><a target="main" href="<%=path %>/listPower.do">电费管理</a></li>
						<li><a target="main" href="<%=path %>/listAdmin.do">管理员管理</a></li>


					</ul>
				</li>
			</c:if>
			<li>
				<a href="#" class="nav-top-item " >
					个人信息
				</a>
				<ul>

					<li><a target="main" href="<%=path %>changepw.jsp">修改密码</a></li>
					<c:if test="${usertype==1}" >
						<li><a target="main" href="<%=path %>/getAllMoneyAndPowerInfo.do">水电信息查询</a></li>
						<li><a target="main" href="<%=path %>/page/user/editUserSelf.jsp">个人信息</a></li>
					</c:if>
				</ul>
			</li>


		</ul> <!-- End #main-nav -->



	</div>
	</div> <!-- End #sidebar -->
	<script type="text/javascript">
		$(document).ready(function(){
			$('li > a').click(function(){

						if($(this).hasClass("current")){
							$(this).removeClass("current");
						}else{
							$('li > a').removeClass("current");
							$(this).addClass("current");
						}
					}
			);
		});
	</script>
</div>

</body>

</html>