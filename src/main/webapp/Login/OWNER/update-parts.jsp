<%@include file="header.jsp" %>
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Content Row -->
                    <div class="row">
                        <div class="card shadow mb-4" style="width: 40%; margin:auto; display:block;">
                            <div class="card-header py-3" style="text-align:center;">
                                <h3>Parts Information</h3>
                            </div>
                            
                            <sql:query var="part" dataSource="${myDatasource}">
                                SELECT * FROM part WHERE parts_id = ${param.partid}
                            </sql:query>
                                
                            <div class="card-body">
                                <form method="POST" action="../../UpdateParts" autocomplete="off"> 
                                    <input type="hidden" name="partsid" value="${part.rows[0]['parts_id']}">
                                    
                                    <div class="jarakInput ">
                                    <label for="uname"><a> Parts Name: </a></label>
                                    <input class="form-control" type="text" value="${part.rows[0]['parts_name']}" name="parts_name">
                                    </div>
                                    <hr class="sidebar-divider">
                                    
                                    
                                    <div class="jarakInput">
                                    <label for="uname"><a> Buy Cost: </a></label><br>
                                    <input class="form-control" type="text" value="${part.rows[0]['parts_buy_cost']}" name="parts_buy">
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> Sell Cost: </a></label><br>
                                    <input class="form-control" type="text" value="${part.rows[0]['parts_sell_cost']}" name="parts_sell">
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> Quantity: </a></label><br>
                                    <input  class="form-control" type="text" value="${part.rows[0]['parts_qty']}" name="parts_qty">
                                    </div>
                                    
                                    <hr class="sidebar-divider">
                                    <div class="jarakInput">
                                    <label for="email"><a> Warranty:</a></label>
                                    <input  class="form-control" type="text" value="${part.rows[0]['parts_warranty']}" name="parts_warranty">

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
