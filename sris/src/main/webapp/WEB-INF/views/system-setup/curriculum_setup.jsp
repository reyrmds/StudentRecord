<!DOCTYPE html>
<html>
<head>
    <title>Curriculum | SRIS</title>
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
                <h1>Curriculum | SRIS</h1>
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
                    <li class="active">Curriculum</li>
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
                                    Curriculum
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
                                                <th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1">Curriculum Year</th>
                                                <th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width:120px;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody style="font-size:90%;">
                                        <c:forEach var="s" items="${curriculumlist}">
                                            <tr role="row" class="odd">
                                                <td class="sorting_1">${s.curriculum_sy}</td>
                                                <td align="center">
                                                
                                                	<a onClick="window.location = 'curriculum_setup/view/'+${s.curriculum_id};">
														<i class="livicon" data-name="eye-open" data-size="25" data-loop="true" data-c="#31B0D5" data-hc="#31B0D5" ></i>
													</a>
													
													<a curriculum-id="${s.curriculum_id}" curriculum-sy="${s.curriculum_sy}" data-toggle="modal" data-target="#modalupdate">
														<i class="livicon" data-name="edit" data-size="25" data-loop="true" data-c="#EC971F" data-hc="#EC971F" ></i>
													</a>
													<a curriculum-id="${s.curriculum_id}" data-toggle="modal" data-target="#modaldelete">
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
				<form:form action="curriculum_setup/save" modelAttribute="student" method="post">
                <div class="modal fade in" id="modaladd" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
                    <div class="modal-dialog modal-md-12">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Curriculum Information</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
									<div class="col-md-12">    
		                                <div class="form-group">
	                                        <label class="col-md-4 control-label" for="txtStudname">Curriculum Year</label>
	                                        <div class="col-md-8">                                         
												 <form:select path="curriculum_sy" id="curriculumsy" name="curriculumsy" placeholder="Select School Year"  class="form-control select2">																	
													<form:option value="9091">9091</form:option>																		
													<form:option value="9192">9192</form:option>																	
													<form:option value="9293">9293</form:option>																	
													<form:option value="9394">9394</form:option>																
													<form:option value="9596">9596</form:option>																	
													<form:option value="9697">9697</form:option>																	
													<form:option value="9798">9798</form:option>
													<form:option value="9899">9899</form:option>
													<form:option value="9900">9900</form:option>
													<form:option value="0001">0001</form:option>
													<form:option value="0102">0102</form:option>
													<form:option value="0203">0203</form:option>
													<form:option value="0304">0304</form:option>
													<form:option value="0405">0405</form:option>
													<form:option value="0506">0506</form:option>
													<form:option value="0607">0607</form:option>
													<form:option value="0708">0708</form:option>
													<form:option value="0809">0809</form:option>
													<form:option value="0910">0910</form:option>
													<form:option value="1011">1011</form:option>
													<form:option value="1112">1112</form:option>
													<form:option value="1213">1213</form:option>
													<form:option value="1314">1314</form:option>
													<form:option value="1415">1415</form:option>
													<form:option value="1516">1516</form:option>
													<form:option value="1617">1617</form:option>
													<form:option value="1718">1718</form:option>
													<form:option value="1819">1819</form:option>
													<form:option value="1920">1920</form:option>
													<form:option value="2021">2021</form:option>
													<form:option value="2122">2122</form:option>
													<form:option value="2223">2223</form:option>
													<form:option value="2324">2324</form:option>
													<form:option value="2425">2425</form:option>
													<form:option value="2526">2526</form:option>
													<form:option value="2627">2627</form:option>
													<form:option value="2728">2728</form:option>
													<form:option value="2829">2829</form:option>
													<form:option value="2930">2930</form:option>
												</form:select>
	                                      
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
            	<form:form  method="post" action="curriculum_setup/update" modelAttribute="student" id="updateForm">
                <div class="modal fade in" id="modalupdate" tabindex="-1" role="dialog" aria-hidden="false" style="display:none;">
                    <div class="modal-dialog modal-md-12">
                        <div class="modal-content">
                            <div class="modal-header">

                                <h4 class="modal-title">Curriculum Information</h4>
                            </div>
                            <div class="modal-body">                           
                                <form:hidden path="curriculum_id" name="curriculumid" id="curriculumid"  class="form-control"/>
                                <div class="row">
									<div class="col-md-12">    
		                                <div class="form-group">
	                                        <label class="col-md-4 control-label" for="txtStudname">Curriculum Year</label>
	                                        <div class="col-md-8">                                         
												 <form:select path="curriculum_sy" id="curriculumsy" name="curriculumsy" class="form-control select">																														
													<form:option value="9091">9091</form:option>																		
													<form:option value="9192">9192</form:option>																	
													<form:option value="9293">9293</form:option>																	
													<form:option value="9394">9394</form:option>																
													<form:option value="9596">9596</form:option>																	
													<form:option value="9697">9697</form:option>																	
													<form:option value="9798">9798</form:option>
													<form:option value="9899">9899</form:option>
													<form:option value="9900">9900</form:option>
													<form:option value="0001">0001</form:option>
													<form:option value="0102">0102</form:option>
													<form:option value="0203">0203</form:option>
													<form:option value="0304">0304</form:option>
													<form:option value="0405">0405</form:option>
													<form:option value="0506">0506</form:option>
													<form:option value="0607">0607</form:option>
													<form:option value="0708">0708</form:option>
													<form:option value="0809">0809</form:option>
													<form:option value="0910">0910</form:option>
													<form:option value="1011">1011</form:option>
													<form:option value="1112">1112</form:option>
													<form:option value="1213">1213</form:option>
													<form:option value="1314">1314</form:option>
													<form:option value="1415">1415</form:option>
													<form:option value="1516">1516</form:option>
													<form:option value="1617">1617</form:option>
													<form:option value="1718">1718</form:option>
													<form:option value="1819">1819</form:option>
													<form:option value="1920">1920</form:option>
													<form:option value="2021">2021</form:option>
													<form:option value="2122">2122</form:option>
													<form:option value="2223">2223</form:option>
													<form:option value="2324">2324</form:option>
													<form:option value="2425">2425</form:option>
													<form:option value="2526">2526</form:option>
													<form:option value="2627">2627</form:option>
													<form:option value="2728">2728</form:option>
													<form:option value="2829">2829</form:option>
													<form:option value="2930">2930</form:option>
												</form:select>
												<%-- <form:select path="curriculum_sy" id="curriculumsy" name="curriculumsy" placeholder="Select School Year"  class="form-control select2">																	
													<form:option value="1990-1991">1990-1991</form:option>																		
													<form:option value="1991-1992">1991-1992</form:option>																	
													<form:option value="1992-1993">1992-1993</form:option>																	
													<form:option value="1993-1994">1993-1994</form:option>																
													<form:option value="1995-1996">1995-1996</form:option>																	
													<form:option value="1996-1997">1996-1997</form:option>																	
													<form:option value="1997-1998">1997-1998</form:option>
													<form:option value="1998-1999">1998-1999</form:option>
													<form:option value="1999-2000">1999-2000</form:option>
													<form:option value="2000-2001">2000-2001</form:option>
													<form:option value="2001-2002">2001-2002</form:option>
													<form:option value="2002-2003">2002-2003</form:option>
													<form:option value="2003-2004">2003-2004</form:option>
													<form:option value="2004-2005">2004-2005</form:option>
													<form:option value="2005-2006">2005-2006</form:option>
													<form:option value="2006-2007">2006-2007</form:option>
													<form:option value="2007-2008">2007-2008</form:option>
													<form:option value="2008-2009">2008-2009</form:option>
													<form:option value="2009-2010">2009-2010</form:option>
													<form:option value="2010-2011">2010-2011</form:option>
													<form:option value="2011-2012">2011-2012</form:option>
													<form:option value="2012-2013">2012-2013</form:option>
													<form:option value="2013-2014">2013-2014</form:option>
													<form:option value="2014-2015">2014-2015</form:option>
													<form:option value="2015-2016">2015-2016</form:option>
													<form:option value="2016-2017">2016-2017</form:option>
													<form:option value="2017-2018">2017-2018</form:option>
													<form:option value="2018-2019">2018-2019</form:option>
													<form:option value="2019-2020">2019-2020</form:option>
													<form:option value="2020-2021">2020-2021</form:option>
													<form:option value="2021-2022">2021-2022</form:option>
													<form:option value="2022-2023">2022-2023</form:option>
													<form:option value="2023-2024">2023-2024</form:option>
													<form:option value="2024-2025">2024-2025</form:option>
													<form:option value="2025-2026">2025-2026</form:option>
													<form:option value="2026-2027">2026-2027</form:option>
													<form:option value="2027-2028">2027-2028</form:option>
													<form:option value="2028-2029">2028-2029</form:option>
													<form:option value="2029-2030">2029-2030</form:option>
												</form:select> --%>
	                                      
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
                                <p>Would you like to delete this curriculum record ?</p>
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
        	  var curriculumid=$(opener).attr('curriculum-id');
        	  
        	  document.getElementById("deletebutton").onclick = function () {
      	    	window.location = 'curriculum_setup/delete/'+curriculumid;
      	   	  };
      	    
        	});
	</script>
    <script>
         
         $('#modalupdate').on('show.bs.modal', function (e) {
          	  // get information to update quickly to modal view as loading begins
          	  var opener=e.relatedTarget;//this holds the element who called the modal
          	   
          	  //we get details from attributes
          	  var curriculumid=$(opener).attr('curriculum-id');
          	  var curriculumsy=$(opener).attr('curriculum-sy');

           	  

          	  //set what we got to our form
         	  $('#updateForm').find('[id="curriculumid"]').val(curriculumid);
              $('#updateForm').find('[id="curriculumsy"]').val(curriculumsy);

            	
          	});
      </script>
   
   
    <!-- end of page level js -->
</body>
</html>
