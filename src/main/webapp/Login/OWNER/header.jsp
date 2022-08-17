<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:setDataSource var="myDatasource" 
                   driver="com.mysql.cj.jdbc.Driver" 
                   url="jdbc:mysql://us-cdbr-east-06.cleardb.net:3306/heroku_57a4cabf532a6ad" 
                   user="b1a4e6cdd59317" 
                   password="f6d28928"
                   />

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Repair Tracking System(Wawasan)</title>
        <!-- title icon/logo  -->
        <link rel="icon" href="${pageContext.request.contextPath}/Login/img/Logo W.png" type="image/x-icon">

        <!--Meta Content-->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <!-- Custom fonts for this template-->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        
        <!--Font Awesome-->
        <script src="https://kit.fontawesome.com/5792396d29.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
        
        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/Login/css/sb-admin-2.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/Login/css/Custom.css" rel="stylesheet" type="text/css"/>
        
        
        <script src="${pageContext.request.contextPath}/Login/js/sb-admin-2.js" type="text/javascript"></script>
        
        <!-- Custom styles for this page -->
        <link href="${pageContext.request.contextPath}/Login/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

        <!--SWEETALERT-->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        
        <style>
            .bg-blue1{
                background-color: #ffe45e;
            }

            .bg-blue2{
                background-color: #2ECBE9;
            }

            .bg-blue3{
                background-color: #128FC8;
            }

            .bg-blue4{
                background-color: #00468B;
            }
            .text-bold{
                color: black;
                font-size: 18px;
            }
            svg{
               filter: invert(0%) sepia(0%) saturate(0%) hue-rotate(0deg) brightness(0%) contrast(0%);
            }
            
            textarea {
                resize: none;
                height: 350px;
            }
            
            input[type="checkbox"]{
                width: 20px;
                height: 20px;
                text-align: center;
                margin: auto;
            }
            
            .center-block {
                margin: 0 auto;
                float: none;
            }
              
            .jarakInput{
                padding-bottom: 20px;
            }
              
            .bigger{
                width: 800px;
            }
            .btn-static {
                background-color: white;
                border: 1px solid lightgrey;
                cursor: default;
              }
            .btn-static:active {
              -moz-box-shadow:    inset 0 0 0px white;
              -webkit-box-shadow: inset 0 0 0px white;
              box-shadow:         inset 0 0 0px white;
            }

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
            .modal-footer{
                justify-content: space-evenly;
            }
            
            .custom-tooltip {
                --bs-tooltip-bg: var(--bs-primary);
            }
            
        </style>
        
        <script>
            function numberOnly(input){
                var regex = /[^0-9]/g;
                input.value = input.value.replace(regex, "");
            }
            
            function fullnameOnly(input){
                var regex = /[^a-zA-Z@ ]/g;
                input.value = input.value.replace(regex, "");
            }
            
            function bothOnly(input){
                var regex = /[^a-zA-Z@0-9 ]/g;
                input.value = input.value.replace(regex, "");
            }
            
            function letterOnly(input){
                var regex = /[^a-zA-Z@]/g;
                input.value = input.value.replace(regex, "");
            }
            
            function change(){
                alert('123');
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
    <ul class="navbar-nav bg-gradient-main sidebar sidebar-dark accordion" id="accordionSidebar" >

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center">
            <div class="sidebar-brand-icon">
                <img id="logoSingle" style="height:180%; width:80%; margin-top:80%; margin-bottom:30p;" src="${pageContext.request.contextPath}/Login/assets/images/Full Logo.png" alt="Full">
            </div>
        </a>
            
        <hr class="sidebar-divider" style="margin-top:45%;">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="dashboard.jsp">
                <i class="fas fa-fw fa-home"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <hr class="sidebar-divider">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseData" aria-expanded="true" aria-controls="collapseData">
                <i class="fas fa-fw fa-list"></i>
                <span>List of Data</span>
            </a>
          <div id="collapseData" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item bg-blue1 my-2" href="repairList.jsp">Repair Job</a>
                <a class="collapse-item bg-blue2 my-2" href="partsList.jsp">Item Parts</a>
                <a class="collapse-item bg-blue3 text-white my-2" href="serviceList.jsp">Services</a>
                <a class="collapse-item bg-blue3 text-white my-2" href="deviceList.jsp">Devices</a>
                <a class="collapse-item bg-blue4 text-white my-2" href="technicianList.jsp">Technicians</a>
            </div>
          </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
          <a class="nav-link" href="assign-technician.jsp">
            <i class="fa-solid fa-people-arrows"></i>
            <span> Assign Technician </span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">
        
        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#checkWarranty" style="color: black;">
            <i class="fa-solid fa-screwdriver-wrench"></i>
            <span> Check Warranty </span>
          </a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0"  id="sidebarToggle"></button>
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
                <h1 class="h3 mb-2 text-gray-800">Repair Tracking System (Wawasan)</h1>

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
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"> ${staff.fullname} </span>
                            <i id="grey" class="fas fa-user"></i>
                        </a>
                            
                      <!-- Dropdown - User Information -->
                      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                        <form action="${pageContext.request.contextPath}/Login/OWNER/myProfile.jsp" method="POST">
                            <button type="submit" class="dropdown-item" > <i id="grey" class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> My Profile </button>
                        </form>
                            
                        <form action="${pageContext.request.contextPath}/logoutServlet" method="POST">
                            <button type="submit" class="dropdown-item text-danger" > <i id="red" class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-400"></i> Logout </button>
                        </form>
                      </div>
                    </li>
                </ul>

            </nav>

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
                            <a class="btn btn-success" href="${pageContext.request.contextPath}/logoutServlet">Logout</a>
                        </div>
                    </div>
                </div>
            </div>

<!-- Parts Modal-->
            <div class="modal fade" id="partsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content bigger">
                        <div class="modal-header bigger">
                            <h5 class="modal-title" id="exampleModalLabel">Register Parts Stock</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <form action="${pageContext.request.contextPath}/RegisterParts" class="bigger" method="post">
                            <div class="modal-body m-3">
                                
                                <label>Device Support</label>
                                <div class="row">
                                    <div class="col m-2">
                                        <input class="form-control" type="checkbox" name="check" value="Smartphone" >
                                    </div>
                                    
                                    <div class="col m-2">
                                        <input class="form-control" type="checkbox" name="check" value="Laptop" >
                                    </div>
                                    
                                    <div class="col m-2">
                                        <input class="form-control" type="checkbox" name="check" value="PC" >
                                    </div>
                                    
                                    <div class="col m-2">
                                        <input class="form-control" type="checkbox" name="check" value="Tablet" >
                                    </div>
                                    
                                    <div class="col m-2">
                                        <input class="form-control " type="checkbox" name="check" value="Printer" >
                                    </div>
                                    
                                    <div class="col m-2">
                                        <input class="form-control" type="checkbox" name="check" value="Etc" >
                                    </div>
                                </div>
                                
                                <div class="row mb-3">
                                    <span class="col text-center text-bold">Smartphone</span>
                                    <span class="col text-center text-bold">Laptop</span>
                                    <span class="col text-center text-bold">PC</span>
                                    <span class="col text-center text-bold">Tablet</span>
                                    <span class="col text-center text-bold">Printer</span>
                                    <span class="col text-center text-bold">Etc</span>
                                </div>
                                
                                <hr class="sidebar-divider">

                                <div class="row m-4">
                                    <div class="col">
                                        <label>Name</label>
                                        <input class="form-control" type="text" maxlength="30" onkeyup="bothOnly(this)" placeholder="Name" name="name" required>
                                    </div>
                                    
                                    <div class="col">
                                        <label>Select a set for the parts</label>
                                        <select class="form-control" name="part_set" id="id" required>
                                            <option value="Original">Original</option>
                                            <option value="Local">Local</option>
                                            <option value="Refurbished">Refurbished</option>
                                            <option value="China">China</option>
                                            <option value="OEM">OEM</option>
                                            <option value="Copy Ori">Copy Ori</option>
                                            <option value="Copy Ori">Second Hand</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row m-4">
                                    <div class="col">
                                        <label>Brand</label>
                                        <input class="form-control" type="text" maxlength="30" onkeyup="bothOnly(this)" placeholder="Brand" name="brand" required>
                                    </div>
                                    
                                    <div class="col">
                                        <label>Model / (year published)</label>
                                        <input class="form-control" type="text" placeholder="Model" maxlength="30" onkeyup="bothOnly(this)" name="model" required>
                                    </div>
                                </div>
                                
                                <div class="row m-4">
                                    <div class="col">
                                        <label>Buy cost</label>
                                        <input class="form-control" type="number" placeholder="Buy cost" onkeyup="numberOnly(this)" name="buy_cost" min="0" max="1000000" required>
                                    </div>
                                    <div class="col">
                                        <label>Sell cost</label>
                                        <input class="form-control" type="number" placeholder="Sell cost" onkeyup="numberOnly(this)" name="sell_cost" min="0" max="1000000" required>
                                    </div>
                                </div>
                                
                                <div class="row m-4">
                                    <div class="col">
                                        <label><a> Quantity</a></label><br>
                                        <input class="form-control" type="number" placeholder="Quantity" onkeyup="numberOnly(this)" name="quantity" min="0" max="1000000" required>
                                    </div>
                                    
                                    <div class="col">
                                        <label><a> Warranty period (Month)</a></label><br>
                                        <input class="form-control" type="number" onkeyup="numberOnly(this)" placeholder="Warranty" name="warranty_period" min="0" max="50" required>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button class="btn btn-info" type="Submit"> Register Parts </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

<!-- Service Modal-->
            <div class="modal fade" id="serviceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New Services</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>

                        <form class="m-3" method="POST" action="${pageContext.request.contextPath}/RegisterServices">
                            <div class="modal-body">
                                <div class="jarakInput mb-3">
                                    <label>Title</label>
                                    <input type="text" class="form-control" placeholder="Title" name="title" max="40" required>
                                </div>


                                <div class="jarakInput mb-3">
                                    <label>Description</label>
                                    <textarea class="form-control" style="height: 240px;"  placeholder="Description" name="description" maxlength="500" required></textarea>
                                </div>


                                <div class="jarakInput">
                                    <label>Price</label>
                                    <input type="number" class="form-control" placeholder="Price" name="price" required>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button class="btn btn-info" type="Submit"> Register Services </button>
                            </div>
                          </form>
                    </div>
                </div>
            </div>
            
<!-- Device Modal-->
            <div class="modal fade" id="deviceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Insert New Device</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>

                        <form method="POST" action="${pageContext.request.contextPath}/registerDeviceServlet">
                            <div class="modal-body">
                                <label>Type</label>
                                
                                <div class="row ml-2">
                                    <span class="col-4 text-bold text-center">Smartphone</span>
                                    <span class="col-4 text-bold text-center">Laptop</span>
                                    <span class="col-4 text-bold text-center">PC</span>
                                </div>
                                <div class="row ml-2">
                                    <div class="col-4 text-center">
                                        <input type="radio" name="type" value="Smartphone" id="Smartphone">
                                    </div>
                                    <div class="col-4 text-center">
                                        <input type="radio" name="type" value="Laptop" id="Laptop">
                                    </div>
                                    <div class="col-4 text-center">
                                        <input type="radio" name="type" value="PC" id="PC">
                                    </div>
                                </div>
                                
                                
                                <div class="row ml-2 mt-3">
                                    <span class="col-4 text-bold text-center">Printer</span>
                                    <span class="col-4 text-bold text-center">Tablet</span>
                                    <span class="col-4 text-bold text-center">etc</span>
                                </div>
                                <div class="row ml-2">
                                    <div class="col-4 text-center">
                                        <input type="radio" name="type" value="Printer" id="Printer">
                                    </div>
                                    <div class="col-4 text-center">
                                        <input type="radio" name="type" value="Tablet" id="Tablet">
                                    </div>
                                    <div class="col-4 text-center">
                                        <input type="radio" name="type" value="etc" id="etc">
                                    </div>
                                </div>
                                <hr class="sidebar-divider">


                                <div class="jarakInput mb-3">
                                    <label>Name</label>
                                    <input type="text" class="form-control" placeholder="Name" name="name" maxlength="30" required>
                                </div>

                                <div class="jarakInput mb-3">
                                    <label>Brand</label>
                                    <input type="text" class="form-control" placeholder="Brand" name="brand" maxlength="30" required>
                                </div>
                                
                                <div class="jarakInput">
                                    <label>Model</label>
                                    <input type="text" class="form-control" placeholder="Model" name="model" maxlength="30" required>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button class="btn btn-info" type="Submit"> Register Device </button>
                            </div>
                          </form>
                    </div>
                </div>
            </div>
                            
<!-- Check Warranty-->
        <div class="modal fade" id="checkWarranty" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Check Customer Order Warranty</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>

                    <form action="${pageContext.request.contextPath}/CheckWarrantyOwner" method="POST">
                        <div class="modal-body">
                            <label>Parts Id:</label>
                            <div class="row ml-2">
                                <input class="form-control col-9 mr-3" type="text" onkeyup="numberOnly(this);" name="used_part_id" required>
                                <input class="btn btn-warning col mr-3" type="submit"  value="Check" name="submit">
                            </div>
                            
                        </div>

                    </form>
                </div>
            </div>
        </div>

<!-- Technician Register Modal-->
            <div class="modal fade" id="technicianModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Register Technician Form</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                    
                        <form class="m-3" method="POST" action="${pageContext.request.contextPath}/RegisterTechnician">
                            <div class="card-header py-3" style="text-align:center;">
                                    <h3>Technician Information</h3>
                                </div>
                            <div class="jarakInput mb-4">
                                <label for="uname"><a class="h5 text-dark"> Fullname:</a></label><br>
                                <input class="form-control" maxlength="40" type="text" pattern="^[a-zA-Z ]*$" placeholder="Fullname" name="fullname" required>
                            </div>

                            <div class="row mb-4">
                                <div class="col">
                                    <label for="phone"><a class="h5 text-dark"> Phone Number: </a></label><br>
                                    <input class="form-control" type="text" maxlength="11" placeholder="01xxxxxxxx (no dashes)" name="phone" pattern="^(01)[0-46-9]*[0-9]{8,9}$" required>
                                </div>

                                <div class="col">
                                    <label for="email"><a class="h5 text-dark"> Email:</a></label><br>
                                    <input  class="form-control" maxlength="30" type="email" placeholder="xxxx@xxxx.com" name="email" required>
                                </div>
                            </div>

                            <div class="jarakInput m-2">
                                <div class="card-header py-3" style="text-align:center;">
                                    <h3>Address Information</h3>
                                </div>
                                <input class="form-control mt-4 my-2" type="text" maxlength="30" placeholder="Address Line 1" name="line1" required>
                                <input class="form-control " type="text" maxlength="30" placeholder="Address Line 2" name="line2" required>
                            </div>

                            <div class="row m-2">
                                <input class="form-control mr-2 col-5" type="text" maxlength="5" placeholder="Postcode" name="postcode" required>
                                <input class="form-control col-5" type="text" maxlength="20" placeholder="City" name="cust_password" required>
                            </div>

                            <div class="row m-2">
                                <input class="form-control mr-2 col-5" type="text" maxlength="20" placeholder="State" name="state" required>
                                <input class="form-control col-5" type="text" placeholder="Country" value="Malaysia" name="country" readonly>
                            </div>

                            <div class="modal-footer">
                                <button class="btn btn-info" type="Submit"> Register Technician </button>
                            </div>
                        </form>
                    </div>
              </div>
            </div>
        
    <!-- End of Topbar -->