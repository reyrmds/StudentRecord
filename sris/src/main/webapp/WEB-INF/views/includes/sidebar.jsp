<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
 <aside class="left-side sidebar-offcanvas offcanvas-left" style="background-color:#353B48;">
			<section class="sidebar">
				<div class="page-sidebar  sidebar-nav">
         <div class="clearfix">
         </div>
         &nbsp;
			 <div style="padding-left:75px">
				<img src="${pageContext.request.contextPath}/resources/img/sris.png" class="img-responsive img-circle" width="100px" height="100px" alt="User Image">
				<h5 class="topprofiletext" style="color:white;padding-left:50px;">SRIS</h5>
				<p>
				   <span class="topprofiletext" style="color:white; font-size:11px; padding-left:35px;">Super Admin</span>
				   <%
				   String s_session=String.valueOf(session.getAttribute("Admin"));
				   	if (s_session.equals("null"))
					   {
					   request.getRequestDispatcher("/login").forward(request, response);					  
					   } 
				   	
				   %>
			 </div>

			 &nbsp;
         <h6 style="color:white">&nbsp;&nbsp;General</h6>
         <!-- BEGIN SIDEBAR MENU -->
         <ul id="menu" class="page-sidebar-menu">
            <li>
               <a href="">
               <i  class="livicon"  data-name="gears" data-size="18" data-c="#ffffff" data-hc="#ffffff" data-loop="true"></i>
               <span class="title">System Configuration</span>
               <span class="fa arrow"></span>
               </a>
               <ul class="sub-menu">             	               	  
                 <!-- Subjects --> 
				  <li>
                     <a href="">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Subjects</span>
                     </a>  
                     <ul class="sub-menu">
	                     <li>
		                     <a href="/sris/subject_setup">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Set Subjects</span>
		                     </a>                  
	             	     </li>     
	             	     <li>
		                     <a href="/sris/faculty_subject_setup">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Faculty Subjects</span>
		                     </a>                  
	             	     </li> 
	             	     <li>
		                     <a href="/sris/subject_curriculum_setup">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Curriculum Subjects</span>
		                     </a>                  
             	  	     </li>   
                     </ul>                
                  </li>                                 
                 <!-- Courses -->
                  <li>
                     <a href="/sris/course_setup">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Courses</span>
                     </a>                  
                  </li>
                  <!-- Section -->
                  <li>
                     <a href="/sris/section_setup">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Section</span>
                     </a>                  
                  </li>
                  <!-- Semester -->
                  <li>
                     <a href="/sris/semester_setup">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Semester</span>
                     </a>                  
                  </li> 
                  <!-- School Year -->
                   <li>
                     <a href="/sris/sy_setup">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">School Year</span>
                     </a>                  
                  </li>  
                  <!--  Curriculum -->
                   <li>
                     <a href="/sris/curriculum_setup">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Curriculum</span>
                     </a>                  
                  </li>                      
                 <!-- Faculty -->
                  <li>
                     <a href="/sris/faculty_setup">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Faculty</span>
                      </a> 
                       <!-- <ul class="sub-menu">
                       <li>
	                     <a href="">
	                     <i class="fa fa-angle-double-right"></i>
	                     <span class="title">Professors</span>
	                     </a>
	                     </li>
	                      <li>
	                     <a href="/sris/faculty_subject">
	                     <i class="fa fa-angle-double-right"></i>
	                     <span class="title">Subjects</span>
	                     </a>                  
	                  	</li>
                       
                       </ul>            -->         
                  </li>          
                   <!-- Student Record -->
                  <li>
                     <a href="/sris/student_record_setup">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Student Record</span>
                     </a>                  
                  </li>  
                  
               </ul>
            </li>
            <li>
               <a href="/sris/user_management">
               <i class="livicon"  data-name="users" data-size="18" data-c="#ffffff" data-hc="#ffffff" data-loop="true"></i>              
			   <span class="title">User Management</span>
			  </a>
            </li>
            <li>
               <a href="">
               <i class="livicon" data-name="printer" data-size="18" data-c="#ffffff" data-hc="#ffffff" data-loop="true"></i>
               <span class="title">Reports</span>
			   <span class="fa arrow"></span>
               </a>
			   <ul class="sub-menu">
                  <li>
                     <a href="/sris/generate_student_tor">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Student TOR</span>
                     </a>
                  </li>
				  <li>
                     <a href="/sris/generate_gradesheet">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Gradesheet</span>
                     </a>
                  </li>
               </ul>
            </li>
             <li>
               <a href="">
               <i class="livicon" data-name="hammer" data-size="18" data-c="#ffffff" data-hc="#ffffff" data-loop="true"></i>
               <span class="title">Utilities</span>
			   <span class="fa arrow"></span>
               </a>
               <ul class="sub-menu">
	               <li>
                     <a href="">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Restore Record</span>
                     </a>	                     
			 		  <ul class="sub-menu">
					 	  <li>
		                     <a href="">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Student</span>
		                      </a>
		                      <ul class="sub-menu">
		                      <li>
			                     <a href="/sris/student_record_util">
			                     <i class="fa fa-angle-double-right"></i>
			                     <span class="title">Student Record</span>
			                     </a>
			                  </li>
			                  <li>
			                     <a href="/sris/student_grades_util">
			                     <i class="fa fa-angle-double-right"></i>
			                     <span class="title">Student Grades</span>
			                     </a>
			                  </li>
		                      </ul>
		                  </li>			                  
		                  <li>
		                     <a href="/sris/subject_util">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Subjects</span>
		                     </a>
		                  </li>          
		                  <li>
		                     <a href="">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Faculty</span>
		                      </a> 
		                       <ul class="sub-menu">
			                       <li>
				                     <a href="/sris/faculty_util">
				                     <i class="fa fa-angle-double-right"></i>
				                     <span class="title">Professors</span>
				                     </a>
				                  </li> 
				                  <li>
				                     <a href="/sris/faculty_subject_util">
				                     <i class="fa fa-angle-double-right"></i>
				                     <span class="title">Subjects</span>
				                     </a>
				                  </li>       		                        
		                       </ul>		                                    
		                  </li>
		                  <li>
		                     <a href="/sris/user_util">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Users</span>
		                     </a>
		                  </li>		                  
		               </ul>
           			</li>  
	           		 <li>
                     <a href="">
                     <i class="fa fa-angle-double-right"></i>
                     <span class="title">Update Record</span>
                     </a>
                     	<ul class="sub-menu">
		                  <li>
		                     <a href="/sris/student_record_update">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Student Record</span> 		
		                     </a>
		                  </li>
						  <li>
		                     <a href="/sris/subject_record_update">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Subjects</span>
		                     </a>
		                  </li>
		                  <li>
		                     <a href="/sris/faculty_record_update">
		                     <i class="fa fa-angle-double-right"></i>
		                     <span class="title">Faculty</span>
		                     </a>
		                  </li>
		               </ul>
               		 </li>
           		</ul>
            </li>
            
            <br>
          </ul>
         <!-- END SIDEBAR MENU -->
			</div>
			</section>
		</aside>
		