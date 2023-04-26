<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete the user</title>
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
                <form action="/FYP1_war_exploded/DeleteUserServlet" method="post" id="myform">
                    <h2>Delete the user</h2>
                    <div class="form-group">
                        <label for="username">username:</label>
                        <input type="text" name="username" id="username" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" name="password" id="password" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" name="address" id="address" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="telephone">Telephone:</label>
                        <input type="text" name="telephone" id="telephone" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="admin_name">admin_name：</label>
                        <input type="text" name="admin_name" id="admin_name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="operation">operation：</label>
                        <input type="text" name="operation" id="operation" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Submit" id="submit" class="btn btn-custom">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>