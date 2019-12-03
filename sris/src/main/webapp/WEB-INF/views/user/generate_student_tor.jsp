<!DOCTYPE html>
<html>
<head>
	<title>Student TOR | SRIS</title>
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
		<%@include file="../includes/user-sidebar.jsp" %>
   
	   <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <!--section starts-->
                <h1>Student TOR | SRIS</h1>
				<ol class="breadcrumb">
                    <li>
                        <a href="/sris/user/index">
                            <i class="livicon" data-name="home" data-size="18" data-loop="true"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#">Reports</a>
                    </li>
                    <li class="active">Student TOR</li>
                </ol>
            </section>
            <!--section ends-->
            <section class="content">
				
				 <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN EXAMPLE TABLE PORTLET-->
                       
                        <form:form action="/sris/user/student-tor/search" modelAttribute="student" method="post">              					
						<div class="portlet box" style="background-color:#5583A1;font-color:#FFF">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="livicon" data-name="search" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                                    Search Student
                                </div>
                            </div>							
                            <div class="portlet-body">                                 
								  <div class="form-group">
                                    <label for="single-append-text" class="control-label">
                                        Student Name
                                    </label>
                                    <div class="input-group select2-bootstrap-append">
                                        <form:select path="student_id" id="single-append-text" class="form-control select2-allow-clear">
										 <c:forEach items="${getStudent}" var="s">
									            <form:option value="${s.student_id}">${s.student_name}</form:option>
									      </c:forEach>
                                        </form:select>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit" data-select2-open="single-append-text">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                        </span>                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                        </form:form>
                        <form:form class="form-horizontal" method="post" action="/sris/user/student-tor/print" modelAttribute="student" id="searchForm">
                        <div class="portlet box" style="background-color:#5583A1;font-color:#FFF">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="livicon" data-name="edit" data-size="16" data-loop="true" data-c="#fff" data-hc="white"></i>
                                    Student Record
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="table-toolbar">
                                    
                                </div>
                                <div id="sample_editable_1_wrapper" class="">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_editable_1" role="grid">
                                        <thead style="background-color:#AE0000;" >
                                            <tr role="row" style="color: #fff;">
                                                <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Student Number</th>
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" >Student Name</th>
                                               	<th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 120px;">Actions</th>      
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                        <c:forEach var="s" items="${studentlist}">
                                        
                                            <tr role="row" class="odd">
                                                <td>${s.student_number}</td>
                                                <td>${s.student_name}</td>
                                                <td align="center">
                                                	<a onClick="window.location = '/sris/user/student_record_setup/view/'+${s.student_id};">
														<i class="livicon" data-name="eye-open" data-size="25" data-loop="true" data-c="#31B0D5" data-hc="#31B0D5" ></i>
													</a>
													
													<a onclick="submitform();"> 
														<i class="livicon" data-name="printer" data-size="25" data-loop="true" data-c="#418BC1" data-hc="#418BC1" ></i>
													
													</a>
                                                  <form:hidden path="student_id" id="studentid" name="studentid" value="${s.student_id}"/>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END EXAMPLE TABLE PORTLET-->
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
	function submitform() {
		document.getElementById('searchForm').submit();
		}
	</script>
	 <!-- end of page level js -->
</body>
</html>
