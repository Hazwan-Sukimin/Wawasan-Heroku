<%-- 
    Document   : finishedRepairJob
    Created on : Feb 14, 2022, 2:38:17 AM
    Author     : user
--%>

<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Finished Repair Job List</h1>
          <p class="mb-4"> </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               
            </div>
            <div class="card-body">
            <a href="#"><button class="btn btn-primary">Create New Repair Job</button></a>
            <br><br>
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="2%">No.</th>
                      <th width="10%">Order No.</th>
                      <th>Order Date</th>
                      <th>Order Status</th>
                      <th>Repair Cost</th>
                      <th>View</th>
                    </tr>
                  </thead>
                  <tbody>
                      <tr style="text-align: center;">
                        <td>
                          1
                        </td>

                        <td>
                          Order ID
                        </td>

                        <td>
                          Order Date
                        </td>

                        <td>
                          Order Status
                        </td>

                        <td>
                          Repair Cost
                        </td>

                        <td>
                          <!--<button class='btn btn-primary btn-circle' type='button' style='cursor: pointer;'><a target='_self' href='#'><span><i style='color:white;'class='fa fa-arrow-right'></span></a></i></button>-->
                          <button style='margin:auto; display:block;' class='btn btn-primary btn-circle' type='button' style='cursor: pointer;'><a target='_self' href='viewRepair.jsp'><span><i style='color:white;'class='fa fa-arrow-right'></span></a></i></button>
                        </td>
                      </tr>
                  </tbody>
                    <tfoot>
                    <tr style="text-align: center;">
                        <th width="2%">No.</th>
                        <th width="10%">Order No.</th>
                        <th>Order Date</th>
                        <th>Order Status</th>
                        <th>Repair Cost</th>
                        <th>View</th>
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

<%@include file="footer.jsp" %>