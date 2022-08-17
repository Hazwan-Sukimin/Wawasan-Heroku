<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          
          <sql:query var="repair" dataSource="${myDatasource}">
              SELECT rj.repair_job_id, rj.information, s.fullname, rj.`status` FROM repair_job rj LEFT JOIN staff s ON rj.staff_id = s.staff_id
          </sql:query>
              
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h1 class="h3 mb-2 text-gray-800">Repair Order List</h1>
              </div>
            
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="2%">No.</th>
                      <th width="10%">Repair ID</th>
                      <th>Title</th>
                      <th>In Charge</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                      <c:forEach var="row" items="${repair.rows}" varStatus="counter">
                        <tr style="text-align: center;">
                          <td>${counter.count}</td>
                          <td>${row['repair_job_id']}</td>
                          <td>${row['information']}</td>
                          <td>
                              ${row['fullname']}
                              <c:if test="${row['fullname'] == null}">
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/Login/OWNER/assign-technician.jsp">Not Assigned</a>
                              </c:if>
                          </td>
                          
                          <td>
                              
                              <c:choose>
                                  <c:when test="${row['status'] == 'PAID'}">
                                      <p class="btn btn-success">${row['status']}</p>
                                  </c:when>
                                      
                                  <c:otherwise>
                                      <p class="btn btn-danger">${row['status']}</p>
                                  </c:otherwise>
                              </c:choose>

                          </td>
                          
                        </tr>
                      </c:forEach>
                  </tbody>
                        <tfoot>
                        <tr style="text-align: center;">
                          <th width="2%">No.</th>
                          <th width="10%">Repair ID</th>
                          <th>Title</th>
                          <th>In Charge</th>
                          <th>Status</th>
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
<script>
<c:choose>
    <c:when test="${msgs.equals('Fail')}">
        
            Swal.fire({
            icon: 'error',
            title: 'Registration Failed',
            text: 'Services information not been added to database!',
        });
        
        
    </c:when>

    <c:when test="${msgs.equals('Success')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Registered',
            text: 'Services information successfully been added!',
        });
        
    </c:when>

    <c:when test="${msgs.equals('Duplicate')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Duplicate title',
            text: 'Services information not successfully been added!',
        });
        
    </c:when>

    <c:otherwise>
    </c:otherwise>
</c:choose>
</script>

<%@include file="footer.jsp" %>
