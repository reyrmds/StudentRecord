<!DOCTYPE html>
<html>
<head>
    <title>Student Record | SRIS</title>
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
                <h1>Student Record | SRIS</h1>
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
                    <li class="active">Student Record</li>
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
                                    Student Record
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">
                                    <div class="btn-group">
                                            
                                    </div>
                                    <div class="btn-group pull-right">
                                     	  <a onClick="window.location = '/sris/student_record_update/A-B';">A-B</a>
                                          <a onClick="window.location = '/sris/student_record_update/C-D';">C-D</a>
                                          <a onClick="window.location = '/sris/student_record_update/E-F';">E-F</a>
                                          <a onClick="window.location = '/sris/student_record_update/G-H';">G-H</a>
                                          <a onClick="window.location = '/sris/student_record_update/I-J';">I-J</a>
                                          <a onClick="window.location = '/sris/student_record_update/K-L';">K-L</a>
                                          <a onClick="window.location = '/sris/student_record_update/M-N';">M-N</a>
                                          <a onClick="window.location = '/sris/student_record_update/O-P';">O-P</a>
                                          <a onClick="window.location = '/sris/student_record_update/Q-R';">Q-R</a>
                                          <a onClick="window.location = '/sris/student_record_update/S-T';">S-T</a>
                                          <a onClick="window.location = '/sris/student_record_update/U-V';">U-V</a>
                                          <a onClick="window.location = '/sris/student_record_update/W-Z';">W-Z</a> 
                                    </div>
                                </div>
                                <div id="sample_editable_1_wrapper" class="">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_editable_1" role="grid">
                                        <thead style="background-color:#AE0000;" >
                                            <tr role="row" style="color: #fff;">
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Student Number</th>
                                                <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Student Name</th>
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Total Record</th>       
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 120px;">Actions</th>                                             
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                        <c:forEach var="s" items="${studentlist}">
                                            <tr role="row" class="odd">
                                            
                                                <td>${s.student_number}</td>
                                                <td>${s.student_name}</td> 
                                                <td>${s.record_total}</td> 
                                                <td align="center">
                                             	   
													<a student-id="${s.student_id}" student-number="${s.student_number}" student-name="${s.student_name}" data-toggle="modal" data-target="#modalupdate">
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#EC971F" data-hc="#EC971F" ></i>
													</a>
													<a student-id="${s.student_id}" record-total="${s.record_total}" data-toggle="modal" data-target="#modaldelete">
														<i class="livicon" data-name="remove" data-size="25" data-loop="true" data-c="#EF6F61" data-hc="#EF6F61" ></i>
													</a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
                                
                            <form:form name="updateForm"  method="post" action="/sris/student_record_update/update" modelAttribute="student" id="updateForm">               
							<div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">												
										<h4 class="modal-title"><b>UPDATE STUDENT RECORD</b></h4>
									</div>
									<div class="modal-body">
										<div class="row">
		                                    <div class="col-md-12">                 
		                                       <div class="form-group">
			                                        <label class="col-md-3 control-label" for="txtStudno">Student Number</label>
			                                        <div class="col-md-9">
			                                            <fieldset>                            
			                                            	<input id="studentnumber" readonly type="text" class="form-control"/>
			                                       		</fieldset>
			                                        </div>									
		                                       </div>
		                                    </div>
		                                </div>
										<br/>
		                                <div class="row">
		                                    <div class="col-md-12">                 
		                                       <div class="form-group">
			                                        <label class="col-md-3 control-label" for="txtStudname">Student Name</label>
			                                        <div class="col-md-9">                                         
														<input id="studentname" readonly id="studentname" type="text"class="form-control"/>
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
																Update Record to Student 
															</label>
															
															<div class="col-md-9">											
																<form:select path="student_id"  id="studentid" name="studentid" class="form-control select2">
																  <c:forEach items="${getstudent}" var="s">
															            <form:option value="${s.student_id}">${s.student_name}</form:option>
															      </c:forEach>
																</form:select>
															</div>
														</div>
													</div>
				                                </div> 
				                                
			                                <br/>
					                      <p><strong><center><b>Note:</b> The record of this student will be updated to the selected student</center></strong></p>   
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
				                                <p>Would you like to delete this student record ?</p>
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
  	 
  	  var studentid=$(opener).attr('student-id');
  	  var recordtotal=$(opener).attr('record-total');
  	  
  	 
  	  document.getElementById("deletebutton1").onclick = function () {
  		 if(recordtotal==0) {
	    	window.location = 'student_record_update/delete/'+studentid;
  		 }
  		 else{
  			 alert("The selected student appears to have records on the system");
  		 }
  	  };
	    
  	});
         
         $('#modalupdate').on('show.bs.modal', function (e) {
          	  // get information to update quickly to modal view as loading begins
          	  var opener=e.relatedTarget;//this holds the element who called the modal
          	   
          	  //we get details from attributes
          	  var studentid=$(opener).attr('student-id');
           	  var studentnumber=$(opener).attr('student-number');
           	  var studentname=$(opener).attr('student-name');

          	  //set what we got to our form
         	  $('#updateForm').find('[id="recordid"]').val(studentid);
         	  $('#updateForm').find('[id="studentnumber"]').val(studentnumber);
         	  $('#updateForm').find('[id="studentname"]').val(studentname);
             
            	
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
