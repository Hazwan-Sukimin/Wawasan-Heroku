<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div style="margin-top:2%;" class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- File Card -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Repair Job Quantity</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <!--query--> 
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Document Card -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Finished Order</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <!--query-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">

            <!-- User Card -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total Sales</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <!--query-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
          <!-- User Card -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-danger shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Total Device Received</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <!--query-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row">

            <!-- User Card -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Total Parts Quantity</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <!--query-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          
          <!-- User Card -->
            <div class="col-xl-6 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Number of Registered Customer</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">
                        <!--query-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">
            </div>

            <div class="col-lg-6 mb-4">
            </div>
          </div>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->
      
<c:choose>
    <c:when test="${msgs.equals('Not Found')}">
        <script>
            Swal.fire({
            icon: 'error',
            title: 'Parts Not Found',
            text: 'Parts Information not found!',
        }).then(function(){
            location='Login/OWNER/dashboard.jsp';
        });
        </script>
    </c:when>

    <c:when test="${msgs.equals('Found')}">
        <script>
        Swal.fire({
            icon: 'info',
            title: 'Warranty End',
            text: '${used_part_id}: this parts warranty will end in (${end_date})',
        }).then(function(){
            location='Login/OWNER/dashboard.jsp';
        });
        
        </script>
    </c:when>

    <c:otherwise>
    </c:otherwise>
</c:choose>
        
<%@include file="footer.jsp" %>