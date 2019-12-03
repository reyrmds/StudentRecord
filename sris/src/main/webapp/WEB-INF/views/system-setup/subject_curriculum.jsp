<!DOCTYPE html>
<html>
<head>
	<title>Curriculum Subjects | SRIS</title>
    <%@include file="../includes/head.jsp" %>
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
                <h1>Curriculum Subjects | SRIS</h1>
                <ol class="breadcrumb">
                    <li>
                        <a href="/sris/index">
                            <i class="livicon" data-name="home" data-size="18" data-loop="true"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#">System Configuration</a>
                    </li>
                    <li class="active">Curriculum Subjects</li>
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
                                	Curriculum Subjects
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">
                                    <div class="btn-group">
                                        <button id="btn_add_cluster" class=" btn btn-custom" style="background-color:#5583A1" data-toggle="modal" data-href="#modaladd" href="#modaladd">
                                            Add New
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
                                                <a onclick="printDiv();">Print</a>
                                                
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
                                         	    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >Curriculum Year</th> 	
                                         	    <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >School Year</th> 
												<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >Sem</th> 										  					 															 												  					 												
												<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >Course</th> 												  					 															 												  					 												
												<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >Subject Code</th>							
												<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >Description</th>							
												<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >Units</th>																							              
												<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1"  >Faculty Name</th>  
												<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width:100px;">Actions</th>   
												
											</tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                          <c:forEach var="s" items="${getcurriculumsubjects}">
                                            <tr role="row" class="odd">
                                                <td>${s.curriculum_sy}</td>
                                                <td>${s.sy_sy}</td>
                                                <td>${s.semester_semester}</td>
	                                            <td>${s.course_code}</td>
												<td>${s.subject_code}</td>
												<td>${s.subject_desc}</td>
												<td>${s.subject_units}</td>	
												<td>${s.faculty_name}</td>
                                                
                                             
												<td align="center">
													<a ref-id="${s.ref_id}" curriculum-id="${s.curriculum_id}" course-id="${s.course_id}" semester-id="${s.semester_id}"  sy-id="${s.sy_id}" facultysubject-id="${s.facultysubject_id}" data-toggle="modal" data-target="#modalupdate">
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#EC971F" data-hc="#EC971F" ></i>
													</a>
													<a ref-id="${s.ref_id}" data-toggle="modal" data-target="#modaldelete2">
														<i class="livicon" data-name="remove" data-size="25" data-loop="true" data-c="#EF6F61" data-hc="#EF6F61" ></i>
													</a>
                                                </td>
                                            </tr>
                                             </c:forEach>	
                  			          </tbody>								
                                    </table>
                                </div>
								<form:form action="subject_curriculum_setup/save" modelAttribute="student" method="post">
               						
								<div class="modal fade in" id="modaladd" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">Curriculum Subjects</h4>
											</div>
											<div class="modal-body">
											  
											  <div class="row">			                                                                  	    
													<div class="col-md-12">        
															<div class="form-group">
																<label for="e1" class="col-md-3  control-label">
																	Curriculum
																</label>
																<div class="col-md-9">											
																	<form:select path="curriculum_id" id="curriculumid" name="curriculumid" class="form-control select2">
																	  <c:forEach items="${getcurriculum}" var="s">
																            <form:option value="${s.curriculum_id}">${s.curriculum_sy}</form:option>
																      </c:forEach>
																	</form:select>
																</div>
															</div>
														</div>
					                                </div>    
				                                <br/>
											  <div class="row">
													<div class="col-md-12">    
						                                <div class="form-group">
					                                        <label class="col-md-3 control-label" for="txtStudname">School Year</label>
					                                        <div class="col-md-9">                                         
															    <form:select path="sy_id" id="syid" name="syid" placeholder="Select School Year"  class="form-control select">																	
																	<c:forEach var="s" items="${getsy}">
																		<form:option value="${s.sy_id}">${s.sy_sy}</form:option>	
																	</c:forEach>																																		
															 	</form:select>  
					                                      </div>	
														</div>
													</div>
												</div>
												<br/>
												<div class="row">
													<div class="col-md-12">        
														<div class="form-group">
															<label for="e1" class="col-md-3  control-label">
																Semester
															</label>
															<div class="col-md-9">
																<form:select path="semester_id" id="semesterid" name="semesterid" placeholder="Enter semester"  class="form-control select">
																	<c:forEach var="s" items="${getsemester}">
																		<form:option value="${s.semester_id}">${s.semester_semester}</form:option>																	
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</div>
				                                </div>
				                                <br/>
											  <div class="row">			                                                                  	    
													<div class="col-md-12">        
															<div class="form-group">
																<label for="e1" class="col-md-3  control-label">
																	Course
																</label>
																<div class="col-md-9">											
																	<form:select path="course_id" id="courseid" name="courseid" class="form-control select2">
																	  <c:forEach items="${getcourse}" var="s">
																            <form:option value="${s.course_id}">${s.course_course}</form:option>
																      </c:forEach>
																	</form:select>
																</div>
															</div>
														</div>
					                                </div>    
				                                <br/>
				                                 								 	
											    <div class="row">			                                                                        	    
													<div class="col-md-12">        
														<div class="form-group">
															<label for="e1" class="col-md-3  control-label">
																Faculty Subject
															</label>
															<div class="col-md-9">											
																<form:select path="facultysubject_id" id="facultysubjectid" name="facultysubjectid" class="form-control select2">
																  <c:forEach items="${getfacultysubject}" var="s">
															           <form:option value="${s.facultysubject_id}">${s.subject_code} - ${s.subject_desc} - ${s.subject_units} - ${s.faculty_name} </form:option>															     
															      </c:forEach>
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

								<form:form   method="post" action="subject_curriculum_setup/update" modelAttribute="student" id="updateForm">
               
								<div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title">Curriculum Subjects</h4>
											</div>
											<div class="modal-body">
											<form:hidden path="ref_id" id="refid" name="refid" class="form-control"/>
											<div class="row">			                                                                  	    
													<div class="col-md-12">        
															<div class="form-group">
																<label for="e1" class="col-md-3  control-label">
																	Curriculum
																</label>
																<div class="col-md-9">											
																	<form:select path="curriculum_id" id="curriculumid" name="curriculumid" class="form-control select">
																	  <c:forEach items="${getcurriculum}" var="s">
																            <form:option value="${s.curriculum_id}">${s.curriculum_sy}</form:option>
																      </c:forEach>
																	</form:select>
																</div>
															</div>
														</div>
					                                </div>    
				                                <br/>
											  <div class="row">
													<div class="col-md-12">    
						                                <div class="form-group">
					                                        <label class="col-md-3 control-label" for="txtStudname">School Year</label>
					                                        <div class="col-md-9">                                         
															    <form:select path="sy_id" id="syid" name="syid" placeholder="Select School Year"  class="form-control select">																	
																	<c:forEach var="s" items="${getsy}">
																		<form:option value="${s.sy_id}">${s.sy_sy}</form:option>	
																	</c:forEach>																																		
															 	</form:select>
					                                      </div>	
														</div>
													</div>
												</div>
												<br/>
												<div class="row">
													<div class="col-md-12">        
														<div class="form-group">
															<label for="e1" class="col-md-3  control-label">
																Semester
															</label>
															<div class="col-md-9">
																<form:select path="semester_id" id="semesterid" name="semesterid" placeholder="Enter semester"  class="form-control select">
																	<c:forEach var="s" items="${getsemester}">
																		<form:option value="${s.semester_id}">${s.semester_semester}</form:option>																	
																	</c:forEach>
																</form:select>
															</div>
														</div>
													</div>
				                                </div>
				                                <br/>
											 <div class="row">			                                                                  	    
													<div class="col-md-12">        
															<div class="form-group">
																<label for="e1" class="col-md-3  control-label">
																	Course
																</label>
																<div class="col-md-9">											
																	<form:select path="course_id" id="courseid" name="courseid" class="form-control select">
																	  <c:forEach items="${getcourse}" var="s">
																            <form:option value="${s.course_id}">${s.course_course}</form:option>
																      </c:forEach>
																	</form:select>
																</div>
															</div>
														</div>
					                                </div>    
				                                <br/>				                                 								 	
											    <div class="row">			                                                                        	    
												<div class="col-md-12">        
														<div class="form-group">
															<label for="e1" class="col-md-3  control-label">
																Faculty Subject
															</label>
															<div class="col-md-9">											
																<form:select path="facultysubject_id" id="facultysubjectid" name="facultysubjectid" class="form-control select">
																  <c:forEach items="${getfacultysubject}" var="s">
															           <form:option value="${s.facultysubject_id}">${s.subject_code} - ${s.subject_desc} - ${s.subject_units} - ${s.faculty_name} </form:option>															     
															      </c:forEach>
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
	
								<div class="modal fade in" id="modaldelete2" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
									<div class="modal-dialog modal-md">
										<div class="modal-content">
											<div class="modal-body">
												<p>Would you like to delete this student grade ?</p>
											</div>
											<div class="modal-footer">
												<button type="button" data-dismiss="modal" class="btn">Cancel</button>
												<button  id="delbut" type="button" data-dismiss="modal" class="btn btn-primary">Yes</button>
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
    <!-- end of global js -->
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
	
	<script type="text/javascript">
	   
	    $('#modaldelete2').on('show.bs.modal', function (e) {
        	  // get information to update quickly to modal view as loading begins
        	  var opener=e.relatedTarget;//this holds the element who called the modal
        	   
        	  //we get details from attributes
        	  var refid=$(opener).attr('ref-id');
        	
        	  
        	  document.getElementById("delbut").onclick = function () {
      	    	window.location = 'subject_curriculum_setup/delete/'+refid;
      	   	  };
      	   	  
      
      	    
        	});
	</script>
    <script>
         
         $('#modalupdate').on('show.bs.modal', function (e) {
          	  // get information to update quickly to modal view as loading begins
          	  var opener=e.relatedTarget;//this holds the element who called the modal

          	var refid=$(opener).attr('ref-id');
          	var curriculumid=$(opener).attr('curriculum-id');
          	var courseid=$(opener).attr('course-id');
         	var syid=$(opener).attr('sy-id');
         	var semesterid=$(opener).attr('semester-id');
         	var facultysubjectid=$(opener).attr('facultysubject-id');

         	  $('#updateForm').find('[id="refid"]').val(refid);
         	  $('#updateForm').find('[id="curriculumid"]').val(curriculumid);
          	  $('#updateForm').find('[id="courseid"]').val(courseid);
              $('#updateForm').find('[id="syid"]').val(syid);
              $('#updateForm').find('[id="semesterid"]').val(semesterid);
              $('#updateForm').find('[id="facultysubjectid"]').val(facultysubjectid);

              
          	});
      </script>
   
   
    <!-- end of page level js -->
</body>
</html>
