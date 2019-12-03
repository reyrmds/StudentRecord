<!DOCTYPE html>
<html>
<head>
    <title>Faculty Record | SRIS</title>
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
        <!-- Left side column. contains the logo and sidebar -->
         <%@include file="../includes/sidebar.jsp" %>
	    <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <!--section starts-->
                <h1>Faculty | SRIS</h1>
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
                    <li class="active">Faculty Record</li>
                </ol>
            </section>
            <!--section ends-->
            <section class="content">
                
               <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                        <div class="portlet box" style="background-color:#5583A1;font-color:#FFF">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="livicon" data-name="edit" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                                    Faculty Record
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">
                                    <div class="btn-group">

                                    </div>
                                    <div class="btn-group pull-right">

                                    </div>
                                </div>
                                <div id="sample_editable_1_wrapper" class="">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_editable_1" role="grid">
                                        <thead style="background-color:#AE0000;" >
                                            <tr role="row" style="color: #fff;">
                                                <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Faculty Name</th>
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Total Record</th>       
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 120px;">Actions</th>                                             
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                        <c:forEach var="s" items="${facultylist}">
                                            <tr role="row" class="odd">
                                                <td>${s.faculty_name}</td> 
                                                <td>${s.record_total}</td> 
                                                <td align="center">
                                             	   
													<a faculty-id="${s.faculty_id}" faculty-name="${s.faculty_name}" data-toggle="modal" data-target="#modalupdate">
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#EC971F" data-hc="#EC971F" ></i>
													</a>
													<a faculty-id="${s.faculty_id}" record-total="${s.record_total}" data-toggle="modal" data-target="#modaldelete">
														<i class="livicon" data-name="remove" data-size="25" data-loop="true" data-c="#EF6F61" data-hc="#EF6F61" ></i>
													</a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                                
                            <form:form name="updateForm"  method="post" action="/sris/faculty_record_update/update" modelAttribute="student" id="updateForm">               
							<div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">												
										<h4 class="modal-title"><b>UPDATE FACULTY RECORD</b></h4>
									</div>
									<div class="modal-body">
										
		                                <div class="row">
		                                    <div class="col-md-12">                 
		                                       <div class="form-group">
			                                        <label class="col-md-3 control-label" for="txtStudname">Faculty Name</label>
			                                        <div class="col-md-9">                                         
														<input id="facultyname" readonly id="facultyname" type="text"class="form-control"/>
			                                        </div>	
		                                       </div>
		                                    </div>
		                                </div>
		                                <br/>
		                                <form:hidden path="record_id" id="recordid"></form:hidden>      
		                                
										<div class="row">			                                                                  	    
												<div class="col-md-12">        
														<div class="form-group">
															<label for="e1" class="col-md-3  control-label">
																Update Record to faculty 
															</label>
															
															<div class="col-md-9">											
																<form:select path="faculty_id"  id="facultyid" name="facultyid" class="form-control select2">
																  <c:forEach items="${getfaculty}" var="s">
															            <form:option value="${s.faculty_id}">${s.faculty_name}</form:option>
															      </c:forEach>
																</form:select>
															</div>
														</div>
													</div>
				                                </div> 
				                                
			                                <br/>
					                      <p><strong><center><b>Note:</b> The record of this faculty will be updated to the selected faculty</center></strong></p>   
										<div class="modal-footer">
											<button type="button" data-dismiss="modal" class="btn">Close</button>
											<button type="button" onclick="update()" class="btn btn-primary">Save changes</button>
										</div>
									</div>
							</div>
						</div>
						</div>
						</form:form>
						
								<div class="modal fade in" id="modaldelete" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
				                    <div class="modal-dialog modal-md">
				                        <div class="modal-content">
				                            <div class="modal-body">
				                                <p>Would you like to delete this faculty record ?</p>
				                            </div>
				                            <div class="modal-footer">
				                                <button type="button" data-dismiss="modal" class="btn">Cancel</button>
				                                <button id="deletebutton1" type="button" data-dismiss="modal" class="btn btn-primary">Yes</button>
				                            </div>
				                        </div>
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
	
	
    <script>
    $('#modaldelete').on('show.bs.modal', function (e) {
  	  // get information to update quickly to modal view as loading begins
  	  var opener=e.relatedTarget;//this holds the element who called the modal
  	   
  	  //we get details from attributes
  	 
  	  var facultyid=$(opener).attr('faculty-id');
  	  var recordtotal=$(opener).attr('record-total');
  	  
  	 
  	  document.getElementById("deletebutton1").onclick = function () {
  		 if(recordtotal==0) {
	    	window.location = 'faculty_record_update/delete/'+facultyid;
  		 }
  		 else{
  			 alert("The selected faculty appears to have records on the system");
  		 }
  	  };
	    
  	});
         
         $('#modalupdate').on('show.bs.modal', function (e) {
          	  // get information to update quickly to modal view as loading begins
          	  var opener=e.relatedTarget;//this holds the element who called the modal
          	   
          	  //we get details from attributes
          	  var facultyid=$(opener).attr('faculty-id');           	 
           	  var facultyname=$(opener).attr('faculty-name');

          	  //set what we got to our form
         	  $('#updateForm').find('[id="recordid"]').val(facultyid);
         	  $('#updateForm').find('[id="facultyname"]').val(facultyname);
             
            	
          	});
         
         function update(){
 			if(confirm("Are you sure you want to proceed?") == true){
 				document.getElementById('updateForm').submit();
 			}
 			else{
 				
 			}
 		}

       
      </script>
   
    <!-- end of page level js -->
</body>
</html>
