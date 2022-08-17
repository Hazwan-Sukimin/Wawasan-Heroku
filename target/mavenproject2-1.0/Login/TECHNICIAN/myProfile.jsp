<%@include file="header.jsp" %>
<!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Content Row -->
        <div class="row">
            
            <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM staff WHERE staff_id = ${staff.staff_id}
            </sql:query>
            <div class="card shadow mb-4" style="width: 40%; margin:auto; display:block;">
                <div class="card-header py-3" style="text-align:center;">
                    <h3>User Profile</h3>
                </div>
                <!--query-->
                <form method="POST" action="${pageContext.request.contextPath}/updateStaffServlet"> 
                <div class="card-body p-5">
                    <!--for-->
                        <c:forEach var="row" items="${result.rows}">
                        
                        <div class="row text-black">

                            <div class="col">
                                <label class="btn btn-info disabled"><a>ID : ${row["staff_id"]}</a></label>
                                <input type="hidden" name="staff_id" value="${row["staff_id"]}">
                            </div>

                            <div class="col">
                                <label class="btn btn-warning text-black disabled"><a>${row["position"]}</a></label>
                            </div>

                            <div class="col">
                                <label class="btn btn-success text-black disabled"><a>${row["status"]}</a></label>
                            </div>
                        </div>

                        <hr class="sidebar-divider">
                        <div class="jarakInput">
                            <label class="mt-3"><a> Fullname: </a></label><br>
                            <input class="form-control" type="text" value="${row["fullname"]}" name="update_staff_name" readonly="">
                        </div>

                        <div class="jarakInput">
                            <label class="mt-3"><a> Phone number: </a></label><br>
                            <input class="form-control" type="text" value="${row["phone"]}" onkeyup="numberOnly(this)" maxlength="11" name="phone">
                        </div>

                        <div class="jarakInput">
                            <label class="mt-3"><a> Email: </a></label><br>
                            <input class="form-control" type="email" value="${row["email"]}" maxlength="50" name="email">
                        </div>

                        <div class="jarakInput">
                            <label class="mt-3"><a> Current Password: </a></label><br>
                            <input class="form-control mb-3" type="text" value="${row["password"]}" name="password" minlength="8">
                        </div>
                        </c:forEach>
                    
                    <!--end for-->
                </div>
                <div class="card-footer">
                    <div class="jarakInput text-right">
                        <button class="btn btn-info" type="submit">Update Information</button>
                    </div>
                </div>
                </form>    
                        
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
                location='Login/TECHNICIAN/myProfile.jsp';
            });

        </c:when>

        <c:when test="${msgs.equals('Duplicate')}">

            Swal.fire({
                icon: 'error',
                title: 'Email or Phone number Existed',
                html: 'No phone or Email already existed, please choose another email or phone number '
            }).then(function(){
                location='Login/TECHNICIAN/myProfile.jsp';
            });
        </c:when>

        <c:when test="${msgs.equals('Success')}">

            Swal.fire({
                icon: 'success',
                title: 'Successfully Update',
                html: 'Your profile is updated'
            }).then(function(){
                location='Login/TECHNICIAN/myProfile.jsp';
            });
        </c:when>

        <c:when test="${msgs.equals('Fail')}">

            Swal.fire({
                icon: 'error',
                title: 'Something wrong happen',
                html: 'databse connection fail'
            }).then(function(){
                location='Login/TECHNICIAN/myProfile.jsp';
            });
        </c:when>
            
        <c:when test="${msgs.equals('Format')}">

            Swal.fire({
                icon: 'error',
                title: 'Incorrect Phone Number',
                html: 'Please enter correct phone number'
            }).then(function(){
                location='Login/TECHNICIAN/myProfile.jsp';
            });
        </c:when>
            
        <c:when test="${msgs.equals('FormatPassword')}">

            Swal.fire({
                icon: 'error',
                title: 'Password Criteria',
                html: 'Password not meet criteria'
            }).then(function(){
                location='Login/TECHNICIAN/myProfile.jsp';
            });
        </c:when>


    </c:choose>
</script>
<%@include file="footer.jsp" %>