<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          
          <p class="mb-4"> </p>
          
          <sql:query var="technician" dataSource="${myDatasource}">
              SELECT * FROM staff  WHERE staff_id != ${staff.staff_id}
          </sql:query>
              
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h1 class="h3 mb-2 text-gray-800">Technician List </h1>
            </div>
            <div class="card-body">
            <a href="#" data-toggle="modal" data-target="#technicianModal" style="color: black;"><button class="btn btn-primary">Register New Technician</button></a>
              
            <form action="${pageContext.request.contextPath}/UpdateTechnicianStatus" method="POST">
            
            <div class="table-responsive mt-3">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="2%">No.</th>
                      <th width="10%">Technician ID.</th>
                      <th>Name</th>
                      <th>Phone</th>
                      <th>Address</th>
                      <th>Position</th>
                      <th>Status</th>
                      <th>View</th>
                    </tr>
                  </thead>
                        <tbody>
                            <c:forEach var="row" items="${technician.rows}" varStatus="counter"> 
                              <tr style="text-align: center;">
                                <td>${counter.count}</td>
                                <td>
                                    ${row['staff_id']}
                                </td>
                                <td>${row['fullname']}</td>
                                <td>${row['phone']}</td>
                                <td>${row['email']}</td>
                                <td>${row['position']}</td>
                                <td>  
                                    <c:choose>
                                        <c:when test="${row['status']=='active'}">
                                            <select class="form-control status bg-success text-white" id="status" name="status">
                                                <option selected="true" value="${row['staff_id']},ACTIVE">ACTIVE</option>
                                                <option class="bg-danger" value="${row['staff_id']},INACTIVE">INACTIVE</option>
                                            </select>
                                        </c:when>

                                        <c:otherwise>
                                          <select class="form-control status bg-danger" id="status" name="status">
                                            <option selected="true" value="${row['staff_id']},INACTIVE">INACTIVE</option>
                                            <option class="bg-success" value="${row['staff_id']},ACTIVE">ACTIVE</option>
                                          </select>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a class='btn btn-info btn-circle' href="${pageContext.request.contextPath}/Login/OWNER/view-Technician.jsp?id=${row['staff_id']}"><i class="fa-regular fa-eye text-white"></i></a>
                                </td>
                              </tr>
                            </c:forEach>

                        </tbody>

                        <tfoot>
                            <tr style="text-align: center;">
                            <th width="2%">No.</th>
                            <th width="10%">Staff ID.</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Position</th>
                            <th><input type="submit" class="btn btn-warning" value="Update"></th>
                            <th>View</th>
                          </tr>
                        </tfoot>
                </table>
              </div>
            </form>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
      </div>
<!-- End of Main Content -->

<script>    
    $('.status').change(function(){
        var status = $(this).val().split(",").pop();
        if (status === 'ACTIVE') {
            $(this).removeClass("bg-danger");
            
            $(this).addClass("text-white");
            $(this).addClass("bg-success");
        } else {
            $(this).removeClass("text-white");
            $(this).removeClass("bg-success");
            $(this).addClass("bg-danger");
            
        }
    });
</script>

<script>
<c:choose>
    <c:when test="${msgs.equals('Fail')}">
        
            Swal.fire({
            icon: 'error',
            title: 'Registration Failed',
            text: 'Technician information not been added to database!',
        });
        
        
    </c:when>

    <c:when test="${msgs.equals('Success')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Registered',
            text: 'Technician information successfully been added!',
        });
        
    </c:when>

    <c:when test="${msgs.equals('Duplicate')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Duplicate email or phone number',
            text: 'Technician information not successfully been added!',
        });
        
    </c:when>

    <c:when test="${msgs.equals('UpdateSuccess')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Successfully Update',
            html: 'Selected Technician is successfully change status'
        }).then(function(){
            location='Login/OWNER/technicianList.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('UpdateFail')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Fail Update',
            html: 'Selected Technician is fail to change status'
        }).then(function(){
            location='Login/OWNER/technicianList.jsp';
        });
    </c:when>
        
    <c:when test="${msgs.equals('Format')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Incorrect Phone Format',
            html: 'Make sure phone format is corrected'
        }).then(function(){
            location='Login/OWNER/technicianList.jsp';
        });
    </c:when>

</c:choose>
</script>

<%@include file="footer.jsp" %>