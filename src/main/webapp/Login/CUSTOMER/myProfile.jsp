<%@include file="header.jsp" %>
    
<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM customer WHERE customer_id = ${customer.customer_id}
</sql:query>
    
<!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Content Row -->
        <div class="row">
            <div class="card shadow" style="width: auto; min-width: 60%; max-width: 70%; margin:auto; display:block;">
                <div class="card-header py-3" style="text-align:center;">
                    <h3>User Profile</h3>
                </div>
                
                <!--QUERY HERE-->
                <!--Card-->
                <div class="card-body">
                    <!--for-->
                    
                        <form method="POST" action="${pageContext.request.contextPath}/updateCustomerServlet"> 
                            <c:forEach var="row" items="${result.rows}">
                            <div class="jarakInput ">
                                <label class="btn btn-info disabled"><a>ID : ${row["customer_id"]}</a></label>
                                <input type="hidden" name="customer_id" value="${row["customer_id"]}">
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                    <label for="uname"><a>Fullname: </a></label><br>
                                    <input class="form-control" type="text" value="${row["fullname"]}" onkeyup='letterOnly(this)' name="fullname" readonly>
                                </div>
                                <div class="col">
                                    <label for="email"><a>Phone number: </a></label><br>
                                    <input class="form-control" type="text" value="${row["phone"]}"  onkeyup='numberOnly(this)' name="phone" maxlength="11">
                                </div>
                            </div>
                            
                            <div class="mb-3"></div>
                            
                            <div class="row">
                                <div class="col">
                                    <label for="email"><a>Email: </a></label><br>
                                    <input  class="form-control" type="email" value="${row["email"]}" maxlength="50" name="email">
                                </div>
                                <div class="col">
                                    <label for="password"><a>Password</a></label><br>
                                    <input class="form-control" type="text" placeholder="Change Password" value="${row["password"]}" minlength="8" name="password">
                                </div>

                            </div>

                            <hr class="sidebar-divider mt-5">
                            <div class="jarakInput text-right">
                                <button class="btn btn-info" type="submit">Update Information</button>
                            </div> 
                            </c:forEach>
                        </form>
                    <!--end of for-->
                </div>
            </div>
                      
            <div class="card shadow my-5" style="width: auto; min-width: 30%; max-width: 30%; margin:auto; display:block;">
                <div class="card-header py-3" style="text-align:center;">
                    <h3>Address Information</h3>
                </div>
                
                <sql:query var="address" dataSource="${myDatasource}">
                    SELECT * FROM customer JOIN address USING (address_id) WHERE customer_id = ${customer.customer_id};
                </sql:query>
                <!--Card-->
                <div class="card-body">
                    <!--for-->
                        <form method="POST" action="${pageContext.request.contextPath}/UpdateAddressCustomer"> 
                            <input type="hidden" name="customer_id" value="${customer.customer_id}">
                            <c:forEach var="row" items="${address.rows}">
                                <div class="jarakInput m-2">
                                    <input class="form-control mb-3 col-12" type="text" placeholder="Address Line 1" maxlength="30" onkeyup="addressOnly(this)" value="${row['line1']}" name="line1">
                                    <input class="form-control col-12" type="text" placeholder="Address Line 2" maxlength="30" onkeyup="addressOnly(this)" value="${row['line2']}" name="line2">
                                </div>

                                <div class="row p-2">
                                    <div class="col-6">
                                        <input  class="form-control" type="text" placeholder="Postcode" onkeyup='numberOnly(this)' maxlength="5" value="${row['postcode']}" name="postcode">
                                    </div>
                                    <div class="col-6">
                                        <input class="form-control" type="text" placeholder="City" onkeyup='letterOnly(this)' value="${row['city']}" name="city">
                                    </div>
                                </div>

                                <div class="row p-2">
                                    <div class="col-6">
                                        <input  class="form-control" type="text" placeholder="State" onkeyup='letterOnly(this)' value="${row['state']}" name="state">
                                    </div>
                                    <div class="col-6">
                                        <input class="form-control" type="text" placeholder="Country" onkeyup='letterOnly(this)' value="${row['country']}" name="country" readonly>
                                    </div>
                                </div>

                                <hr class="sidebar-divider mt-5">
                                <div class="jarakInput text-right">
                                    <button class="btn btn-info" type="submit">Update Information</button>
                                </div>  
                            </c:forEach>
                        </form>
                    <!--end of for-->
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->

</div>
<!-- End of Main Content -->
<script>
    <c:choose>
        <c:when test="${msgs.equals('Null')}">

            Swal.fire({
                icon: 'warning',
                title: 'Empty input field',
                text: 'Please make sure there is no empty field!',
            }).then(function(){
                location='Login/CUSTOMER/myProfile.jsp';
            });

        </c:when>

        <c:when test="${msgs.equals('Duplicate')}">

            Swal.fire({
                icon: 'error',
                title: 'Email or Phone number Existed',
                html: 'No phone or Email already existed, please choose another email or phone number '
            }).then(function(){
                location='Login/CUSTOMER/myProfile.jsp';
            });
        </c:when>

        <c:when test="${msgs.equals('Success')}">

            Swal.fire({
                icon: 'success',
                title: 'Successfully Update',
                html: 'Your profile is updated'
            }).then(function(){
                location='Login/CUSTOMER/myProfile.jsp';
            });
        </c:when>

        <c:when test="${msgs.equals('Fail')}">

            Swal.fire({
                icon: 'error',
                title: 'Something wrong happen',
                html: 'databse connection fail'
            }).then(function(){
                location='Login/CUSTOMER/myProfile.jsp';
            });
        </c:when>
            
        <c:when test="${msgs.equals('Format')}">

            Swal.fire({
                icon: 'error',
                title: 'Incorrect Phone Format',
                html: 'Please enter correct phone format'
            }).then(function(){
                location='Login/CUSTOMER/myProfile.jsp';
            });
        </c:when>

    </c:choose>
</script>
<%@include file="footer.jsp" %>