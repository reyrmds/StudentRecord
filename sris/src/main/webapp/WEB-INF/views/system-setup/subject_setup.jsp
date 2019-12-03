<!DOCTYPE html>
<html>
<head>
    <title>Subjects | SRIS</title>
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
		<aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <!--section starts-->
                <h1>Subjects | SRIS</h1>
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
                    <li class="active">Subjects</li>
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
                                    Subjects
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
                                                <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Subject Code</th>
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Description</th>
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Units</th>
                                                
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width:120px;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                        <c:forEach var="s" items="${subjectlist}">
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">${s.subject_code}</td>
                                                <td>${s.subject_desc}</td>
                                                <td>${s.subject_units}</td>
                                                <td align="center">
													<a subject-id="${s.subject_id}" subject-units="${s.subject_units}" subject-code="${s.subject_code}" subject-desc="${s.subject_desc}" data-toggle="modal" data-target="#modalupdate">
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#EC971F" data-hc="#EC971F" ></i>
													</a>
													<a subject-id="${s.subject_id}" data-toggle="modal" data-target="#modaldelete">
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
				
				<!--- ADD MODAL -->
				<form:form action="subject_setup/save" modelAttribute="student" method="post">
                <div class="modal fade in" id="modaladd" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
                    <div class="modal-dialog modal-md-12">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Subject Information</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">                 
                                       <div class="form-group">
	                                        <label class="col-md-3 control-label" for="txtStudno">Subject Code</label>
	                                        <div class="col-md-9">
	                                            <fieldset>
	                                            	<form:input path="subject_code" required="true" name="subjectcode" id="subjectcode" type="text" class="form-control" placeholder="Enter Subject Code"/>
	                                       		</fieldset>
	                                        </div>									
                                       </div>
                                    </div>
                                </div>
								<br/>
                                <div class="row">
                                    <div class="col-md-12">                 
                                       <div class="form-group">
	                                        <label class="col-md-3 control-label" for="txtStudname">Description</label>
	                                        <div class="col-md-9">                                         
												<form:input path="subject_desc" id="subjectdesc" name="subjectdesc" type="text" placeholder="Enter Subject Description" class="form-control"/>
	                                        </div>	
                                       </div>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
									<div class="col-md-12">                 
									   <div class="form-group">
											<label class="col-md-3 control-label" for="txtStudname">Units</label>
											<div class="col-md-9">
												<fieldset>
													<form:input path="subject_units" required="true" type="number" id="subjectunits" name="subjectunits" placeholder="Enter subject units" class="form-control"/>
												</fieldset>
											</div>
									   </div>
									</div>
								</div>
								<br/>
                               
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
				</form:form>
                <!-- END modal-->
			
            	<!---EDIT MODAL -->
            	<form:form  method="post" action="subject_setup/update" modelAttribute="student" id="updateForm">
                <div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
                    <div class="modal-dialog modal-md-12">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title">Subject Information</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                <form:hidden path="subject_id" name="subjectid" id="subjectid"  class="form-control"/>
	                                       		
                                    <div class="col-md-12">                 
                                       <div class="form-group">
	                                        <label class="col-md-3 control-label" for="txtStudno">Subject Code</label>
	                                        <div class="col-md-9">
	                                            <fieldset>
	                                            	<form:input path="subject_code" required="true" name="subjectcode" id="subjectcode" type="text" class="form-control" placeholder="Enter Subject Code"/>
	                                       		</fieldset>
	                                        </div>									
                                       </div>
                                    </div>
                                </div>
								<br/>
                                <div class="row">
                                    <div class="col-md-12">                 
                                       <div class="form-group">
	                                        <label class="col-md-3 control-label" for="txtStudname">Description</label>
	                                        <div class="col-md-9">                                         
												<form:input path="subject_desc" id="subjectdesc" name="subjectdesc" type="text" placeholder="Enter Subject Description" class="form-control"/>
	                                        </div>	
                                       </div>
                                    </div>
                                </div>
                                <br/>
                                 <div class="row">
									<div class="col-md-12">                 
									   <div class="form-group">
											<label class="col-md-3 control-label" for="txtStudname">Units</label>
											<div class="col-md-9">
												<fieldset>
													<form:input path="subject_units" required="true" type="number" id="subjectunits" name="subjectunits" placeholder="Enter subject units" class="form-control"/>
												</fieldset>
											</div>
									   </div>
									</div>
								</div>
								<br/>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
				</div>
				</form:form>
                <!-- END modal-->
                
                <div class="modal fade in" id="modaldelete" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>Would you like to delete this subject ?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal" class="btn">Cancel</button>
                                <button id="deletebutton" type="button" data-dismiss="modal" class="btn btn-primary">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END modal-->

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
        	  var subjectid=$(opener).attr('subject-id');
        	  
        	  document.getElementById("deletebutton").onclick = function () {
      	    	window.location = 'subject_setup/delete/'+subjectid;
      	   	  };
      	    
        	});
	</script>
    <script>
         
         $('#modalupdate').on('show.bs.modal', function (e) {
          	  // get information to update quickly to modal view as loading begins
          	  var opener=e.relatedTarget;//this holds the element who called the modal
          	   
          	  //we get details from attributes
          	  var subjectid=$(opener).attr('subject-id');
          	  var subjectcode=$(opener).attr('subject-code');
          	  var subjectdesc=$(opener).attr('subject-desc');
          	  var subjectunits=$(opener).attr('subject-units');
           	  

          	  //set what we got to our form
         	  $('#updateForm').find('[id="subjectid"]').val(subjectid);
              $('#updateForm').find('[id="subjectcode"]').val(subjectcode);
              $('#updateForm').find('[id="subjectdesc"]').val(subjectdesc);
              $('#updateForm').find('[id="subjectunits"]').val(subjectunits);
            	
          	});
      </script>
   
   
    <!-- end of page level js -->
</body>
</html>
