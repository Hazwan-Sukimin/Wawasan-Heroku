
<%@include file="header.jsp" %>

<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Repair Job List</h1>
          <p class="mb-4"> </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
               
            </div>
            <div class="card-body">
            <a href="#" data-toggle="modal" data-target="#newRepairJobModal">
                <button class="btn btn-primary">Create New Repair Job</button>
            </a>
                
            <br><br>
            
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                      <th width="5%">No.</th>
                      <th>Order No.</th>
                      <th>Order Date</th>
                      <th>Order Time</th>
                      <th>Technician Information</th>
                      <th>Order Status</th>
                      <th>Repair Cost (RM)</th>
                      <th width="5%">View</th>
                    </tr>
                  </thead>
                  
                    <sql:query var="result" dataSource="${myDatasource}">
                      SELECT REPAIR_ID, DATE_FORMAT(REPAIR_DATETIME, "%d / %b / %Y") AS REPAIR_DATE, 
                        DATE_FORMAT(REPAIR_DATETIME, "%h:%i %p") AS REPAIR_TIME,
                        STATUS_ID, REPAIR_PRICE, staff_name, staff_id FROM repair_job LEFT JOIN staff USING(staff_id) ORDER BY REPAIR_ID DESC

                    </sql:query>
                  <tbody>
                      <c:forEach var="row" items="${result.rows}" varStatus="counter">
                      <tr style="text-align: center;">
                        <td>
                          ${counter.count}
                        </td>

                        <td>
                          ${row["REPAIR_ID"]}
                        </td>

                        <td>
                            ${row["REPAIR_DATE"]}
                        </td>
                        
                        <td>
                            ${row["REPAIR_TIME"]}
                        </td>
                        
                        <td>
                            <c:choose>
                                <c:when test="${row['staff_id'] != null}">
                                    (${row["staff_id"]}) ${row["staff_name"]}
                                </c:when>

                                <c:otherwise>
                                    <button class="btn btn-danger" style="pointer-events: none;">NO TECHNICIAN IS ASSIGN</button>
                                </c:otherwise>
                            </c:choose>
    
                        </td>
                        
                        <td>
                            <c:if test="${row['STATUS_ID'] == 5}">
                                <button class="btn btn-secondary" style="pointer-events: none;">UNASSIGNED</button>
                            </c:if>
                            <c:if test="${row['STATUS_ID'] == 6}">
                                <button class="btn btn-warning" style="pointer-events: none;">ASSIGNED</button>
                            </c:if>
                            <c:if test="${row['STATUS_ID'] == 4}">
                                <button class="btn text-white" style="pointer-events: none; background-color: #007bff">IN PROGRESS</button>
                            </c:if>
                            <c:if test="${row['STATUS_ID'] == 1}">
                                <button class="btn btn-success" style="pointer-events: none;">FINISHED</button>
                            </c:if>
                        </td>

                        <td>
                            <c:if test="${row['REPAIR_PRICE'] == null}">
                                <button class="btn btn-secondary" style="pointer-events: none;">Not Available</button>
                            </c:if>
                            <c:if test="${row['REPAIR_PRICE'] != null}">
                                ${row['REPAIR_PRICE']}
                            </c:if>
                        </td>

                        <td>
                            <a target='_self' href='viewRepair.jsp?id=${row["REPAIR_ID"]}'>
                                <button style='margin:auto; display:block;' class='btn btn-primary btn-circle' type='button' style='cursor: pointer;'>
                                    <span><i style='color:white;'class='fa fa-arrow-right'></span></i>
                                </button>
                            </a>
                        </td>
                      </tr>
                      </c:forEach>
                  </tbody>
                  
                    <tfoot>
                        <tr style="text-align: center;">
                          <th width="5%">No.</th>
                          <th>Order No.</th>
                          <th>Order Date</th>
                          <th>Order Time</th>
                          <th>Staff ID</th>
                          <th>Order Status</th>
                          <th>Repair Cost (RM)</th>
                          <th width="5%">View</th>
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
