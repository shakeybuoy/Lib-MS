<?php
session_start();
error_reporting(0);
include('includes/config.php');
if ($_SESSION['login'] != '') {
    $_SESSION['login'] = '';
}
if (isset($_POST['login'])) {
    $email = $_POST['emailid'];
    $password = md5($_POST['password']);
    $sql = "SELECT EmailId,Password,StudentId,Status FROM tblstudents WHERE EmailId=:email and Password=:password";
    $query = $dbh->prepare($sql);
    $query->bindParam(':email', $email, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);

    if ($query->rowCount() > 0) {
        foreach ($results as $result) {
            $_SESSION['stdid'] = $result->StudentId;
            if ($result->Status == 1) {
                $_SESSION['login'] = $_POST['emailid'];
                echo "<script type='text/javascript'> document.location ='dashboard.php'; </script>";
            } else {
                echo "<script>alert('Your Account Has been blocked .Please contact admin');</script>";
            }
        }
    } else {
        echo "<script>alert('Invalid Details');</script>";
    }
}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Library Management System</title>
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
                            <h3 style="font-size:35px; color:#000; ">User Login</h3>
                        </div>
                        <div style="padding:30px; text-align:left;" class="panel-body">
                            <form role="form" method="post">

                                <div class="form-group">
                                    <label>Email Address</label>
                                    <input class="form-control" type="text" name="emailid" required
                                        autocomplete="off" />
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="form-control" type="password" name="password" required
                                        autocomplete="off" />
                                </div>
                                <div style="margin-top:20px; text-align:center;">
                                    <button style="margin-top: 10px;" type="submit" name="login"
                                        class="btn btn-info">LOGIN
                                    </button>

                                    <h5 style="margin-top: 20px; " class="help-block"><a href="user-forgot-password.php"
                                            style="color: green;">Forgot Password</a> | <a style="color: red;"
                                            href="signup.php">Not
                                            Register Yet?</a> </h5>
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

</body>

</html>