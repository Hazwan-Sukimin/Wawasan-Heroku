<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Login/assets/fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Login/assets/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Login/assets/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Login/assets/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Login/assets/css/util.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Login/assets/css/main.css">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&family=Roboto:wght@100&display=swap');
            .poppin-font{
                font-family: font-family: 'Roboto', sans-serif;
            }

            body{
                font-family: font-family: 'Roboto', sans-serif;
            }
            
            .overlay{
                display: none;
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                z-index: 999;
                background: rgba(255,255,255,0.8) url("${pageContext.request.contextPath}/assets/loader/loader_spin.gif") center no-repeat;
            }
            
        </style>

        <!--BOOSTRAP CSS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!--BOOSTRAP JS-->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>

        <!--SWEETALERT-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- title icon/logo  -->
        <link rel="icon" href="${pageContext.request.contextPath}/Login/img/Logo W.png" type="image/x-icon">
    </head>

    <body>
        <div class="overlay"></div>
        
        <div class="limiter">
            <div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/Login/img/login-bg.jpg'); background-position: center; background-repeat: no-repeat; background-size: 100% 100%; position: relative; background-attachment:fixed;">
                <div class="wrap-login100">

                    <!--STAFF LOGIN SERVLET-->
                    <form method="POST" action="${pageContext.request.contextPath}/loginServlet" class="login100-form">
                        <span class="login100-form-title p-b-30">
                            <a href="${pageContext.request.contextPath}/Land Mock 1/index.jsp">
                                <img src="${pageContext.request.contextPath}/Login/assets/images/Full Logo.png" alt="wawasan LOGO" width="280" height="80"/>
                            </a>
                            <br>
                            <hr class="sidebar-divider">

                            <div class="d-flex flex-row justify-content-center poppin-font">
                                <div class="form-check p-2 h6">
                                    <input class="form-check-input m-0" type="radio" name="radioLogin" value="customer" id="radio1" checked>
                                    <label class="form-check-label" id="radio1" for="radio1">Customer</label>
                                </div>

                                <div class="vr"></div>

                                <div class="form-check p-2 h6">
                                    <input class="form-check-input m-0" type="radio" name="radioLogin" value="staff" id="radio2">
                                    <label class="form-check-label" for="radio2">Staff</label>
                                </div>
                            </div>
                        </span>

                        <c:if test="${errorMsgs != null}" >

                            <c:if test="${errorMsgs.equals('customer')}" >
                                <script>
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Failed to Login',
                                        text: 'phone number and password not found!',
                                      });
                                </script>
                            </c:if>

                            <c:if test="${errorMsgs.equals('staff')}" >
                                <script>
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Failed to Login',
                                        text: 'staff id and password not found!',
                                      });
                                </script>
                            </c:if>
                        </c:if>

                        <div class="row">
                            <div class="wrap-input100 validate-input">
                                <input class="input100" id="first_input" type="text" name="first_input" value="${firstInput}" onkeyup="numberOnly(this)" maxlength="11" required>
                                <span class="focus-input100" data-placeholder="Phone number" id="staff_id"></span>
                            </div>

                            <div class="wrap-input100 validate-input" data-validate="Enter password">
                                <span class="btn-show-pass">
                                    <i class="zmdi zmdi-eye"></i>
                                </span>

                                <input class="input100" type="password" name="password" value="${password}" required>
                                <span class="focus-input100" data-placeholder="Password"></span>
                            </div>

                            <div class="validate-input text-end">
                                <a href="${pageContext.request.contextPath}/Login/maintenance.jsp">Forgot password ?</a>
                            </div>

                            <div class="container-login100-form-btn mb-5">
                                <div class="wrap-login100-form-btn">
                                    <div class="login100-form-bgbtn"></div>
                                    <button name="login" class="login100-form-btn" id="login-button">Login</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // Script that manipulate input first input field
            $(document).ready(function(){
                $("#radio1").click(function(){
                    var input1 = document.getElementById('first_input').value;
                    $("#staff_id").attr("data-placeholder","Phone number");
                    $("#first_input").attr("maxlength","11");
                    
                    //reset the input
                    if (input1) {
                        input1 = input1.substring(0,11);
                        document.getElementById('first_input').value = input1;
                    } 
                    
                });
                
                $("#radio2").click(function(){
                    var input1 = document.getElementById('first_input').value;
                    $("#staff_id").attr("data-placeholder","Staff ID");
                    $("#first_input").attr("maxlength","5");
                    
                    //reset the input
                    if (input1) {
                        input1 = input1.substring(0,5);
                        document.getElementById('first_input').value = input1;
                    }
                });
            });
            
            function numberOnly(input){
                var regex = /[^0-9]/g;
                input.value = input.value.replace(regex, "");
            }
        </script>
        
        <script src="${pageContext.request.contextPath}/Login/assets/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/Login/assets/vendor/animsition/js/animsition.min.js"></script>
        <script src="${pageContext.request.contextPath}/Login/assets/vendor/bootstrap/js/popper.js"></script>
        <script src="${pageContext.request.contextPath}/Login/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/Login/assets/js/main.js"></script>
    </body>
</html>
