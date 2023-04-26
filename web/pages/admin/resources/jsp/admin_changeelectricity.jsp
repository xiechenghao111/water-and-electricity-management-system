<%--
  Created by IntelliJ IDEA.
  User: 35389
  Date: 2/7/2023
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>change the water</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl7/1L_dstPt3HV5HzF6Gvk/e3E9KEUe3m+MsmYm/p" crossorigin="anonymous">

  <link rel="stylesheet" href="../css/adduser.css">
  <!-- Bootstrap JavaScript和Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.12.7/dist/umd/popper.min.js" integrity="sha384-ug7mV7Ee1m4M7l4op1mFqZzisceEg4Dl40gmS/NlWl7U7G2Z4z4grV6Tva0e0zhV" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-MqFTgv3+n8pwp4w7t4zj1q3JhoYdfFhxXbfflwlM/rsI1DQzv6H2Rw2C7WoHpEEg" crossorigin="anonymous"></script>
  <script src="../js/change_pwd.js"></script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-6 mx-auto">
      <div class="form-container">
        <form action="/FYP1_war_exploded/ChangeElectricityServlet" method="post" id="myform">
          <h2>change the electricity</h2>
          <div class="form-group">
            <label for="ID">ID：</label>
            <input type="text" name="ID" id="ID" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="username">username：</label>
            <input type="text" name="username" id="username" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="telephone">telephone</label>
            <input type="text" name="telephone" id="telephone" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="add_time">add_time：</label>
            <input type="text" name="add_time" id="add_time" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="consumption">consumption：</label>
            <input type="text" name="consumption" id="consumption" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="amount_price">amount_price：</label>
            <input type="text" name="amount_price" id="amount_price" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="unit_price">unit_price：</label>
            <input type="text" name="unit_price" id="unit_price" class="form-control" required>
          </div>
          <div class="form-group">
            <label for="stage">stage：</label>
            <input type="text" name="stage" id="stage" class="form-control" required>
          </div>

          <div class="form-group">
            <input type="submit" value="submit" id="submit" class="btn btn-custom">
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>