<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/fonts/iconic/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/util.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/main.css">
    
    <!-- title icon/logo  -->
    <link rel="icon" href="../img/Logo W.png" type="image/x-icon">
</head>
<body>
    <div class="limiter">
        <div class="container-login100" style="background-image: url('../login-bg.jpg'); background-position: center; background-repeat: no-repeat; background-size: 100% 100%; position: relative; background-attachment:fixed;">
            <div class="wrap-login100">
                <form method="POST" action="../../customerLoginServlet" class="login100-form">
                    <span class="login100-form-title p-b-30">
                        <img src="../../Login/assets/images/Full Logo.png" alt="wawasan LOGO" width="280" height="80"/>
                        <br>
                        <h4>Customer Login</h4>
                    </span>
                    
                    <div class="wrap-input100 validate-input">
                        <input class="input100" type="text" name="cust_phone">
                        <span class="focus-input100" data-placeholder="Phone Number"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <span class="btn-show-pass">
                                <i class="zmdi zmdi-eye"></i>
                        </span>
                        <input class="input100" type="password" name="cust_password">
                        <span class="focus-input100" data-placeholder="Password"></span>
                    </div>
                    
                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button name="login" class="login100-form-btn">Login</button>
                        </div>
                    </div>
                </form>
                <a href="../../Main Page/index.jsp">
                    <center>
                        <button class="btn" style="color: white;">Home</button>
                    </center>
                </a>
            </div>
        </div>
    </div>
    
    <script src="../assets/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="../assets/vendor/animsition/js/animsition.min.js"></script>
    <script src="../assets/vendor/bootstrap/js/popper.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="../assets/js/main.js"></script>
</body>
</html>
