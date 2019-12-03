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
				    <span class="topprofiletext" style="color:white; font-size:11px; padding-left:35px;">System User</span> </div>
				 <%
				   String s_session=String.valueOf(session.getAttribute("Student"));
				   System.out.println(s_session);
				   	if (s_session.equals("null"))
					   {
					   request.getRequestDispatcher("/login").forward(request, response);
					   } 
				   %>  
			 &nbsp;
         <h6 style="color:white">&nbsp;&nbsp;General</h6>
         <!-- BEGIN SIDEBAR MENU -->
         <ul id="menu" class="page-sidebar-menu">
 		         <li>
                    <a href="/sris/user/student_record_setup">
                    <i  class="livicon" data-name="users" data-size="18" data-c="#ffffff" data-hc="#ffffff" data-loop="true"></i>
               		<span class="title">Student Record</span>
                    </a>
                 </li>
                 <li>
                    <a href="/sris/user/generate_student_tor">
                    <i  class="livicon" data-name="address-book" data-size="18" data-c="#ffffff" data-hc="#ffffff" data-loop="true"></i>
               		<span class="title">Student TOR</span>
                    </a>
                 </li>
			     <li>
                    <a href="/sris/user/generate_gradesheet">
                    <i  class="livicon"  data-name="table" data-size="18" data-c="#ffffff" data-hc="#ffffff" data-loop="true"></i>
               		<span class="title">Gradesheet</span>
                    </a>
                 </li>   
            <br>
          </ul>
         <!-- END SIDEBAR MENU -->
			</div>
			</section>
		</aside>