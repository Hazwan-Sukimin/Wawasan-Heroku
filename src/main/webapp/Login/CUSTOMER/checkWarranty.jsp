<%@include file="header.jsp" %>

<sql:query var="result" dataSource="${myDatasource}">
    SELECT pu.used_part_id, CURRENT_DATE() AS "current_date", p.name, w.end_date FROM parts p JOIN parts_used pu USING (part_id) JOIN repair_job rj USING (used_part_id) JOIN customer c USING (customer_id) JOIN warranty w ON pu.warranty_id = w.warranty_id WHERE customer_id = ${customer.customer_id}
</sql:query>
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          
          <p class="mb-4"> </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3 h3">
                <h1 class="h3 mb-2 text-gray-800">Warranty Status</h1>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="5%">No.</th>
                      <th>Parts ID</th>
                      <th>Parts Name</th>
                      <th>Warranty End</th>
                      <th>Status</th>
                    </tr>
                  </thead>
                  <tbody>
                      
                    <!--query is here-->
                    <c:forEach var="row" items="${result.rows}" varStatus="counter">
                      <tr style="text-align: center;">
                        <td> ${counter.count}</td>
                        <td>${row["used_part_id"]}</td>
                        <td>${row["name"]}</td>
                        <td>${row["end_date"]}</td>

                        <td>
                            <c:choose>
                                <c:when test="${row['current_date'] > row['end_date']}">
                                    <p class="btn btn-danger disabled">Expired</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="btn btn-success disabled">Active</p>
                                </c:otherwise>
                            </c:choose>

                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                    <tfoot>
                        <tr style="text-align: center;">
                          <th width="5%">No.</th>
                          <th>Parts ID ${customer.customer_id}</th>
                          <th>Parts Name</th>
                          <th>Warranty End</th>
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

<%@include file="footer.jsp" %>