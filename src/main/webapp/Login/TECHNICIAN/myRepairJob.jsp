<%@include file="header.jsp" %>
<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM repair_job WHERE staff_id = ${staff.getStaff_id()}
</sql:query> 
    
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h1 class="h3 mb-2 text-gray-800">Repair Job List</h1>
            </div>
              
            <div class="card-body">
            <a href="#" data-toggle="modal" data-target="#newRepairJobModal">
                <button class="btn btn-primary">Create New Repair Job</button>
            </a>
            <a href="#" data-toggle="modal" data-target="#checkCustomerPhone">
                <button class="btn btn-warning text-black">Check Customer Phone</button>
            </a>
            <a href="#" data-toggle="modal" data-target="#deviceModal">
                <button class="btn btn-info text-black">Add New Device</button>
            </a>

            <div class="table-responsive my-4">
              <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">

                <thead>
                  <tr style="text-align: center;">
                    <th width="5%">No.</th>
                    <th>Order ID</th>
                    <th>Information</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Repair Cost (RM)</th>
                    <th width="5%">View</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${result.rows}" varStatus="counter">

                      <tr style="text-align: center;">
                        <td>${counter.count}
                        <td>${row["repair_job_id"]}</td>
                        <td>${row["information"]}</td>
                        <td>${row["description"]}</td>
                        
                        <td>
                            
                            <c:choose>
                                <c:when test="${row['status'] == 'PAID' || row['status'] == 'FINISHED'}">
                                    <p class="btn btn-success">${row["status"]}</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="btn btn-warning">${row["status"]}</p>
                                </c:otherwise>
                            </c:choose>

                        </td>
                        
                        <td>${row["total_price"]}</td>


                        <td>
                          <a href="${pageContext.request.contextPath}/Login/TECHNICIAN/View-Repair-Job-List.jsp?repair_job_id=${row['repair_job_id']}" class="btn btn-info btn-circle"><i class="fa-regular fa-eye"></i></a>
                        </td>
                      </tr>
                    </c:forEach>
                </tbody>
                  <tfoot>
                  <tr style="text-align: center;">
                    <th width="5%">No.</th>
                    <th>Order No.</th>
                    <th>Order Date</th>
                    <th>Order Time</th>
                    <th>Order Status</th>
                    <th>Repair Cost (RM)</th>
                    <th width="5%">View</th>
                  </tr>
                  </tfoot>
              </table>
            </div>
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->
      </div>
<!-- End of Main Content -->
<!--Notification if customer phone exist-->
<script>
    ${phoneIsExist.equals('true')}
<c:choose>
    <c:when test="${msgs.equals('false')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Phone number not existed',
            text: 'Make sure registered the phone number before proceeding to create new repair job!',
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
        
    </c:when>

    <c:when test="${msgs.equals('true')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Phone number is existed',
            html: 'Can Proceed on make the order!<hr>' + '<br>Customer Name: ${customer.getFullname()}' + '<br>Customer Email: ${customer.getEmail()}'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
    
    <c:when test="${msgs.equals('fail')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Information not exist',
            html: 'Please fill the field correctly'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('null')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Information not exist',
            html: 'Please fill the field correctly'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('Null')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Quantity leave empty',
            html: 'Please fill the quantity field when choose partlist'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('Success')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Registered',
            html: 'Repair Job Successfully been created'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
    <c:when test="${msgs.equals('Stock')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Out Of Range',
            html: 'quantity spare part is out of range'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('SuccessUpdate')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Update',
            html: 'Repair Job is Finished'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('FailUpdate')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Fail Update',
            html: 'Repair Job is fail to update'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('PhoneFormat')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Phone Format',
            html: 'Make sure phone format is correct'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('NullType')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Type is Empty',
            html: 'Make sure choose type before register'
        }).then(function(){
            location='Login/TECHNICIAN/myRepairJob.jsp';
        });
    </c:when>
</c:choose>
</script>
<%@include file="footer.jsp" %>