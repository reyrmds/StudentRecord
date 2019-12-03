<!DOCTYPE html>
<html>
<head>
     <title>Gradesheet | SRIS</title>
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
                <h1><i class="livicon" data-name="printer" data-size="25" data-loop="true"></i> Reports</h1>
				<ol class="breadcrumb">
                    <li>
                        <a href="${pageContext.request.contextPath}/resources/index.html">
                            <i class="livicon" data-name="home" data-size="18" data-loop="true"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#">Reports</a>
                    </li>
                    <li class="active">Gradesheet</li>
                </ol>
            </section>
            <!--section ends-->            
             <section class="content">
				
				 <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN EXAMPLE TABLE PORTLET-->                
                        <div class="portlet box" style="background-color:#5583A1;"font-color:#FFF">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="livicon" data-name="edit" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                                    Gradesheet Record 
                                    <c:forEach var="s" items="${getgradesheet1}">
                                    of ${s.record_section} ${s.subject_desc} - ${s.record_semester} - ${s.record_sy} - ${s.faculty_name}
                                     </c:forEach>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">
                                    <div class="btn-group">
                                        <button id="btn_add_cluster" class=" btn btn-custom"  style="background-color:#5583A1;" data-toggle="modal" data-href="#modaladd" href="#modaladd">
                                            Add New
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                    <div class="btn-group pull-right">
                                        <button class="btn dropdown-toggle btn-custom"  style="background-color:#5583A1;" data-toggle="dropdown"> 
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
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_editable_1" role="grid" style="font-size:100%;">
                                        <thead style="background-color:#AE0000;" >
                                            <tr role="row" style="color: #fff;">		                                                
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Student No.</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Student Name</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Final Grade</th>
                                                <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Remarks</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 100px;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="s" items="${getgradesheet}">
                                            <tr role="row" class="odd">
												<td>${s.student_number}</td>
												<td>${s.student_name}</td>
												<td>${s.record_grade}</td>
												<td>${s.record_remarks}</td>
                                               <td align="center">
													<a student-id="${s.student_id}" record-id="${s.record_id}" record-grade="${s.record_grade}" record-remarks="${s.record_remarks}" data-toggle="modal" data-target="#modalupdate">
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#EC971F" data-hc="#EC971F" ></i>
													</a>
													<a record-id="${s.record_id}" subject-code="${s.subject_code}" record-section="${s.record_section}" record-semester="${s.record_semester}" record-sy="${s.record_sy}" data-toggle="modal" data-target="#modaldelete2">
														<i class="livicon" data-name="remove" data-size="25" data-loop="true" data-c="#EF6F61" data-hc="#EF6F61" ></i>
													</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
										</tbody>
                                    </table>
                                </div>
								<form:form action="/sris/gradesheet_record/save" modelAttribute="student" method="post">

								<div class="modal fade in" id="modaladd" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">											
												<h4 class="modal-title"><center><b>STUDENT RECORD</b> </center></h4>  
												 <c:forEach var="s" items="${getgradesheet1}">
				                                   <center>of ${s.record_section} ${s.subject_desc} - ${s.record_semester} - ${s.record_sy}] -  ${s.faculty_name}</center>
			                                      </c:forEach>			
											</div>
											<div class="modal-body">										
												<div class="row">
													<div class="col-md-12">                 
													   <div class="form-group">
															<label class="col-md-3 control-label" for="txtStudname">Student Information</label>
															<div class="col-md-9">
																<fieldset>
																<form:select path="student_id" id="studentid" name="studentid" class="form-control select2">
																  <c:forEach items="${getstudent}" var="s">
															            <form:option value="${s.student_id}">${s.student_name}</form:option>
															      </c:forEach>
																</form:select>
																<c:forEach var="s" items="${gradesheet}">
																	<form:hidden path="subject_code"  id="subjectcode" name="subjectcode" class="form-control" value="${s.subject_code}"/>																	
									               					<form:hidden path="subject_id"  id="subject_id" name="subjectid" class="form-control" value="${s.subject_id}"/>
																	<form:hidden path="record_section" id="recordsection" name="recordsection" class="form-control" value="${s.record_section}"/>
																	<form:hidden path="record_sy" id="recordsy" name="recordsy" class="form-control" value="${s.record_sy}"/>
																	<form:hidden path="record_semester" id="recordsemester" name="recordsemester" class="form-control" value="${s.record_semester}"/>
																	<form:hidden path="faculty_id" id="facultyid" name="facultyid" class="form-control" value="${s.faculty_id}"/>
																</c:forEach>
																</fieldset>
															</div>
													   </div>
													</div>
												</div>
												<br/>
												<div class="row">
													<div class="col-md-12">                 
													   <div class="form-group">
															<label class="col-md-3 control-label" for="txtStudname">Final Grade</label>
															<div class="col-md-9">
																<fieldset>
																	<form:input path="record_grade"  type="number" id="recordgrade" name="recordgrade" placeholder="Enter student grade" class="form-control"/>
																</fieldset>
															</div>
													   </div>
													</div>
												</div>
												<br/>
												<div class="row">
				                                    <div class="col-md-12">                 
				                                       <div class="form-group">
					                                        <label class="col-md-3 control-label" for="txtStudname">Remarks</label>
					                                        <div class="col-md-9">                                         
																<%-- <form:input path="record_remarks" name="recordremarks" id="recordremarks" type="text" placeholder="Enter remarks" class="form-control"/>
					                                         --%>
					                                          <form:select path="record_remarks" id="recordremarks" name="recordremarks" placeholder="Enter remarks"  class="form-control select">
																	<form:option value="DROPPED">DROPPED</form:option>	
																	<form:option value="FAILED">FAILED</form:option>																		
																	<form:option value="INC">INC</form:option>	
																	<form:option value="NO FINALS">NO FINALS</form:option>	
																	<form:option value="NO GRADE">NO GRADE</form:option>	
																	<form:option value="NOT ENROLLED">NOT ENROLLED</form:option>
																	<form:option value="PASSED">PASSED</form:option>
																	<form:option value="TRANSFERRED">TRANSFERRED</form:option>		
																	<form:option value="WITHDRAWN">WITHDRAWN</form:option>
																</form:select>
					                                         </div>	
				                                       </div>
				                                    </div>
				                                </div>
												<br/>												
											<div class="modal-footer">
												<button type="button" data-dismiss="modal" class="btn">Close</button>
												<button type="submit" class="btn btn-primary">Save changes</button>
											</div>
										</div>
									</div>
								</div>
								</div>
								</form:form>

								<form:form method="post" action="/sris/gradesheet_record/update" modelAttribute="student" id="updateForm">            					
															
								<div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
										<div class="modal-header">
												<h4 class="modal-title"><center><b>STUDENT RECORD</b> </center></h4>  
												 <c:forEach var="s" items="${getgradesheet1}">
				                                    <center>of ${s.record_section} ${s.subject_desc} - ${s.record_semester} - ${s.record_sy}] -  ${s.faculty_name}</center>
			                                      </c:forEach>											
											</div>
											<div class="modal-body">											
												<div class="row">
													<div class="col-md-12">                 
													   <div class="form-group">
															<label class="col-md-3 control-label" for="txtStudname">Student Information</label>
															<div class="col-md-9">
																<fieldset>
																<form:select path="student_id" id="studentid" name="studentid" class="form-control select">
																  <c:forEach items="${getstudent}" var="s">
															            <form:option value="${s.student_id}">${s.student_name}</form:option>
															      </c:forEach>
																</form:select>
																</fieldset>
															</div>
													   </div>
													</div>
												</div>
												<br/>
												<div class="row">
													<div class="col-md-12">                 
													   <div class="form-group">
															<label class="col-md-3 control-label" for="txtStudname">Final Grade</label>
															<div class="col-md-9">
																<fieldset>
																	<form:input path="record_grade"  type="number" id="recordgrade" name="recordgrade" placeholder="Enter student grade" class="form-control"/>
																	<form:hidden path="record_id" id="recordid" name="recordid" class="form-control"/>
																	<c:forEach var="s" items="${gradesheet}">
																	<form:hidden path="subject_code"  id="subjectcode" name="subjectcode" class="form-control" value="${s.subject_code}"/>																	
									               					<form:hidden path="subject_id"  id="subject_id" name="subjectid" class="form-control" value="${s.subject_id}"/>
																	<form:hidden path="record_section" id="recordsection" name="recordsection" class="form-control" value="${s.record_section}"/>
																	<form:hidden path="record_sy" id="recordsy" name="recordsy" class="form-control" value="${s.record_sy}"/>
																	<form:hidden path="record_semester" id="recordsemester" name="recordsemester" class="form-control" value="${s.record_semester}"/>
																	<form:hidden path="faculty_id" id="facultyid" name="facultyid" class="form-control" value="${s.faculty_id}"/>
																	</c:forEach>
																
																</fieldset>
															</div>
													   </div>
													</div>
												</div>
												<br/>
												<div class="row">
				                                    <div class="col-md-12">                 
				                                       <div class="form-group">
					                                        <label class="col-md-3 control-label" for="txtStudname">Remarks</label>
					                                        <div class="col-md-9">                                         
					                                          <form:select path="record_remarks" id="recordremarks" name="recordremarks" placeholder="Enter remarks"  class="form-control select">
																	<form:option value="DROPPED">DROPPED</form:option>	
																	<form:option value="FAILED">FAILED</form:option>																		
																	<form:option value="INC">INC</form:option>	
																	<form:option value="NO FINALS">NO FINALS</form:option>	
																	<form:option value="NO GRADE">NO GRADE</form:option>	
																	<form:option value="NOT ENROLLED">NOT ENROLLED</form:option>
																	<form:option value="PASSED">PASSED</form:option>
																	<form:option value="TRANSFERRED">TRANSFERRED</form:option>		
																	<form:option value="WITHDRAWN">WITHDRAWN</form:option>
																</form:select>
					                                         </div>	
				                                       </div>
				                                    </div>
				                                </div>
											<br/>

												
											<div class="modal-footer">
												<button type="button" data-dismiss="modal" class="btn">Close</button>
												<button type="submit" class="btn btn-primary">Save changes</button>
											</div>
										</div>
									</div>
								
									</div>
								</div>
								</form:form>
								
								<form:form method="post" action="/sris/gradesheet_record/delete" modelAttribute="student" id="deleteForm">
								<div class="modal fade in" id="modaldelete2" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-body">
												<p>Would you like to delete this student grade ?</p>
											</div>
											<div class="modal-footer">
												
												<form:hidden path="subject_code"  id="subjectcode" name="subjectcode" class="form-control" />																	
				               					<form:hidden path="record_id"  id="recordid" name="recordid" class="form-control"/>
												<form:hidden path="record_section" id="recordsection" name="recordsection" class="form-control" />
												<form:hidden path="record_sy" id="recordsy" name="recordsy" class="form-control" />
												<form:hidden path="record_semester" id="recordsemester" name="recordsemester" class="form-control" />
												
												<button type="button" data-dismiss="modal" class="btn">Cancel</button>
												<button type="submit" class="btn btn-primary">Yes</button>
											</div>
										</div>
									</div>
								</div>
								</form:form>
								
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
   
    <!-- end of global js -->
 
 
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

    <!-- end of page level js -->
     <script>
         
         $('#modalupdate').on('show.bs.modal', function (e) {
          	  // get information to update quickly to modal view as loading begins
          	  var opener=e.relatedTarget;//this holds the element who called the modal

    	    var recordid=$(opener).attr('record-id');
          	var grade=$(opener).attr('record-grade');
         	var studentid=$(opener).attr('student-id');
         	var remarks=$(opener).attr('record-remarks');

          	  //set what we got to our form
         	  $('#updateForm').find('[id="recordid"]').val(recordid);
              $('#updateForm').find('[id="recordgrade"]').val(grade);
              $('#updateForm').find('[id="studentid"]').val(studentid);
              $('#updateForm').find('[id="recordremarks"]').val(remarks);
              
          	});
         
         $('#modaldelete2').on('show.bs.modal', function (e) {
         	  // get information to update quickly to modal view as loading begins
         	  var opener=e.relatedTarget;//this holds the element who called the modal

   	        var recordid=$(opener).attr('record-id');
         	var code=$(opener).attr('subject-code');
        	var section=$(opener).attr('record-section');
        	var sy=$(opener).attr('record-sy');
        	var semester=$(opener).attr('record-semester');

         	  //set what we got to our form
        	 $('#deleteForm').find('[id="recordid"]').val(recordid);
             $('#deleteForm').find('[id="subjectcode"]').val(code);
             $('#deleteForm').find('[id="recordsection"]').val(section);
             $('#deleteForm').find('[id="recordsy"]').val(sy);
             $('#deleteForm').find('[id="recordsemester"]').val(semester);
             
         	});
      </script>
</body>
</html>
