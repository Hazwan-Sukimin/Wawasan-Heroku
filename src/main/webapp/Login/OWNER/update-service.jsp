<%@include file="header.jsp" %>
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Content Row -->
                    <div class="row">
                        <div class="card shadow mb-4" style="width: 40%; margin:auto; display:block;">
                            <div class="card-header py-3" style="text-align:center;">
                                <h3>Service Information</h3>
                            </div>
                            
                            <sql:query var="service" dataSource="${myDatasource}">
                                SELECT * FROM services WHERE service_id = ${param.serviceid}
                            </sql:query>
                            <form method="POST" action="${pageContext.request.contextPath}/UpdateServices">    
                                <div class="card-body">
                                    <div class="modal-body">
                                      <div class="jarakInput">
                                        <label>Description</label>
                                        <textarea class="form-control" placeholder="Description" name="desc">${service.rows[0]['description']}</textarea>
                                      </div>

                                      <br>

                                      <div class="jarakInput">
                                        <label>Cost</label>
                                        <input type="number" class="form-control" value="${service.rows[0]['service_cost']}" name="cost" required>
                                      </div>

                                      <br>

                                      <div class="jarakInput">
                                        <label>Warranty</label>
                                        <input type="text" class="form-control" value="${service.rows[0]['service_warranty']}" name="warranty" required>
                                      </div>

                                      <br>

                                    </div>
                                </div>
                                      
                                <div class="modal-footer">
                                    <button class="btn btn-info" title="Back" type="Submit"><i class="fa-solid fa-arrow-left"></i>  </button>
                                    <button class="btn btn-danger" title="Delete" type="Submit"><i class="fa-solid fa-trash-can"></i>  </button>
                                    <button class="btn btn-info" 
                                            title="Update" type="Submit">  <i class="fa-solid fa-pen-to-square"></i> 
                                    
                                    </button>
                                    
                                    
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
<!-- End of Main Content -->
            
<%@include file="footer.jsp" %>
