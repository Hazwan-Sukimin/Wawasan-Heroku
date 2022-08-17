<%@include file="header.jsp" %>
<sql:query var="status" dataSource="${myDatasource}">
    SELECT * FROM repair_job JOIN customer USING (customer_id) WHERE repair_job_id = ${param.repair_job_id}
</sql:query>
    
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          
          
        
        
        <!-- DataTales Example -->
        <div class="card shadow mb-4 col-10">
            <div class="card-header py-3">
               <h1 class="h3 mb-2 text-gray-800">Repair Job Detail</h1>
            </div>
            
            
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <h1 class="h3 mb-2 text-gray-800">Customer Information</h1>
                        </div>
                        <div class="col-6">
                           <h1 class="h3 mb-2 text-gray-800">Repair Information</h1>
                        </div>
                    </div>
                    
                    <c:forEach var="row" items="${status.rows}">
                        <div class="row">
                            <div class="col-6">
                                <input class="form-control my-3 " type="text" value="${row['fullname']}" readonly>
                                <input class="form-control my-3 " type="text" value="${row['phone']}" readonly>
                                <input class="form-control my-3 " type="text" value="${row['email']}" readonly>
                            </div>
                            <div class="col-6">
                                <input class="form-control my-3 " type="text" value="${row['information']}" readonly>
                                <input class="form-control my-3" type="text" value="${row['description']}" readonly>
                                <input class="form-control my-3 " type="text" value="${row['total_price']}" readonly>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                    
                <div class="card-footer">
                    <div class="row">
                        <div>
                            <a href="${pageContext.request.contextPath}/Login/TECHNICIAN/myRepairJob.jsp"><button class="btn btn-primary mb-4">Back</button></a>
                        </div>
                    
                        <form method="POST" action="${pageContext.request.contextPath}/UpdateStatus" class="ml-auto"> 
                            <input type="hidden" name="job_id" value="${param.repair_job_id}">
                            <c:forEach var="row" items="${status.rows}">    
                                <c:choose>
                                    <c:when test="${row['status'] == 'FINISHED'}">
                                        
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary " type="submit">Finished Repair</button>
                                    </c:otherwise>
                                </c:choose>
    
                            </c:forEach>
                            
                            
                        </form> 
                    </div>
                </div>
            
              
        </div>

        </div>
        <!-- /.container-fluid -->
      </div>
<!-- End of Main Content -->
<script>
    <c:choose>
        <c:when test="${msgs.equals('Success')}">

            Swal.fire({
                icon: 'success',
                title: 'Done ',
                html: 'Your profile is updated'
            }).then(function(){
                location='Login/TECHNICIAN/View-Repair-Job-List.jsp?repair_job_id=${param.repair_job_id}';
            });
        </c:when>

        <c:when test="${msgs.equals('Fail')}">

            Swal.fire({
                icon: 'error',
                title: 'Something wrong happen',
                html: 'databse connection fail'
            }).then(function(){
                location='Login/TECHNICIAN/View-Repair-Job-List.jsp?repair_job_id=${param.repair_job_id}';
            });
        </c:when>

    </c:choose>
</script>
<%@include file="footer.jsp" %>
