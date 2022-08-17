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
                    
                    <sql:query var="repairJobData" dataSource="${myDatasource}">
                        SELECT REPAIR_ID, REPAIR_DESC,
                        DATE_FORMAT(REPAIR_DATETIME, "%d-%m-%Y") AS REPAIR_DATE, DATE_FORMAT(REPAIR_DATETIME, "%k:%i") AS REPAIR_TIME,
                      STATUS_ID, REPAIR_PRICE FROM REPAIR_JOB where REPAIR_ID = ${param.id}
                    </sql:query>
                    <!-- Content Row -->
                    <div class="row">
                        <c:forEach var="row" items="${repairJobData.rows}">
                        <div class="card shadow mb-4" style="width: 30%; margin:auto; display:block;">
                            <div class="card-header py-3" style="text-align:center;">
                                <h3>Repair Order Details</h3>
                            </div>
                            <div class="card-body">
                                <div class="jarakInput">
                                    <label style="font-weight: bold;">Repair Order ID: </label>
                                    <p>${row["REPAIR_ID"]}</p>
                                </div>
                                
                                <hr class="sidebar-divider">
                                <div class="jarakInput">
                                    <label style="font-weight: bold;">Repair Order Date: </label>
                                    <p>${row["REPAIR_DATE"]}</p>
                                </div>
                                
                                <hr class="sidebar-divider">
                                <div class="jarakInput">
                                    <label style="font-weight: bold;">Repair Order Time: </label>
                                    <p>${row["REPAIR_TIME"]}</p>
                                </div>
                                
                                <hr class="sidebar-divider">
                                <div class="jarakInput">
                                    <label style="font-weight: bold;">Repair Cost: </label>
                                    <p>
                                    <c:if test="${row['REPAIR_PRICE'] == null}">
                                        <button class="btn btn-secondary" style="pointer-events: none;">Not Available</button>
                                    </c:if>
                                    <c:if test="${row['REPAIR_PRICE'] != null}">
                                        ${row['REPAIR_PRICE']}
                                    </c:if>
                                    </p>
                                </div>
                                
                                <hr class="sidebar-divider">
                                <div class="jarakInput " style="margin-bottom:20px;">
                                    <label style="font-weight: bold;">Repair Order Description : </label>
                                    <p>${row["REPAIR_DESC"]}</p>
                                </div>
                                
                                <hr class="sidebar-divider">
                                <div class="jarakInput " style="margin-bottom:20px;">
                                    <label style="font-weight: bold;">Repair Order Status : </label>
                                    <p>
                                        <c:if test="${row['STATUS_ID'] == 5}">
                                            <button class="btn btn-secondary" style="pointer-events: none;">UNASSIGNED</button>
                                            <hr class="sidebar-divider">
                                        </c:if>
                                        <c:if test="${row['STATUS_ID'] == 6}">
                                            <button class="btn btn-warning" style="pointer-events: none;">ASSIGNED</button>
                                            <hr class="sidebar-divider">
                                        </c:if>
                                        <c:if test="${row['STATUS_ID'] == 4}">
                                            <button class="btn text-white" style="pointer-events: none; background-color: #007bff">IN PROGRESS</button>
                                            <hr class="sidebar-divider">
                                        </c:if>
                                        <c:if test="${row['STATUS_ID'] == 1}">
                                            <button class="btn btn-success" style="pointer-events: none;">FINISHED</button>
                                        </c:if>
                                        <c:if test="${row['STATUS_ID'] == 9}">
                                            <button class="btn btn-success" style="pointer-events: none;">PAID & COLLECTED</button>
                                        </c:if>  
                                    </p>
                                </div>
                                <br/>
                                <c:if test="${row['STATUS_ID'] == 1}">
                                    <hr class="sidebar-divider">
                                    <a href="#" data-toggle="modal" data-target="#paymentModal">
                                        <button class="btn btn-primary" type="submit" name="" value="">Click Here to Pay</button>
                                    </a>
                                </c:if>
                        </c:forEach>
                            </div>
                        </div>
                        
                        
                        <div class="card shadow " style="width: 65%; margin-left: 50px; height: 30%;">
                            <div class="card-header" style="text-align:center;">
                                <h3>Device Repair Status</h3>
                            </div>
                            <div class="card-body">
                                <sql:query var="deviceData" dataSource="${myDatasource}">
                                    SELECT * FROM DEVICE D JOIN STATUS_HISTORY SH ON D.DEVICE_ID = SH.DEVICE_ID
                                    WHERE REPAIR_ID = ${param.id}
                                    ORDER BY HISTORY_ID DESC LIMIT 1
                                </sql:query>
                                <div class="table-responsive">
                                    
                                    <table class="table table-bordered" id="fileTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr style="text-align: center;">
                                                <th width="3%">No.</th>
                                                <th>Name</th>
                                                <th>Model</th>
                                                <th width="20%">Status</th>
                                                <th width="5%">View</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="row" items="${deviceData.rows}" varStatus="counter">
                                            <tr style="text-align: center;">
                                                <td>
                                                    ${counter.count}
                                                </td>
                                                
                                                <td>
                                                   ${row['DEVICE_NAME']}
                                                </td>
                                                
                                                <td>
                                                   ${row['DEVICE_MODEL']}
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
                                                
                                                <td>
                                                    <a target='_self' href='deviceInfo.jsp?id=${row['DEVICE_ID']}'>
                                                        <button style='margin:auto; display:block;' class='btn btn-primary btn-circle' type='button' style='cursor: pointer;'>
                                                            <span><i style='color:white;'class='fa fa-arrow-right'></i></span>
                                                        </button>
                                                    </a>
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

<!-- Payment Modal-->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Make Payment</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div> 
      <form action="../../registerPaymentServlet" method="POST">
        <div class="modal-body">
            <input hidden="hidden" name="repair_id" type="text" value="${param.id}">
            
            <label>Payment Type</label>
            <select class="form-control" name="payment_type">
                <option disabled="disabled" selected="selected">-- Choose One --</option>
                <option value="Credit/Debit Card">Credit/Debit Card</option>
                <option value="FPX Online">FPX Online</option>
                <option value="Cash">Cash</option>
            </select>
        </div>
        <div class="modal-footer">
            <button class="btn btn-info" type="submit">Pay Now</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@include file="footer.jsp" %>