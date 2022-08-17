<%@include file="header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
</div>

<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    </div>
                    <!-- Content Row -->
                    <div class="row">
                        
                        <div class="card shadow " style="width: 100%; margin-bottom: 100px; height: 30%;">
                            <div class="card-header" style="text-align:center;">
                                <h3>Device Repair Status History</h3>
                            </div>
                            <div class="card-body">
                                <sql:query var="deviceData" dataSource="${myDatasource}">
                                    SELECT DEVICE_NAME, DEVICE_BRAND, DEVICE_MODEL, DEVICE_TYPE FROM DEVICE WHERE DEVICE_ID = ${param.id}
                                </sql:query>
                                    
                                <c:forEach var="rows" items="${deviceData.rows}">  
                                <div class="row h5">
                                    <div class="col-6">
                                        Device Name: ${rows['DEVICE_NAME']}
                                    </div>
                                    <div class="col-6">
                                        Device Brand: ${rows['DEVICE_BRAND']}
                                    </div>
                                </div>
                                <div class="row h5">
                                    <div class="col-lg-6">
                                        Device Model: ${rows['DEVICE_MODEL']}
                                    </div>
                                    <div class="col-lg-6">
                                        Device Type: ${rows['DEVICE_TYPE']}
                                    </div>                                    
                                </div>
                                    
                                </c:forEach>  
                                    
                                <sql:query var="serviceDesc" dataSource="${myDatasource}">
                                    SELECT service_desc,repair_desc
                                    FROM repair_job 
                                    JOIN device USING (repair_id)
                                    JOIN services USING (service_id)
                                    WHERE device_id = ${param.id};
                                </sql:query>
                                <hr class="sidebar-divider">
                                <div class="row h5">
                                    <div class="col-lg-12">
                                        Repair Description: ${serviceDesc.rows[0]['repair_desc']}
                                    </div>                                 
                                </div>
                                <div class="row h5">
                                    <div class="col-lg-6">
                                        Service Description: <i class="font-weight-bold">${serviceDesc.rows[0]['service_desc']}</i>
                                    </div>                                   
                                </div>
                                <hr class="sidebar-divider">
                                
                                <sql:query var="historyData" dataSource="${myDatasource}">
                                    SELECT STATUS_ID FROM STATUS_HISTORY WHERE DEVICE_ID = ${param.id} ORDER BY HISTORY_ID DESC LIMIT 1 
                                </sql:query>
                                    
                                <sql:query var="staffInCharge" dataSource="${myDatasource}">
                                    SELECT staff_id FROM device JOIN repair_job USING (repair_id) WHERE device_id = ${param.id};
                                </sql:query>
                                
                                <c:if test="${staff.getStaffID() == staffInCharge.rows[0]['staff_id']}" >
                                    <c:forEach var="rows" items="${historyData.rows}"> 
                                        <c:if test="${rows['STATUS_ID'] == 7}">
                                            <form action="../../progressHistoryServlet" method="POST">
                                                <input hidden="hidden" name="device_id" type="text" value="${param.id}">
                                                <input hidden="hidden" name="new_status_id" type="text" value="4">
                                                <button class="btn btn-info" type="submit">CLick Here to Start Repair/Service</button>
                                            </form> 
                                            <hr class="sidebar-divider">
                                        </c:if>
                                        <c:if test="${rows['STATUS_ID'] == 4}">
                                            <form action="../../progressHistoryServlet" method="POST">
                                                <input hidden="hidden" name="device_id" type="text" value="${param.id}">
                                                <input hidden="hidden" name="new_status_id" type="text" value="2">
                                                <button class="btn btn-warning" type="submit">CLick Here while Waiting New Parts Stock</button>
                                            </form>
                                            <form action="../../progressHistoryServlet" method="POST">
                                                <input hidden="hidden" name="device_id" type="text" value="${param.id}">
                                                <input hidden="hidden" name="new_status_id" type="text" value="1">
                                                <button class="btn btn-success" type="submit">Click Here to Finish Repair/Service</button>
                                            </form>
                                            <hr class="sidebar-divider">
                                            <a href="#" data-toggle="modal" data-target="#dupModal">
                                                <button class="btn btn-info">Assign Parts to Device</button>
                                            </a>
                                            <hr class="sidebar-divider">
                                        </c:if>
                                        <c:if test="${rows['STATUS_ID'] == 2}">
                                            <form action="../../progressHistoryServlet" method="POST">
                                                <input hidden="hidden" name="device_id" type="text" value="${param.id}">
                                                <input hidden="hidden" name="new_status_id" type="text" value="4">
                                                <button class="btn btn-info" type="submit">CLick Here to Continue Repair/Service</button>
                                            </form> 
                                            <hr class="sidebar-divider">
                                        </c:if>
                                    </c:forEach> 
                                </c:if>
                                
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr style="text-align: center;">
                                                <th width="3%">No.</th>
                                                <th width="15%">Update Date</th>
                                                <th width="15%">Update Time</th>
                                                <th width="15%">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query var="statusData" dataSource="${myDatasource}">
                                                SELECT DATE_FORMAT(HISTORY_DATETIME, "%d / %b / %Y") AS HISTORY_DATE, 
                                                DATE_FORMAT(HISTORY_DATETIME, "%h:%i %p") AS HISTORY_TIME,
                                                STATUS_ID FROM STATUS_HISTORY WHERE DEVICE_ID = ${param.id} ORDER BY HISTORY_ID DESC
                                            </sql:query>
                                                
                                            <sql:query var="repairId" dataSource="${myDatasource}">
                                                SELECT repair_id FROM device WHERE DEVICE_ID = ${param.id}
                                            </sql:query>
                                            <c:forEach var="row" items="${statusData.rows}" varStatus="counter">
                                            <tr style="text-align: center;">
                                                <td>
                                                    ${counter.count}
                                                </td>
                                                
                                                <td>
                                                   ${row['HISTORY_DATE']}
                                                </td>
                                                
                                                <td>
                                                   ${row['HISTORY_TIME']}
                                                </td>
                                                
                                                <td>
                                                    <c:if test="${row['STATUS_ID'] == 7}">
                                                        <button class="btn btn-secondary" style="pointer-events: none;">NOT STARTED</button>
                                                    </c:if>
                                                    <c:if test="${row['STATUS_ID'] == 2}">
                                                        <button class="btn text-white" style="pointer-events: none; background-color: #a64bf4;">WAITING FOR PARTS STOCK</button>
                                                    </c:if>
                                                    <c:if test="${row['STATUS_ID'] == 4}">
                                                        <button class="btn btn-warning" style="pointer-events: none;">IN PROGRESS</button>
                                                    </c:if>
                                                    <c:if test="${row['STATUS_ID'] == 1}">
                                                        <button class="btn btn-success" style="pointer-events: none;">FINISHED</button>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>    
                            <div class="row">
                                <div class="col-12 m-5">
                                    <a href="viewRepair.jsp?id=${repairId.rows[0]['repair_id']}" class="btn btn-primary">Go Back</a>
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="card shadow " style="width: 100%; margin-bottom: 100px; height: 30%;">
                            <div class="card-header" style="text-align:center;">
                                <h3>Parts Used</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="fileTable2" width="100%" cellspacing="0">
                                        <thead>
                                            <tr style="text-align: center;">
                                                <th width="3%">No.</th>
                                                <th>Parts Name</th>
                                                <th>Quantity</th>
                                                <th width="20%">Use Date</th>
                                                <th width="15%">Use Time</th>
                                                <th width="15%">Warranty</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query var="dupData" dataSource="${myDatasource}">
                                                SELECT P.PARTS_NAME, DUP.QUANTITY, p.parts_warranty,
                                                DATE_FORMAT(DUP.DATE_USED, "%d / %b / %Y") AS DUP_DATE, 
                                                DATE_FORMAT(DUP.DATE_USED, "%h:%i %p") AS DUP_TIME
                                                FROM DEVICE_USED_PARTS DUP JOIN PART P ON DUP.PARTS_ID = P.PARTS_ID
                                                WHERE DEVICE_ID = ${param.id}
                                            </sql:query>
                                            <c:forEach var="rows" items="${dupData.rows}" varStatus="counter"> 
                                            <tr style="text-align: center;">
                                                <td>
                                                    ${counter.count}
                                                </td>
                                                
                                                <td>
                                                   ${rows["PARTS_NAME"]}
                                                </td>
                                                
                                                <td>
                                                    ${rows["QUANTITY"]}
                                                </td>
                                                
                                                <td>
                                                    ${rows["DUP_DATE"]}
                                                </td>
                                                
                                                <td>
                                                    ${rows["DUP_TIME"]}
                                                </td>
                                                <td>
                                                    ${rows["PARTS_WARRANTY"]}
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
</div>
<!-- End of Main Content -->

<!-- Add Parts to Device Modal-->
<div class="modal fade" id="dupModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Record Used Parts to Device</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
        
      <!-- FORM ASSIGN PARTS TO DEVICE -->
      <form action="../../registerDUPServlet" method="POST">
        <div class="modal-body">
            <input hidden="hidden" name="device_id" type="text" value="${param.id}">
            
            <sql:query var="partsData" dataSource="${myDatasource}">
                SELECT PARTS_ID, PARTS_NAME FROM PART
            </sql:query>
                
            <label>Parts Name</label>
            <input class="form-control" list="parts" name="part_id" required>
            <i>*Choose range of number has already registered</i>
            <datalist id="parts">
                <c:forEach var="row" items="${partsData.rows}">
                    <option value="${row['PARTS_ID']}">${row['PARTS_NAME']}</option>
                </c:forEach> 
            </datalist>
            <br>
            
            <label class="mt-3">Quantity Used:</label>
            <input class="form-control" min="1" type="number" name="dup_quantity" required>
            <br>            
        </div>
        <div class="modal-footer">
            <button class="btn btn-info" type="submit">Assign Parts</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@include file="footer.jsp" %>
