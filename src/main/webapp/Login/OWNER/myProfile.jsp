<%@include file="header.jsp" %>
<sql:query var="profile" dataSource="${myDatasource}">
    SELECT * FROM staff WHERE staff_id = ${staff.staff_id}
</sql:query>
<!-- Begin Page Content -->
    <div class="container-fluid">
        <!-- Content Row -->
        <div class="row">
            <div class="card shadow mb-4" style="width: 40%; margin:auto; display:block;">
                <div class="card-header py-3" style="text-align:center;">
                    <h3>Profile</h3>
                </div>
                
                <form method="POST" action="${pageContext.request.contextPath}/UpdateProfile"> 
                    <div class="card-body">
                        <c:forEach var="row" items="${profile.rows}">
                            <input type="hidden" name="staffid" value="${staff.staff_id}">
                            <div class="jarakInput">
                            <label for="uname"><a> My Name: </a></label><br>
                            <input class="form-control" type="text" value="${staff.getFullname()}" name="fullname" readonly>
                            </div>

                            <div class="jarakInput">
                            <label for="email"><a> My Phone Number:</a></label><br>
                            <input class="form-control" type="text" maxlength="11" onkeyup="numberOnly(this)" value="${staff.getPhone()}" name="phone" required>
                            </div>

                            <div class="jarakInput">
                            <label for="email"><a> My Account Password:</a></label><br>
                            <input class="form-control" type="text" value="${row['password']}" name="password" required>
                            </div>

                            <div class="row">
                                
                            </div>
                            <div class="jarakInput">
                            <p class="btn btn-warning">Position: ${staff.position}</p>
                            </div>

                            <div class="jarakInput">
                                <p class="btn btn-success">Status: ${row['status']}</p>
                            </div>
                            
                        </c:forEach>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" type="submit">Back </button>
                        <button class="btn btn-danger" type="submit">Delete </button>
                        <button class="btn btn-primary" type="submit">Update </button>
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
                location='Login/OWNER/myProfile.jsp';
            });

        </c:when>

        <c:when test="${msgs.equals('Duplicate')}">

            Swal.fire({
                icon: 'error',
                title: 'Email or Phone number Existed',
                html: 'No phone or Email already existed, please choose another email or phone number '
            }).then(function(){
                location='Login/OWNER/myProfile.jsp';
            });
        </c:when>

        <c:when test="${msgs.equals('Success')}">

            Swal.fire({
                icon: 'success',
                title: 'Successfully Update',
                html: 'Your profile is updated'
            }).then(function(){
                location='Login/OWNER/myProfile.jsp';
            });
        </c:when>

        <c:when test="${msgs.equals('Fail')}">

            Swal.fire({
                icon: 'error',
                title: 'Something wrong happen',
                html: 'databse connection fail'
            }).then(function(){
                location='Login/OWNER/myProfile.jsp';
            });
        </c:when>
            
        <c:when test="${msgs.equals('Format')}">

            Swal.fire({
                icon: 'error',
                title: 'Wrong Format',
                html: 'Phone number is wrong format!'
            }).then(function(){
                location='Login/OWNER/myProfile.jsp';
            });
        </c:when>
            
        <c:when test="${msgs.equals('FormatPassword')}">

            Swal.fire({
                icon: 'error',
                title: 'Wrong Format',
                html: 'Password need to have at least 8 character!'
            }).then(function(){
                location='Login/OWNER/myProfile.jsp';
            });
        </c:when>

    </c:choose>
</script> 
<%@include file="footer.jsp" %>
