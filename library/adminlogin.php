<?php
session_start();
error_reporting(0);
include('includes/config.php');
if ($_SESSION['alogin'] != '') {
    $_SESSION['alogin'] = '';
}
if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $sql = "SELECT UserName,Password FROM admin WHERE UserName=:username and Password=:password";
    $query = $dbh->prepare($sql);
    $query->bindParam(':username', $username, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);
    $_SESSION['alogin'] = $_POST['username'];
    echo "<script type='text/javascript'> document.location ='admin/dashboard.php'; </script>";
}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Admin Login</title>
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>

<body>
    <?php include('includes/header.php'); ?>

    <div class="content-wrapper">
        <div class="container">
            <br>

            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                    <div class="panel panel-info">
                        <div class="panel-heading" style="border-bottom: 5px solid black">
                            <h3 style="font-size:35px; color:#000; ">Admin Login</h3>
                        </div>
                        <div style="padding:30px; text-align:left;" class="panel-body">
                            <form role="form" method="post">

                                <div class="form-group">
                                    <label>Username</label>
                                    <input class="form-control" type="text" name="username" autocomplete="off"
                                        required />
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="form-control" type="password" name="password" autocomplete="off"
                                        required />
                                </div>
                                <div style="margin-top:20px; text-align:center;">
                                    <button type="submit" style="margin-top: 10px;" name="login"
                                        class="btn btn-primary">Login </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <?php include('includes/footer.php'); ?>

    <script src="assets/js/jquery-1.10.2.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/custom.js"></script>
    </script>
</body>

</html>