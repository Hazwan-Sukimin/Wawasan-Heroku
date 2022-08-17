<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          
          <p class="mb-4"> </p>
          
          <sql:query var="service" dataSource="${myDatasource}">
              SELECT * FROM services
          </sql:query>
              
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
              <div class="card-header py-3">
                  <h1 class="h3 mb-2 text-gray-800">Service List</h1>
              </div>
            
            <div class="card-body">
            <a href="#" data-toggle="modal" data-target="#serviceModal" style="color: black;"><button class="btn btn-primary">Register New Service</button></a>
            <br><br>
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="2%">No.</th>
                      <th width="10%">Service ID</th>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Price</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                      <c:forEach var="row" items="${service.rows}" varStatus="counter">
                        <tr style="text-align: center;">
                          <td>${counter.count}</td>

                          <td>${row['service_id']}</td>
                          <td>${row['title']}</td>
                          <td>${row['description']}</td>
                          <td>${row['price']}</td>

                        </tr>
                      </c:forEach>
                  </tbody>
                    <tfoot>
                        <tr style="text-align: center;">
                            <th width="2%">No.</th>
                            <th width="10%">Service ID</th>
                            <th>Description</th>
                            <th>Cost</th>
                            <th>Warranty</th>
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
