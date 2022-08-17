<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">
            <style>
                .btn:hover{
                    background-color: turquoise; 
                }
            </style>
          <!-- Page Heading -->
          
          <p class="mb-4"> </p>
          
          <sql:query var="device" dataSource="${myDatasource}">
              SELECT * FROM device
          </sql:query>
              
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h1 class="h3 mb-2 text-gray-800">Device List</h1>
            </div>
            
            <div class="card-body">
            <a href="#" data-toggle="modal" data-target="#deviceModal" style="color: black;"><button class="btn btn-primary">Register New Device</button></a>
            <br><br>
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="2%">No.</th>
                      <th width="10%">Device ID</th>
                      <th>Type</th>
                      <th>Name</th>
                      <th>Brand</th>
                      <th>Model</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                      <c:forEach var="row" items="${device.rows}" varStatus="counter">
                        <tr style="text-align: center;">
                          <td>${counter.count}</td>

                          <td>${row['device_id']}</td>

                          <td>${row['type']}</td>

                          <td>${row['name']}</td>
                          
                          <td>${row['brand']}</td>
                          
                          <td>${row['model']}</td>

                            
                        </tr>
                      </c:forEach>
                  </tbody>
                    <tfoot>
                        <tr style="text-align: center;">
                            <th width="2%">No.</th>
                            <th width="10%">Device ID</th>
                            <th>Type</th>
                            <th>Name</th>
                            <th>Brand</th>
                            <th>Model</th>
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
            text: 'device information not been added to database!',
        }).then(function(){
            location='Login/OWNER/deviceList.jsp';
        });
        
        
    </c:when>

    <c:when test="${msgs.equals('Success')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Registered',
            text: 'device information successfully been added!',
        }).then(function(){
            location='Login/OWNER/deviceList.jsp';
        });
        
    </c:when>

    <c:when test="${msgs.equals('Duplicate')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Duplicate name, brand and model',
            text: 'customer information not successfully been added!',
        }).then(function(){
            location='Login/OWNER/deviceList.jsp';
        });
        
    </c:when>
        
    <c:when test="${msgs.equals('NullType')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Null Empty',
            text: 'Please select type to proceed register new device',
        }).then(function(){
            location='Login/OWNER/deviceList.jsp';
        });
        
    </c:when>

    <c:otherwise>
    </c:otherwise>
</c:choose>
</script>
<%@include file="footer.jsp" %>
