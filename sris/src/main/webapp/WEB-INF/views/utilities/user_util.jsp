<!DOCTYPE html>
<html>
<head>

	<title>User Management | SRIS</title>
     <%@include file="../includes/head.jsp" %>
    <!-- end of global css -->    
    <!--page level css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/datatables/css/dataTables.colReorder.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/datatables/css/dataTables.scroller.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/datatables/css/dataTables.bootstrap.css" />
    <link href="${pageContext.request.contextPath}/resources/css/pages/tables.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendors/datatables/css/select2.css" />

    <link href="${pageContext.request.contextPath}/resources/vendors/modal/css/component.css" rel="stylesheet" />
	
	<link href="${pageContext.request.contextPath}/resources/css/pages/formelements.css" rel="stylesheet" />
		
	<link href="${pageContext.request.contextPath}/resources/vendors/select2/select2.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/select2/select2-bootstrap.css" />
    <!--end of page level css-->
</head>

<body class="skin-josh">

   <%@include file="../includes/header.jsp" %>
	
   <div class="wrapper row-offcanvas row-offcanvas-left">
		 <%@include file="../includes/sidebar.jsp" %>
		<!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <!--section starts-->			
                 <h1>User Accounts | Utilities</h1>
				<ol class="breadcrumb">
                    <li>
                        <a href="/sris/index">
                            <i class="livicon" data-name="home" data-size="18" data-loop="true"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#">Utilities</a>
                    </li>
                    <li class="active">User Accounts</li>
                </ol>
            </section>
            <!--section ends-->
            <section class="content paddingleft_right15">
              <div class="portlet box" style="background-color:#5583A1;font-color:#FFF">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="livicon" data-name="users" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                                    User Accounts
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">
                                    <div class="btn-group">
                                        <button id="btn_add_cluster" class=" btn btn-custom" style="background-color:#5583A1" data-toggle="modal" data-href="#modaladd" href="#modaladd">
                                            Restore all
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button class="btn dropdown-toggle btn-custom" style="background-color:#5583A1" data-toggle="dropdown"> 
                                            Tools
                                            <i class="fa fa-angle-down"></i>
                                        </button>
                                        <ul class="dropdown-menu pull-right">
                                            <li>
                                                <a href="#">Print</a>
                                            </li>
                                            <li>
                                                <a href="#">Save as PDF</a>
                                            </li>
                                            <li>
                                                <a href="#">Export to Excel</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div id="sample_editable_1_wrapper" class="">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_editable_1" role="grid">
                                        <thead style="background-color:#AE0000;" >
                                            <tr role="row" style="color: #fff;">       
                                                <th>Full Name</th>
												<th>Email</th>
												<th>Username</th>
												<th>Password</th>
                                                <th>Role</th>
                                                <th>Status</th>
												<th style="width:120px;">Actions</th>
											</tr>
										</thead>
										<tbody style="font-size:90%;">		
										<c:forEach var="s" items="${userlist}">																		
											<tr role="row" class="odd">
                                                <td>${s.user_full}</td>
                                                <td>${s.user_email}</td>
											    <td>${s.user_name}</td>
												<td>${s.user_pass}</td>
												<td>${s.user_role}</td>
												<td>Deleted</td>
												<td align="center">
													<a user-id="${s.user_id}" data-toggle="modal" data-target="#modaldelete">
														<i class="livicon" data-name="file-export" data-size="25" data-loop="true" data-c="#31B0D5" data-hc="#31B0D5" ></i>
													</a>
												</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
								
								<div class="modal fade in" id="modaladd" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
				                    <div class="modal-dialog modal-md">
				                        <div class="modal-content">
				                            <div class="modal-body">
				                                <p>Would you like to restore these user account(s) ?</p>
				                            </div>
				                            <div class="modal-footer">
				                                <button type="button" data-dismiss="modal" class="btn">Cancel</button>
				                                <button id="deletebutton1" type="button" data-dismiss="modal" class="btn btn-primary">Yes</button>
				                            </div>
				                        </div>
				                    </div>
				                </div>
								<div class="modal fade in" id="modaldelete" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-body">
												<p>Would you like to restore this user account ?</p>
											</div>
											<div class="modal-footer">
												<button type="button" data-dismiss="modal" class="btn">Cancel</button>
												<button id="deletebutton" type="button" data-dismiss="modal" class="btn btn-primary">Yes</button>
											</div>
										</div>
									</div>
								</div>


						   </div>
                        </div>              
			</section>
        
			<!-- content -->
        </aside>
        <!-- right-side -->
    </div>
    <!-- ./wrapper -->
    <%@include file="../includes/footer.jsp" %> 
    <!-- begining of page level js --> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendors/datatables/select2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendors/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendors/datatables/dataTables.bootstrap.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pages/table-editable.js"></script>

    <script src="${pageContext.request.contextPath}/resources/vendors/modal/js/classie.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/modal/js/modalEffects.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/pages/formelements.js" type="text/javascript"></script>
	 
	<script src="${pageContext.request.contextPath}/resources/vendors/input-mask/jquery.inputmask.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
	
	<script src="${pageContext.request.contextPath}/resources/vendors/select2/select2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/pages/formelements.js" type="text/javascript"></script>
    <script>
    $(document).ready(function() {
        $('#table').dataTable();
    });
    </script>
    <script type="text/javascript">
	   
	    $('#modaldelete').on('show.bs.modal', function (e) {
        	  // get information to update quickly to modal view as loading begins
        	  var opener=e.relatedTarget;//this holds the element who called the modal
        	   
        	  //we get details from attributes
        	  var userid=$(opener).attr('user-id');
        	  
        	  document.getElementById("deletebutton").onclick = function () {
      	    	window.location = 'user_util/restore/'+userid;
      	   	  };
      	    
        	});
	</script>
	<script type="text/javascript">
	   
	    $('#modaladd').on('show.bs.modal', function (e) {
        	  // get information to update quickly to modal view as loading begins
        	  var opener=e.relatedTarget;//this holds the element who called the modal
        	   
        	  document.getElementById("deletebutton1").onclick = function () {
      	    	window.location = 'user_util/restoreall';
      	   	  };
      	    
        	});
	</script>
    <!-- end of page level js -->
</body>
</html>
