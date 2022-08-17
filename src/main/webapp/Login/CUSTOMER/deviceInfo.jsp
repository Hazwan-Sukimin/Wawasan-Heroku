<%-- 
    Document   : deviceInfo
    Created on : Feb 14, 2022, 1:44:19 AM
    Author     : user
--%>
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
                                <div class="row">
                                    <div class="col-6">
                                        Device Name: ${rows['DEVICE_NAME']}
                                    </div>
                                    <div class="col-6">
                                        Device Brand: ${rows['DEVICE_BRAND']}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        Device Model: ${rows['DEVICE_MODEL']}
                                    </div>
                                    <div class="col-lg-6">
                                        Device Type: ${rows['DEVICE_TYPE']}
                                    </div>                                    
                                </div>
                                </c:forEach>  
                                <hr class="sidebar-divider">
                                
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
                                                SELECT DATE_FORMAT(HISTORY_DATETIME, "%d-%m-%Y") AS HISTORY_DATE, 
                                                DATE_FORMAT(HISTORY_DATETIME, "%H:%i") AS HISTORY_TIME,
                                                STATUS_ID FROM STATUS_HISTORY WHERE DEVICE_ID = ${param.id} ORDER BY HISTORY_ID DESC
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
                                                <th>Warranty</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query var="dupData" dataSource="${myDatasource}">
                                                SELECT P.PARTS_NAME, P.PARTS_WARRANTY, DUP.QUANTITY, 
                                                DATE_FORMAT(DUP.DATE_USED, "%d-%m-%Y") AS DUP_DATE, DATE_FORMAT(DUP.DATE_USED, "%H:%i") AS DUP_TIME
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

<%@include file="footer.jsp" %>