<%@include file="header.jsp" %>

<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!--Center title-->
                    <div class="card-header py-3" style="text-align:center;">
                        <h1 class="text-center">Register New Customer</h1>
                    </div>
                    
                    <!-- Content Row -->
                    <div class="row my-5">
                        <!--Customer information-->
                        <div class="card shadow mb-4" style="width: 70%; margin:auto; display:block;">
                            <div class="card-header py-3" style="text-align:center;">
                                <h3>Customer Information</h3>
                            </div>
                            <div class="card-body">
                                <form method="POST" action="${pageContext.request.contextPath}/registerCustomerServlet"> 
                                    <div class="jarakInput mb-4">
                                        <label for="uname"><a class="h5 text-dark"> Fullname:</a></label><br>
                                        <input class="form-control" maxlength="40" type="text" onkeyup="fullnameOnly(this)" placeholder="Fullname" name="fullname" required>
                                        <i>Example Format: XXXXXX XXXXXX XXXXXX XXXXXXXX</i>
                                    </div>
                                    
                                    <div class="row mb-4">
                                        <div class="col">
                                            <label for="email"><a class="h5 text-dark"> Phone Number: </a></label><br>
                                            <input class="form-control" type="text" maxlength="11" placeholder="Phone" name="phone" onkeyup="numberOnly(this)" pattern="^(01)[0-46-9]*[0-9]{8,9}$" required>
                                            <i>Example Format: 01xxxxxxxx (no dashes)</i>
                                        </div>
                                        
                                        <div class="col">
                                            <label for="email"><a class="h5 text-dark"> Email:</a></label><br>
                                            <input  class="form-control" type="email" placeholder="Email" name="email" onkeyup="emailOnly(this)" maxlength="30" required>
                                            <i>Example Format: xxxx@xxxx.com</i>
                                        </div>
                                    </div>
                                    
                                    <div class="jarakInput mb-4">
                                        <label for="email"><a class="h5 text-dark"> Password:</a></label><br>
                                        <input class="form-control" type="text" maxlength="30" placeholder="password" name="password" required>
                                        <i>Use mixture uppercase, lowercase and include a special character</i>
                                    </div>
                                    
                                    <div class="jarakInput m-2">
                                        <div class="card-header py-3" style="text-align:center;">
                                            <h3>Address Information</h3>
                                        </div>
                                        <input class="form-control mt-4 my-2" type="text" maxlength="50" onkeyup="bothOnly(this)" placeholder="Address Line 1" name="line1" required>
                                        <input class="form-control " type="text" maxlength="50" onkeyup="bothOnly(this)" placeholder="Address Line 2" name="line2" required>
                                    </div>
                                    
                                    <div class="row m-2">
                                        <input class="form-control mr-2 col-5" type="text" maxlength="5" onkeyup="numberOnly(this)" placeholder="Postcode" name="postcode"  required>
                                        <input class="form-control col-5" type="text" maxlength="20" onkeyup="letterOnly(this)" placeholder="City" name="city"  required>
                                    </div>
                                    <div class="row m-2">
                                        <input class="form-control mr-2 col-5" type="text" maxlength="20" onkeyup="letterOnly(this)" placeholder="State" name="state" required>
                                        <input class="form-control col-5" type="text" placeholder="Country" onkeyup="letterOnly(this)" value="Malaysia" name="country" readonly>
                                    </div>
                                    
                                    <br>
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput text-right">
                                        <button class="btn btn-primary" type="submit">Register Customer</button>
                                    </div>                                    
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                
<c:choose>
    <c:when test="${msgs.equals('Fail')}">
        <script>
            Swal.fire({
            icon: 'error',
            title: 'Registration Failed',
            text: 'customer information not been added to database!',
        }).then(function(){
            location='Login/TECHNICIAN/custReg.jsp';
        });
        
        </script>
    </c:when>

    <c:when test="${msgs.equals('Success')}">
        <script>
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Registered',
            text: 'customer information successfully been added!',
        }).then(function(){
            location='Login/TECHNICIAN/custReg.jsp';
        });
        </script>
    </c:when>
        
    <c:when test="${msgs.equals('Format')}">
        <script>
        Swal.fire({
            icon: 'error',
            title: 'Incorrect Phone Format',
            text: 'Make sure phone number is correct format!',
        }).then(function(){
            location='Login/TECHNICIAN/custReg.jsp';
        });
        </script>
    </c:when>

    <c:otherwise>
    </c:otherwise>
</c:choose>



            </div>
<!-- End of Main Content -->

<%@include file="footer.jsp" %>
