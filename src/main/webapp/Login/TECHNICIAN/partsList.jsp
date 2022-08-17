<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Parts List</h1>
          <p class="mb-4"> </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                    <thead>
                      <tr style="text-align: center;">
                          <th width="2%">No.</th>
                          <th width="10%">Parts ID</th>
                          <th>Device Support</th>
                          <th>Name</th>
                          <th>Set</th>
                          <th>Brand</th>
                          <th>Model</th>
                          <th>Buy Cost</th>
                          <th>Sell Cost</th>
                          <th>Quantity</th>
                          <th>Warranty Period</th>
                      </tr>
                    </thead>
                    <sql:query var="result" dataSource="${myDatasource}">
                        SELECT * FROM parts
                    </sql:query>
                    <tbody>
                        <c:forEach var="row" items="${result.rows}" varStatus="counter">
                            <tr style="text-align: center;">

                                  <td> ${counter.count} </td>
                                  <td> ${row["part_id"]}</td>
                                  <td> ${row["device_support"]}</td>
                                  <td> ${row["name"]} </td>
                                  <td> ${row["part_set"]} </td>
                                  <td> ${row["brand"]} </td>
                                  <td> ${row["model"]} </td>
                                  <td> ${row["buy_cost"]} </td>
                                  <td> ${row["sell_cost"]} </td>
                                  <td> ${row["quantity"]} </td>
                                  <td> ${row["warranty_period"]} </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                  
                    <tfoot>
                        <tr style="text-align: center;">
                            <th width="2%">No.</th>
                            <th width="10%">Parts ID</th>
                            <th>Device Support</th>
                            <th>Name</th>
                            <th>Set</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Buy Cost</th>
                            <th>Sell Cost</th>
                            <th>Quantity</th>
                            <th>Warranty Period</th>
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

