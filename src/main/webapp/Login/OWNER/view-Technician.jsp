<%@include file="header.jsp" %>

<sql:query var="updateTechnician" dataSource="${myDatasource}">
    SELECT * FROM staff WHERE staff_id = ${param.id}
</sql:query>
    
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Content Row -->
                    <div class="row">
                        <div class="card shadow mb-4" style="width: 40%; margin:auto; display:block;">
                            <div class="card-header py-3" style="text-align:center;">
                                <h3>Technician Information</h3>
                            </div>
                            
                            <form method="POST" action="${pageContext.request.contextPath}/UpdateTechnician"> 
                                <div class="card-body">
                                    <c:forEach var="row" items="${updateTechnician.rows}">
                                        <input type="hidden" name="staff_id" value="${row['staff_id']}">
                                        
                                        <div class="jarakInput">
                                            <label for="uname"><a> My Name: </a></label><br>
                                            <input class="form-control" type="text" value="${row['fullname']}" maxlength="50" onkeyup="fullnameOnly(this)" name="fullname">
                                        </div>

                                        <div class="jarakInput">
                                            <label for="email"><a> My Phone Number:</a></label><br>
                                            <input class="form-control" type="text" maxlength="11" onkeyup="numberOnly(this)" value="${row['phone']}" name="phone" readonly>
                                        </div>

                                        <div class="jarakInput">
                                            <label for="email"><a> My Account Password:</a></label><br>
                                            <input class="form-control" type="text" value="${row['password']}" name="password" readonly>
                                        </div>

                                        <div class="row">

                                        </div>
                                        <div class="jarakInput">
                                        <p class="btn btn-warning disabled">Position: ${row['position'].toUpperCase()}</p>
                                        </div>

                                        <div class="jarakInput">
                                            <input id="statusInput" type="hidden" value="${row['status']}" name="status">
                                            <c:choose>
                                                <c:when test="${row['status'] == 'active'}">
                                                    <p class="btn btn-success" id="statusTechnician">Status: ${row['status'].toUpperCase()}</p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="btn btn-danger" id="statusTechnician">Status: ${row['status'].toUpperCase()}</p>
                                                </c:otherwise>
                                            </c:choose>

                                        </div>

                                    </c:forEach>
                                </div>
                                <div class="modal-footer">
                                    <a class="btn btn-info" href="${pageContext.request.contextPath}/Login/OWNER/technicianList.jsp">Back </a>
<!--                                    <button class="btn btn-danger disabled" >Delete </button>-->
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
        <c:when test="${msgs.equals('SuccessUpdate')}">

            Swal.fire({
                icon: 'success',
                title: 'Successfully Update',
                html: 'Technician Fullname is successfully update'
            }).then(function(){
                location='Login/OWNER/view-Technician.jsp?id=${id}';
            });
        </c:when>

        <c:when test="${msgs.equals('FailUpdate')}">

            Swal.fire({
                icon: 'error',
                title: 'Fail Update',
                html: 'Technician Fullname is fail to update'
            }).then(function(){
                location='Login/OWNER/view-Technician.jsp?id=${id}';
            });
        </c:when>

    </c:choose>
</script>
<%@include file="footer.jsp" %>
