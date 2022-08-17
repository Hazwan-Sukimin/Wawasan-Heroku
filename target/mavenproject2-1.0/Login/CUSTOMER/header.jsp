<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="myDatasource" 
                   driver="com.mysql.cj.jdbc.Driver" 
                   url="jdbc:mysql://us-cdbr-east-06.cleardb.net:3306/heroku_57a4cabf532a6ad" 
                   user="b1a4e6cdd59317" 
                   password="f6d28928"
                   />
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Repair Tracking System (Wawasan)</title>

        <!--import Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
        <script src="https://kit.fontawesome.com/5792396d29.js" crossorigin="anonymous"></script>

        <!--import Nunito Font-->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <!-- title icon/logo  -->
        <link rel="icon" href="../img/Logo W.png" type="image/x-icon">
        
        <!--SWEETALERT-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <style>
            background-color:
            svg{
                filter:  brightness(0) invert(1);
            }
            .svg-white{
                filter:  brightness(0) invert(1);
            }
            #red{
                filter:  invert(0%) sepia(0%) saturate(0%) hue-rotate(0deg) brightness(118%) contrast(0%);
            }
            #grey{
                filter:  invert(0%) sepia(0%) saturate(0%) hue-rotate(0deg) brightness(118%) contrast(0%);
            }

            .form-check-input{
                width: 20px;
                height: 20px;
            }
        </style>
        
        <script>
            function numberOnly(input){
                var regex = /[^0-9]/g;
                input.value = input.value.replace(regex, "");
            }
            
            function addressOnly(input){
                var regex = /[^a-zA-Z@0-9 ,-]/g;
                input.value = input.value.replace(regex, "");
            }
            
            function letterOnly(input){
                var regex = /[^a-zA-Z@]/g;
                var regexSpace = /[ ]{2}/g;
                input.value = input.value.replace(regex, "");
                input.value = input.value.replace(regexSpace, "");
            }
            
            $(function() {
                $('#sidebarToggle').click(function(){
                    if ($('#logoSingle').attr("alt") !== 'Single') {
                        $('#logoSingle').attr("src", "${pageContext.request.contextPath}/Login/assets/images/Logo W.png");
                        $('#logoSingle').attr("alt", "Single");
                    } else {
                        $('#logoSingle').attr("src", "${pageContext.request.contextPath}/Login/assets/images/Full Logo.png");
                        $('#logoSingle').attr("alt", "Full");
                    }
                });
            });
        </script>
    </head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-main sidebar sidebar-dark text-dark accordion" id="accordionSidebar" >

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="booking_list.php">
                <div class="sidebar-brand-icon">
                    <img id="logoSingle" style="height:180%; width:80%; margin-top:80%; margin-bottom:30p;" src="../assets/images/Full Logo.png" alt="Full">
                </div>
            </a>

            <hr class="sidebar-divider" style="margin-top:45%;">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="dashboard.jsp">
                    <i class="fas fa-fw fa-home"></i>
                    <span> Dashboard </span>
                </a>
            </li>

            <hr class="sidebar-divider">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
              <a class="nav-link" href="repairJob_list.jsp">
                  <i class="fas fa-fw fa-list"></i>
                  <span>Repair History</span></a>
            </li>
            
            <hr class="sidebar-divider">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="checkWarranty.jsp">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <span> Check Warranty</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            
            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="payment.jsp">
                    <i class="fas fa-truck"></i>
                    <span>Make Payment</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <!-- <h1 class="h3 mb-2 text-gray-800">Faculty of Sport Science and Recreation</h1> -->
                <h1 class="h3 mb-2 text-gray-800">Repair Tracking System</h1>

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${customer.fullname} </span>
                            <i id="grey" class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        </a>

                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <form action="${pageContext.request.contextPath}/Login/CUSTOMER/myProfile.jsp" method="POST">
                                <button type="submit" class="dropdown-item" > <i id="grey" class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> My Profile </button>
                            </form>

                            <form action="${pageContext.request.contextPath}/logoutServlet" method="POST">
                                <button type="submit" class="dropdown-item text-danger" > <i id="red" class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-400"></i> Logout </button>
                            </form>
                        </div>
                    </li>
                </ul>
            </nav>
                            <sql:query var="statusInformation" dataSource="${myDatasource}">
                                SELECT * FROM repair_status
                            </sql:query>                            
<!-- Logout Modal-->
            <div class="modal fade" id="Instruction" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Instruction</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        
                        <div class="modal-body">
                            <c:forEach var="row" items="${statusInformation.rows}">
                                <div class='row border-bottom'>
                                    <div class='col-6 text-right'>
                                        <p><b>${row['title']}</b></p>
                                    </div>
                                    
                                    <div class='col-6'>
                                        <p>${row['description']}</p>
                                    </div>
                                    
                                </div>
                                
                            </c:forEach>
                        </div>
                        
                        <div class="modal-footer">
                            <p class='text-black'>Tick checkbox with order status is <b class='text-success'>'FINISHED'</b> to pay the devices</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Logout Modal-->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        
                        <div class="modal-body">Click logout below to successfully logout.</div>
                        
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <a class="btn btn-success" href="../../logoutServlet">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        <!-- CONTINUE Content -->
    <!--continue untill footer-->