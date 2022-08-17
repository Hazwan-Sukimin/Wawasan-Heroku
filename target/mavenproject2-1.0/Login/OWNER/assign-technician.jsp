<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
            <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM device JOIN repair_job USING (device_id) WHERE staff_id IS NULL
            </sql:query>
                
            <sql:query var="technician" dataSource="${myDatasource}">
                SELECT * FROM staff WHERE position like 'technician'
            </sql:query>
        
              

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h1 class="h3 mb-2 text-gray-800">Unassigned Repair Job List</h1>
            </div>
            <div class="card-body">
            
            <form action="${pageContext.request.contextPath}/DummyServlet" method="POST" id="assign">
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="5%">No.</th>
                      <th>Order No.</th>
                      <th>Device</th>
                      <th>Task</th>
                      <th>Model</th>
                      <th width="25%">Action</th>
                    </tr>
                  </thead>
                  
                  
                    <tbody>
                        <c:forEach var="row" items="${result.rows}" varStatus="counter">
                            <tr style="text-align: center;">
                                <td> ${counter.count} </td>
                                <td> ${row["repair_job_id"]} </td>
                                <td> ${row["type"]} </td>
                                <td> ${row["information"]} </td>
                                <td> ${row["name"]} </td>
                                
                                <td> 
                                    
                                    <select class="form-control" id="id" name="technician">
                                        <option selected="true" disabled="disabled" value="0">Choose Technician</option>
                                        <c:forEach var="row2" items="${technician.rows}">
                                            <option value="${row2['staff_id']},${row["repair_job_id"]}"> ${row2["fullname"]} </option>
                                        </c:forEach>
                                    </select>
                                    
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    
                    <tfoot>
                        <tr style="text-align: center;">
                          <th width="5%">No.</th>
                          <th>Order No.</th>
                          <th>Device</th>
                          <th>Task</th>
                          <th>Model</th>
                          <th width="25%"> <input type="submit" class="btn btn-success" id="submit" value="Assign Now"></th>
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


<c:choose>
    <c:when test="${msgs.equals('Null')}">
        <script>
            Swal.fire({
            icon: 'error',
            title: 'No Technician is selected',
            html: 'Please select a technician name to be assigned'
        }).then(function(){
            location='Login/OWNER/assign-technician.jsp';
        });
        </script>
    </c:when>

    <c:when test="${msgs.equals('Success')}">
        <script>
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Assigned',
            text: 'repair job successfully assigned a technician!',
        }).then(function(){
            location='Login/OWNER/assign-technician.jsp';
        });
        </script>
    </c:when>
    <c:when test="${msgs.equals('Fail')}">
        <script>
        Swal.fire({
            icon: 'error',
            title: 'Assigned Failed',
            text: 'Server Failure!',
        }).then(function(){
            location='Login/OWNER/assign-technician.jsp';
        });
        </script>
    </c:when>

    <c:otherwise>
    </c:otherwise>
</c:choose>

<%@include file="footer.jsp" %>
