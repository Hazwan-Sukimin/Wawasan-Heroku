<%@page import="java.sql.DriverManager"%>
<%@include file="header.jsp" %>
<sql:query var="result" dataSource="${myDatasource}">
    SELECT * FROM repair_job rj JOIN customer c ON rj.customer_id = c.customer_id JOIN device d ON d.device_id = rj.device_id JOIN services s ON s.service_id = rj.service_id  WHERE c.customer_id = ${customer.customer_id}
</sql:query>
    
<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          
          <p class="mb-4"> </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3 h3">
                <div class="row">
                    <div class="col"><h1 class="h3 mb-2 text-gray-800">Make Payment</h1></div>
                    <div class="col-2"><a class="btn btn-info" href="#" data-toggle="modal" data-target="#Instruction">Instruction</a></div>
                </div>
            </div>
            <div class="card-body">
            <form action="${pageContext.request.contextPath}/UpdatePayment" method="POST">
              <div class="table-responsive">
                <table class="table table-bordered table-striped" id="fileTable" width="100%" cellspacing="0">
                  <thead>
                    <tr style="text-align: center;">
                        <th width="5%">No.</th>
                        <th>Order No.</th>
                        <th>Devices</th>
                        <th>Services</th>
                        <th>Order Status</th>
                        <th>Price</th>
                        <th width="5%">View</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <c:forEach var="row" items="${result.rows}" varStatus="counter">
                      <tr style="text-align: center;">
                        
                        <td>${counter.count}</td>
                        <td>${row["repair_job_id"]}</td>
                        <td>${row["name"]}</td>
                        <td>${row["title"]}</td>
                        <td>
                            <c:choose>
                                <c:when test="${row['status']=='FINISHED'}">
                                    <p class="btn btn-warning ">${row["status"]}</p>
                                </c:when>
                                <c:when test="${row['status']=='PAID'}">
                                    <p class="btn btn-success ">${row["status"]}</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="btn btn-info ">${row["status"]}</p>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        
                        <td>RM ${row["total_price"]}</td>
                        
                        
                        <td>
                            <c:if test="${row['status'] == 'FINISHED'}">
                                <div class="form-check">
                                    <input class="form-check-input" name="repair_job_id" type="checkbox" value="${row["repair_job_id"]}">
                                </div>
                            </c:if>
                            
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  
                    <tfoot>
                        <tr style="text-align: center;">
                        <th width="5%">No.</th>
                        <th>Order No.</th>
                        <th>Devices</th>
                        <th>Services</th>
                        <th>Order Status</th>
                        <th>Price</th>
                        <th width="25%"> <input type="submit" class="btn btn-primary col-6" id="submit" value="Pay"></th>
                    </tr>
                    </tfoot>
                </table>
              </div>
            </form>
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
                title: 'Payment Failed',
                text: 'No checkbox is selected!',
            }).then(function(){
                location='${pageContext.request.contextPath}/Login/CUSTOMER/payment.jsp';
            });


        </c:when>

        <c:when test="${msgs.equals('Success')}">

            Swal.fire({
                icon: 'success',
                title: 'Succesfully Paid',
                text: 'Repairjob successfully been pay!',
            }).then(function(){
                location='${pageContext.request.contextPath}/Login/CUSTOMER/payment.jsp';
            });

        </c:when>

        <c:otherwise>
        </c:otherwise>
    </c:choose>
</script>
<%@include file="footer.jsp" %>