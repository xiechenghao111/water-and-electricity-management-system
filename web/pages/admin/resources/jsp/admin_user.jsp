<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="JAVABEAN.User" %>
<%@ page import="java.util.List" %><%--
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

            <div style="float: left;">

                <form class="form-inline" action="/FYP1_war_exploded/AdminSearchServlet" method="post">
                    <div class="form-group">
                        <label for="exampleInputName2">username</label>
                        <input type="text" class="form-control" id="exampleInputName2" name="username">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputName3">password</label>
                        <input type="text" class="form-control" id="exampleInputName3" name="password">
                    </div>

                    <div class="form-group">
                        <label for="exampleInput2">telephone</label>
                        <input type="text" class="form-control" id="exampleInput2" name="telephone" >
                    </div>
                    <button type="submit" class="btn btn-default">query</button>
                </form>
            </div>
            <div style="float: right; margin: 5px;">
                <a class="btn btn-primary" href="${pageContext.request.contextPath }/pages/admin/resources/jsp/admin_adduser.jsp">add user</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath }/pages/admin/resources/jsp/admin_deleteuser.jsp">delete user</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath }/pages/admin/resources/jsp/admin_changeuser.jsp">change user</a>
            </div>


            <table border="1" class="table table-bordered table-hover">

            <thead>
            <% if (request.getAttribute("userList") != null) { %>
            <% List<User> userList = (List<User>) request.getAttribute("userList"); %>
            <% for (User user : userList) { %>
            <tr>
                <td><%= user.getUsername() %></td>
                <td><%= user.getPassword() %></td>
                <td><%= user.getAddress() %></td>
                <td><%= user.getTelephone() %></td>
                <td><%= user.getAdminName() %></td>
                <td><%= user.getOperation() %></td>
            </tr>
            <% } %>
            <% } %>
                    <%
                        while (rs.next()) {
                    %>
                    <tr>
                        <th> <%
                            out.print(rs.getString(1));
                        %>  </th>
                        <th> <%
                            out.print(rs.getString(2));
                        %>  </th>
                        <th> <%
                            out.print(rs.getString(3));
                        %>  </th>
                        <th> <%
                            out.print(rs.getString(4));
                        %>  </th>
                        <th> <%
                            out.print(rs.getString(5));
                        %>  </th>
                        <th> <%
                            out.print(rs.getString(6));
                        %>  </th>
                    </tr>

                    </thead>
                    <%
                        }
                    %>
                </table>
            <% if (request.getAttribute("totalPages") != null && request.getAttribute("currentPage") != null) { %>
            <% int totalPages = (int) request.getAttribute("totalPages"); %>
            <% int currentPage = (int) request.getAttribute("currentPage"); %>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <% if (currentPage > 1) { %>
                    <li class="page-item">
                        <a class="page-link" href="/FYP1_war_exploded/UserPaginationServlet?currentPage=<%= currentPage - 1 %>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <% } %>
                    <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= i == currentPage ? "active" : "" %>">
                        <a class="page-link" href="/FYP1_war_exploded/UserPaginationServlet?currentPage=<%= i %>"><%= i %></a>
                    </li>
                    <% } %>
                    <% if (currentPage < totalPages) { %>
                    <li class="page-item">
                        <a class="page-link" href="/FYP1_war_exploded/UserPaginationServlet?currentPage=<%= currentPage + 1 %>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <% } %>
                </ul>
            </nav>
            <% } %>
            </div>

        <div style="position: fixed; bottom: 0; right: 0;">
            <img src="../images/SETU_LOGO.png" alt="SETU Logo">
        </div>
        </div>
    </div>
</div>



    </div>
</div>
</div>

<!
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</body>
</html>

