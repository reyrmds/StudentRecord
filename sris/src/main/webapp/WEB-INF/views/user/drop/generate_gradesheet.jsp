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
        <%@include file="../includes/user-sidebar.jsp" %>
	   
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
                        
                        <form:form action="/sris/user/gradesheet/search" modelAttribute="student" method="post">     
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
                                        <form:select path="subject_desc" id="single-append-text" class="form-control select2-allow-clear">
										 <c:forEach items="${getsubject}" var="s">
									            <form:option value="${s.subject_desc}">${s.subject_desc}</form:option>
									      </c:forEach>
                                        </form:select>
                                        <span class="input-group-btn">
                                            <button class="btn btn-info" type="submit" data-select2-open="single-append-text">
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
                                    
                                </div>
                                <form:form class="form-horizontal" method="post" action="/sris/user/gradesheet/print" modelAttribute="student" id="searchForm">				                         
                                <div id="sample_editable_1_wrapper" class="">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_editable_1" role="grid">
                                        <thead style="background-color:#AE0000;" >
                                            <tr role="row" style="color: #fff;">
											                                                
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Subject Description</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Units</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Sect. Code</th>                              
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Semester</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">School Year</th>
												<th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 120px;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        <c:forEach var="s" items="${getrecord}">
                                            <tr role="row" class="odd">
												
												<td>${s.subject_desc}</td>
                                                <td>${s.subject_units}</td>
												<td>${s.record_section}</td>
												<td>${s.record_semester}</td> 
												<td>${s.record_sy}</td>                                               												
                                                <td align="center">
													<a class="btn editbtn" id="editbtn" subject-code="${s.subject_code}" record-section="${s.record_section}" record-semester="${s.record_semester}" record-sy="${s.record_sy}" > 
														<i class="livicon" data-name="printer" data-size="25" data-loop="true" data-c="#418BC1" data-hc="#418BC1" ></i>
													</a>
                                                 </td>
                                                <form:hidden path="subject_code" id="subjectcode" name="subjectcode" />
					                            <form:hidden path="record_section" id="recordsection" name="recordsection" />
					                            <form:hidden path="record_semester" id="recordsemester" name="recordsemester" />
					                            <form:hidden path="record_sy" id="recordsy" name="recordsy" />
                                            </tr>	
                                        </c:forEach>								
                                        </tbody>
                                    </table>
                                </div>
                                 </form:form>
                                <!-- END EXAMPLE TABLE PORTLET-->
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
	
	<script src="${pageContext.request.contextPath}/resources/vendors/select2/select2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/pages/formelements.js" type="text/javascript"></script>
	
	<script>
	
		$(document).on("click", ".editbtn", function () {
		    var subjectcode=$(this).attr('subject-code');
	     	var recordsection=$(this).attr('record-section');
	     	var recordsemester=$(this).attr('record-semester');
	     	var recordsy=$(this).attr('record-sy');

	     	  //set what we got to our form
	    	 $('#searchForm').find('[id="subjectcode"]').val(subjectcode);
	         $('#searchForm').find('[id="recordsection"]').val(recordsection);
	         $('#searchForm').find('[id="recordsemester"]').val(recordsemester);
	         $('#searchForm').find('[id="recordsy"]').val(recordsy);
	         
	         
	         document.getElementById('searchForm').submit();
	});	
	
	</script>
	
    <!-- end of page level js -->
</body>
</html>
