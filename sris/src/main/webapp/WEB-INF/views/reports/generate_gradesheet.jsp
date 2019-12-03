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
        <!-- Left side column. contains the logo and sidebar -->
        <%@include file="../includes/sidebar.jsp" %>
	   
	   <!-- Right side column. Contains the navbar and content of the page -->
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <!--section starts-->
                <h1><i class="livicon" data-name="printer" data-size="25" data-loop="true"></i> Reports</h1>
				<ol class="breadcrumb">
                    <li>
                        <a href="/sris/index">
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
                        
                        <form:form action="/sris/gradesheet/search" modelAttribute="student" method="post">     
						<div class="portlet box" style="background-color:#5583A1;font-color:#FFF">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="livicon" data-name="search" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                                    Search Record
                                </div>
                            </div>
							
                            <div class="portlet-body">                                 
								  <div class="form-group">
                                    <label for="single-append-text" class="control-label-3">
                                        Subject Description
                                    </label>
                                    <div class="input-group select2-bootstrap-append">
                                        <form:select path="facultysubject_id" id="facultysubjectid" name="facultysubjectid" class="form-control select2">
										  <c:forEach items="${getfacultysubject}" var="s">
									            <form:option value="${s.facultysubject_id}">${s.subject_code} - ${s.subject_desc} - ${s.subject_units} - ${s.faculty_name} </form:option>
									      </c:forEach>
										</form:select>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default"  type="submit" data-select2-open="single-append-text">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                        </span>                                      
                                    </div>							
                                </div>                              
                            </div>
                        </div>
                        </form:form>
                                           
                        <div class="portlet box" style="background-color:#5583A1;font-color:#FFF">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="livicon" data-name="edit" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                                    Gradesheet Record
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
                                       		    <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Subject Code</th>	                                                
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Description</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Units</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Course</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Section</th>                              
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">School Year</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Semester</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Faculty Name</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 200px;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                         
                                        <c:forEach var="s" items="${getrecord}">
                                            <tr role="row" class="odd">
												<td>${s.subject_code}</td>
												<td>${s.subject_desc}</td>
                                                <td>${s.subject_units}</td>
                                                <td>${s.course_code}</td>
												<td>${s.section_section}</td>		
												<td>${s.sy_sy}</td>            
												<td>${s.semester_semester}</td> 
												<td>${s.faculty_name}</td>                                               												
                                                <td align="center">
                                                	<a class="btn viewbtn" course-id="${s.course_id}" section-id="${s.section_id}" sy-id="${s.sy_id}" semester-id="${s.semester_id}" facultysubject-id="${s.facultysubject_id}">
														<i class="livicon" data-name="eye-open" data-size="25" data-loop="true" data-c="#31B0D5" data-hc="#31B0D5" ></i>
													</a>                                         	
                                               	    <a class="btn updatebtn" course-id="${s.course_id}" section-id="${s.section_id}" sy-id="${s.sy_id}" semester-id="${s.semester_id}" facultysubject-id="${s.facultysubject_id}" data-toggle="modal" data-target="#modalupdate" id="updatebtn" > 
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#418BC1" data-hc="#418BC1" ></i>
													</a>
													<a class="btn editbtn" course-id="${s.course_id}" section-id="${s.section_id}" sy-id="${s.sy_id}" semester-id="${s.semester_id}" facultysubject-id="${s.facultysubject_id}" > 
														<i class="livicon" data-name="printer" data-size="25" data-loop="true" data-c="#418BC1" data-hc="#418BC1" ></i>
													</a>
                                                 </td>					                 
                                            </tr>	
                                        </c:forEach>                                        							
                                        </tbody>
                                    </table>
                                </div>
                                
                                <!-- END EXAMPLE TABLE PORTLET-->
                            </div>
                        </div>
                        <form:form class="form-horizontal" method="post" action="/sris/gradesheet/print" modelAttribute="student" id="searchForm">				                         
	                        <form:hidden path="course_id" id="courseid" name="courseid"   />
	           				<form:hidden path="section_id" id="sectionid" name="sectionid" />	
	           				<form:hidden path="sy_id" id="syid" name="syid" />				                            
	                        <form:hidden path="semester_id" id="semesterid" name="semesterid" />				                            
	                        <form:hidden path="facultysubject_id" id="facultysubjectid" name="facultysubjectid" />	
                		 </form:form>
                		 
                		<form:form  name="addForm" id="addForm" action="/sris/gradesheet/save" modelAttribute="student" method="post">               						
							<div class="modal fade in" id="modaladd" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">									
										<h4 class="modal-title"><b>Gradesheet Information</b></h4>
									</div>
									<div class="modal-body">
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
															Section
														</label>
														<div class="col-md-9">											
															<form:select path="section_id" id="sectionid" name="sectionid" class="form-control select2">
															  <c:forEach items="${getsection}" var="s">
														            <form:option value="${s.section_id}">${s.section_section}</form:option>
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
										<div class="row">
											<div class="col-md-12">    
				                                <div class="form-group">
			                                        <label class="col-md-3 control-label" for="txtStudname">SY</label>
			                                        <div class="col-md-9">                                         
													    <form:select path="sy_id" id="syid" name="syid" placeholder="Select School Year"  class="form-control select2">																	
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
														<form:select path="semester_id" id="semesterid" name="semesterid" placeholder="Enter semester"  class="form-control select2">
															<c:forEach var="s" items="${getsemester}">
																<form:option value="${s.semester_id}">${s.semester_semester}</form:option>																	
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

						<form:form name="updateForm"  method="post" action="/sris/gradesheet/update" modelAttribute="student" id="updateForm">               
							<div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
													
										<h4 class="modal-title">Gradesheet Information</h4>
									</div>
									<div class="modal-body">
										<form:hidden path="gcourse_id" id="gcourseid" name="gcourseid" />
                					    <form:hidden path="gsection_id" id="gsectionid" name="gsectionid" />	
                					    <form:hidden path="gsy_id" id="gsyid" name="gsyid" />				                            
			                            <form:hidden path="gsemester_id" id="gsemesterid" name="gsemesterid" />				                            
			                            <form:hidden path="gfacultysubject_id" id="gfacultysubjectid" name="gfacultysubjectid" />
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
															Section
														</label>
														<div class="col-md-9">											
															<form:select path="section_id" id="sectionid" name="sectionid" class="form-control select">
															  <c:forEach items="${getsection}" var="s">
														            <form:option value="${s.section_id}">${s.section_section}</form:option>
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
										<div class="row">
											<div class="col-md-12">    
				                                <div class="form-group">
			                                        <label class="col-md-3 control-label" for="txtStudname">SY</label>
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
					                            
									<div class="modal-footer">
										<button type="button" data-dismiss="modal" class="btn">Close</button>
										<button type="submit" class="btn btn-primary">Save changes</button>
									</div>
								</div>
							
							
							</div>
						</div>
						</div>
						</form:form>
                        
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
	
	<script src="${pageContext.request.contextPath}/resources/vendors/select2/select2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/pages/formelements.js" type="text/javascript"></script>
	
	<script>
		$(document).on("click", ".updatebtn", function () {
			var courseid=$(this).attr('course-id');
	     	var sectionid=$(this).attr('section-id');
	     	var syid=$(this).attr('sy-id');
	     	var semesterid=$(this).attr('semester-id');
	     	var facultysubjectid=$(this).attr('facultysubject-id');
	     	
	    	 $('#updateForm').find('[id="courseid"]').val(courseid);
	         $('#updateForm').find('[id="sectionid"]').val(sectionid);
	         $('#updateForm').find('[id="syid"]').val(syid);
	         $('#updateForm').find('[id="semesterid"]').val(semesterid);   
	         $('#updateForm').find('[id="facultysubjectid"]').val(facultysubjectid);  
	         

	    	 $('#updateForm').find('[id="gcourseid"]').val(courseid);
	         $('#updateForm').find('[id="gsectionid"]').val(sectionid);
	         $('#updateForm').find('[id="gsyid"]').val(syid);
	         $('#updateForm').find('[id="gsemesterid"]').val(semesterid);   
	         $('#updateForm').find('[id="gfacultysubjectid"]').val(facultysubjectid);  
	     
	});	
			
		$(document).on("click", ".editbtn", function () {
			var courseid=$(this).attr('course-id');
	     	var sectionid=$(this).attr('section-id');
	     	var syid=$(this).attr('sy-id');
	     	var semesterid=$(this).attr('semester-id');
	     	var facultysubjectid=$(this).attr('facultysubject-id');
	     	
	    	 $('#searchForm').find('[id="courseid"]').val(courseid);
	         $('#searchForm').find('[id="sectionid"]').val(sectionid);
	         $('#searchForm').find('[id="syid"]').val(syid);
	         $('#searchForm').find('[id="semesterid"]').val(semesterid);   
	         $('#searchForm').find('[id="facultysubjectid"]').val(facultysubjectid);   

         	  document.getElementById('searchForm').submit();  
         
	});	
		$(document).on("click", ".viewbtn", function () {
			var courseid=$(this).attr('course-id');
	     	var sectionid=$(this).attr('section-id');
	     	var syid=$(this).attr('sy-id');
	     	var semesterid=$(this).attr('semester-id');
	     	var facultysubjectid=$(this).attr('facultysubject-id');
	     	window.location = '/sris/gradesheet/view/'+courseid+'/'+sectionid+'/'+syid+'/'+semesterid+'/'+facultysubjectid;
	});	
	
	</script>
	
	
    <!-- end of page level js -->
</body>
</html>
