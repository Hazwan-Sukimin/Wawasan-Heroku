<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="myDatasource" 
                   driver="com.mysql.cj.jdbc.Driver" 
                   url="jdbc:mysql://us-cdbr-east-06.cleardb.net:3306/heroku_57a4cabf532a6ad" 
                   user="b1a4e6cdd59317" 
                   password="f6d28928"
                   />

<head>
    <title>Wawasan (Technician)</title>

    <!-- title icon/logo  -->
    <link rel="icon" href="../img/Logo W.png" type="image/x-icon">

    <!--Meta Content-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!--Font-->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!--Logo and symbol-->
    <script src="https://kit.fontawesome.com/5792396d29.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/Login/css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/Login/css/Custom.css" rel="stylesheet" type="text/css"/>

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
        
        textarea {
            resize: none;
            height: 350px;
        }
        .btn-static:hover {
            color: white;
          }
    </style>
    
    <script>
        function numberOnly(input){
            var regex = /[^0-9]/g;
            input.value = input.value.replace(regex, "");
        }

        function letterOnly(input){
            var regex = /[^a-zA-Z@]/g;
            input.value = input.value.replace(regex, "");
        }
        
        function fullnameOnly(input){
            var regex = /[^a-zA-Z@ ]/g;
            input.value = input.value.replace(regex, "");
        }
        
        function emailOnly(input){
            var regex = /[^a-zA-Z-0-9@._ ]/g;
            input.value = input.value.replace(regex, "");
        }
        
        function bothOnly(input){
            var regex = /[^a-zA-Z-0-9 ,]/g;
            input.value = input.value.replace(regex, "");
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
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="booking_list.php">
            <div class="sidebar-brand-icon">
                <img style="height:180%; width:80%; margin-top:80%; margin-bottom:30p;" src="${pageContext.request.contextPath}/Login/img/Full Logo.png" id='logoSingle' alt="Full">
            </div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider" style="margin-top:45%;">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="dashboard.jsp">
                <i class="fas fa-fw fa-home"></i>
                <span class="">Dashboard</span>
            </a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser" aria-expanded="true" aria-controls="collapseUser">
                <i class="fas fa-fw fa-list"></i>
                <span>Repair Job List</span>
            </a>
            <div id="collapseUser" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item bg-blue1 my-2" href="myRepairJob.jsp">Repair Order List</a>
                    <a class="collapse-item bg-blue2 my-2" href="partsList.jsp">Spare Parts List</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
          <a class="nav-link" href="custReg.jsp">
          <i class="fas fa-fw fa-user"></i>
          <span> Register New Customer </span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">
      
        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#checkWarrantyModal" style="color: black;">
          <i class="fa-solid fa-screwdriver-wrench"></i>
          <span> Check Warranty </span></a>
        </li>

      <!-- Divider -->
      <hr class="sidebar-divider">


      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" onclick='changeImage(img);' id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content" class="bg-main">
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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                    ${staff.getFullname()}
                </span>
                <i class="fas fa-user"></i>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <form action="${pageContext.request.contextPath}/Login/TECHNICIAN/myProfile.jsp" method="POST">
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
                        <a class="btn btn-success" href="../../logoutServlet">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        
        <sql:query var="services" dataSource="${myDatasource}">
            SELECT * FROM services
        </sql:query>
            
        <sql:query var="devices" dataSource="${myDatasource}">
            SELECT * FROM device
        </sql:query>
            
        <sql:query var="parts" dataSource="${myDatasource}">
            SELECT * FROM parts
        </sql:query>
            
        <sql:query var="customer" dataSource="${myDatasource}">
            SELECT * FROM customer
        </sql:query>
            
<!-- New Repair Job Modal-->
        <div class="modal fade" id="newRepairJobModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create New Repair Job</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    
                    <form action="${pageContext.request.contextPath}/createRepairServlet" method="POST">
                        
                        <div class="modal-body">
                            <div class="card-header" style="text-align:center;">
                                <h3>Repair Form</h3>
                            </div>
                            
                            <div class="jarakInput my-3">
                                <label>Customer Phone</label>
                                
                                <input class="form-control" placeholder="Select Customer Phone number" onkeyup="numberOnly(this)" maxlength="11" name="phone" list="customer" required>
                                <datalist id="customer" name="phone">
                                    <option selected="true" disabled="disabled" value="0"> </option>
                                    <c:forEach var="row" items="${customer.rows}">
                                        <option value="${row['phone']}"> ${row['fullname']} | ${row['email']}</option>
                                    </c:forEach>
                                </datalist>
                            </div>
                            
                            <div class="jarakInput mb-3">
                                <label>Services</label>
                                <input class="form-control" placeholder="Choose a services" list="services" name="service_id" onkeyup="numberOnly(this)" maxlength="10" required>
                                <datalist id="services">
                                    <option selected="true" disabled="disabled" value="0"> </option>
                                    <c:forEach var="row" items="${services.rows}">
                                        <option value="${row['service_id']}">${row['title']} | ${row['price']}</option>
                                    </c:forEach>
                                </datalist>
                            </div>
                            
                            <div class="jarakInput row mb-3">
                                
                                <div class="col-6">
                                    <label>Devices</label>
                                    <input class="form-control" placeholder="Choose a Device" list="device" name="device_id" onkeyup="numberOnly(this)" maxlength="10" required>
                                    <datalist id="device">
                                        <option selected="true" disabled="disabled" value="0"> </option>
                                        <c:forEach var="row" items="${devices.rows}">
                                            <option value="${row['device_id']}">${row['name']}</option>
                                        </c:forEach>
                                    </datalist>
                                </div>
                                
                                <div class="col-4">
                                    <label>Spare Part Used</label>
                                    <input class="form-control" placeholder="Choose a Parts to be used" name="part_id" list="parts" onkeyup="numberOnly(this)" maxlength="10">
                                    <datalist id="parts">
                                        <option selected="true" disabled="disabled" value="0"> </option>
                                        <c:forEach var="row" items="${parts.rows}">
                                            <option value="${row['part_id']}"> ${row['name']} | ${row['model']} | ${row['brand']} <input type="hidden" name="part_id" value="${row['part_id']}"></option>
                                        </c:forEach>
                                    </datalist>
                                </div>
                                
                                <div class="col-2">
                                    <label>Quantity</label>
                                    <input type="number" placeholder="qty" min="1" class="form-control" onkeyup="numberOnly(this)" name="quantity">
                                </div>
                                
                            </div>
                            <hr class="sidebar-divider">
                            
                            <div class="card-header" style="text-align:center;">
                                <h3>Problem Issue</h3>
                            </div>
                            <div class="jarakInput mb-3">
                                <label>Information</label>
                                <input type="text" class="form-control" placeholder="Title" name="information" max="50" onkeyup="emailOnly(this)" required>
                            </div>


                            <div class="jarakInput mb-3">
                                <label>Description</label>
                                <textarea class="form-control" style="height: 240px;"  placeholder="Description" name="description" onkeyup="emailOnly(this)" maxlength="500" required></textarea>
                            </div>
                            
                            
                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-info" type="submit">Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
              
<!--Register New device-->
        <div class="modal fade" id="deviceModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Insert New Device</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>

                    <form method="POST" action="${pageContext.request.contextPath}/RegisterDeviceTechnician">
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
                                <input type="text" class="form-control" placeholder="Name" name="name" onkeyup="emailOnly(this)" minlength="4" maxlength="30" required>
                            </div>

                            <div class="jarakInput mb-3">
                                <label>Brand</label>
                                <input type="text" class="form-control" placeholder="Brand" name="brand" onkeyup="emailOnly(this)" minlength="4" maxlength="30" required>
                            </div>

                            <div class="jarakInput">
                                <label>Model / (Year Published)</label>
                                <input type="text" class="form-control" placeholder="Model" name="model" onkeyup="emailOnly(this)" minlength="4" maxlength="30" required>
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
        <div class="modal fade" id="checkWarrantyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Check Customer Parts Warranty</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>

                    <form action="${pageContext.request.contextPath}/CheckWarrantyTechnician" method="POST">
                        <div class="modal-body">
                            <label>Parts Id:</label>
                            <div class="row ml-2">
                                <input class="form-control col-9 mr-3" type="text" name="used_part_id" min="0" maxlength="10" onkeyup="numberOnly(this)" required>
                                <input class="btn btn-warning col mr-3" type="submit"  value="Check" name="submit">
                            </div>
                            
                        </div>

                    </form>
                </div>
            </div>
        </div>
                        
<!-- Check Customer Phone Modal-->
        <div class="modal fade" id="checkCustomerPhone" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Check Customer Phone</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>

                    <form action="${pageContext.request.contextPath}/CheckCustomerPhone" method="POST">
                        <div class="modal-body">
                            <label>Customer Phone Number:</label>
                            <div class="row ml-2">
                                <input class="form-control col-9 mr-3" type="text" onkeyup="numberOnly(this)" name="phone" required>
                                <input class="btn btn-warning col mr-3" type="submit"  value="Check" name="buttonPhone">
                            </div>
                            
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <!-- End of Topbar -->
        
