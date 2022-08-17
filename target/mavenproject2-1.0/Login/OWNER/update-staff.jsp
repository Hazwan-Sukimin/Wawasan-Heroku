<%@include file="header.jsp" %>
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Content Row -->
                    <div class="row">
                        <div class="card shadow mb-4" style="width: 40%; margin:auto; display:block;">
                            <div class="card-header py-3" style="text-align:center;">
                                <h3>Technician Information</h3>
                            </div>
                            
                            <sql:query var="staff" dataSource="${myDatasource}">
                                SELECT * FROM staff WHERE staff_id = ${param.staffid}
                            </sql:query>
                                
                            <div class="card-body">
                                <form method="POST" action="../../updateTechnician"> 
                                    <input type="hidden" name="staffid" value="${staff.rows[0]['staff_id']}">
                                    <div class="jarakInput ">
                                    <label for="uname"><a> My Staff ID : ${staff.rows[0]['staff_id']}</a></label>
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> My Account Password: Password</a></label><br>
                                    <input class="form-control" type="text" placeholder="Password" name="update_staff_password">
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="uname"><a> My Name: ${staff.rows[0]['staff_name']}</a></label><br>
                                    <input class="form-control" type="text" placeholder="Name" name="update_staff_name">
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> My Phone Number: ${staff.rows[0]['staff_phone']}</a></label><br>
                                    <input class="form-control" type="text" placeholder="Phone" name="update_staff_phone">
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> My Address: ${staff.rows[0]['staff_address']}</a></label><br>
                                    <input  class="form-control" type="text" placeholder="Address" name="update_staff_address">
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> Account Access: ${staff.rows[0]['staff_access']}</a></label>
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> Account Status: ${staff.rows[0]['account_status']}</a></label>
                                    </div>
                                    
                                    <br><br>
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                        <button class="btn btn-info" type="submit">Update Information</button>
                                    </div>                                    
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
<!-- End of Main Content -->
            
<%@include file="footer.jsp" %>
