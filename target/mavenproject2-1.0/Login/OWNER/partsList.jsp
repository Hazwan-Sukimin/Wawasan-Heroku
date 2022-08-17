<%@include file="header.jsp" %>
<sql:query var="part" dataSource="${myDatasource}">
    SELECT * FROM parts
</sql:query>
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          
          <p class="mb-4"> </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h1 class="h3 mb-2 text-gray-800">Parts List</h1>
            </div>
            <div class="card-body">
            <a href="#" data-toggle="modal" data-target="#partsModal" style="color: black;"><button class="btn btn-primary">Register New Parts</button></a>
            <br><br>
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="2%">No.</th>
                      <th width="10%">Parts Name</th>
                      <th>Model</th>
                      <th>Price (RM)</th>
                      <th>Stock (qty)</th>
                      <th>Warranty (Year)</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="row" items="${part.rows}" varStatus="counter">
                        <tr style="text-align: center;">
                          <td> ${counter.count} </td>
                          <td> ${row['name']} </td>
                          <td> ${row['model']} </td>
                          <td> RM ${row['sell_cost']} </td>
                          <td> 
 
                              <c:choose>
                                  <c:when test="${row['quantity'] == 0}">
                                      <p class="btn btn-danger">No Stock</p>
                                  </c:when>
                                  <c:otherwise>
                                      ${row['quantity']}
                                  </c:otherwise>
                              </c:choose>

                                
                          
                          </td>
                          <td> ${row['warranty_period']}  </td>
                          
                        </tr>
                    </c:forEach>
                  </tbody>
                    <tfoot>
                        <tr style="text-align: center;">
                            <th width="2%">No.</th>
                            <th width="10%">Parts Name</th>
                            <th>Model</th>
                            <th>Price (RM)</th>
                            <th>Stock (qty)</th>
                            <th>Warranty (Year)</th>
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
            text: 'Parts information not been added to database!',
        }).then(function(){
            location='Login/OWNER/partsList.jsp';
        });
        
        
    </c:when>

    <c:when test="${msgs.equals('Success')}">
        
        Swal.fire({
            icon: 'success',
            title: 'Succesfully Registered',
            text: 'Parts information successfully been added!',
        }).then(function(){
            location='Login/OWNER/partsList.jsp';
        });
        
    </c:when>

    <c:when test="${msgs.equals('Duplicate')}">
        
        Swal.fire({
            icon: 'error',
            title: 'Duplicate information',
            text: 'Parts information not successfully been added!',
        }).then(function(){
            location='Login/OWNER/partsList.jsp';
        });
        
    </c:when>

    <c:otherwise>
    </c:otherwise>
</c:choose>
</script>



<%@include file="footer.jsp" %>
