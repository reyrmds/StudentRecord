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
                <h1><i class="livicon" data-name="gears" data-size="25" data-loop="true"></i> System Configuration</h1>
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
                                        <button id="btn_add" class=" btn btn-custom" style="background-color:#5583A1" data-toggle="modal" data-href="#modaladd" href="#modaladd">
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
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Student Number</th>
                                                <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Student Name</th>
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 120px;">Actions</th>                                             
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                        <c:forEach var="s" items="${studentlist}">
                                            <tr role="row" class="odd">
                                            
                                                <td>${s.student_number}</td>
                                                <td>${s.student_name}</td> 
                                                <td align="center">
                                             	    <a onClick="window.location = 'student_record_setup/view/'+${s.student_id};">
														<i class="livicon" data-name="eye-open" data-size="25" data-loop="true" data-c="#31B0D5" data-hc="#31B0D5" ></i>
													</a>
													<a student-id="${s.student_id}" student-name="${s.student_name}" student-number="${s.student_number}" data-toggle="modal" data-target="#modalupdate">
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#EC971F" data-hc="#EC971F" ></i>
													</a>
													<a student-id="${s.student_id}" data-toggle="modal" data-target="#modaldelete">
														<i class="livicon" data-name="remove" data-size="25" data-loop="true" data-c="#EF6F61" data-hc="#EF6F61" ></i>
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
                    </div>
                </div>
				
				
				<form:form action="student_record_setup/save" modelAttribute="student" method="post">
                <div class="modal fade in" id="modaladd" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
                    <div class="modal-dialog modal-md-12">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Student Information</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">                 
                                       <div class="form-group">
	                                        <label class="col-md-3 control-label" for="txtStudno">Student Number</label>
	                                        <div class="col-md-9">
	                                            <fieldset>                            
	                                            	<form:input path="student_number" name="studentnumber" id="studentnumber" placeholder="Enter Student No." type="text" class="form-control"/>
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
												<form:input path="student_name" name="studentname" required="true" id="studentname" type="text" placeholder="Enter Student Name" class="form-control"/>
	                                        </div>	
                                       </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Close</button>
                                <button type="submit"  class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                </form:form>

                
            	<form:form method="post" action="student_record_setup/update" modelAttribute="student" id="updateForm">
                <div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
                    <div class="modal-dialog modal-md-12">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Student Information</h4>
                            </div>
                           	<form:hidden path="student_id" id="studentid"></form:hidden>               
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">                 
                                       <div class="form-group">
	                                        <label class="col-md-3 control-label" for="txtStudno">Student No.</label>
	                                        <div class="col-md-9"> 
	                                        	<fieldset>
	                                            	<form:input path="student_number" name="studentnumber" id="studentnumber" class="form-control" />
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
	                                            <fieldset>
	                                            	<form:input path="student_name" name="studentname" required="true" id="studentname" type="text" class="form-control"/>
	                                       		</fieldset>
	                                        </div>
                                       </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
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
	
	<script type="text/javascript">
	   
	    $('#modaldelete').on('show.bs.modal', function (e) {
        	  // get information to update quickly to modal view as loading begins
        	  var opener=e.relatedTarget;//this holds the element who called the modal
        	   
        	  //we get details from attributes
        	  var studentid=$(opener).attr('student-id');
        	  
        	  document.getElementById("deletebutton1").onclick = function () {
      	    	window.location = 'student_record_setup/delete/'+studentid;
      	   	  };
      	    
        	});
	</script>
    <script>
         
         $('#modalupdate').on('show.bs.modal', function (e) {
          	  // get information to update quickly to modal view as loading begins
          	  var opener=e.relatedTarget;//this holds the element who called the modal
          	   
          	  //we get details from attributes
          	  var studentid=$(opener).attr('student-id');
          	  var studentnumber=$(opener).attr('student-number');
          	  var studentname=$(opener).attr('student-name');

          	  //set what we got to our form
         	  $('#updateForm').find('[id="studentid"]').val(studentid);
              $('#updateForm').find('[id="studentnumber"]').val(studentnumber);
              $('#updateForm').find('[id="studentname"]').val(studentname);
            	
          	});
      </script>
   
    <!-- end of page level js -->
</body>
</html>
