<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<header class="header">
        <a href="/sris/index" class="logo">
            <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo">
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <div>
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <div class="responsive_nav"></div>
                </a>
            </div>
            <div class="navbar-right">
                <ul class="nav navbar-nav">
                   
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${pageContext.request.contextPath}/resources/img/sris.png" width="35" class="img-circle img-responsive pull-left" height="35" alt="riot">
                            <div class="riot">
                                <div>SRIS
                                    <span>
                                        <i class="caret"></i>
                                    </span>
                                </div>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header bg-light-blue">
                                <img src="${pageContext.request.contextPath}/resources/img/sris.png" class="img-responsive img-circle" alt="User Image">
                                <p class="topprofiletext"></p>
                            </li>
                            <!-- Menu Body -->
                           <!--  <li>
                                <a href="#">
                                    <i class="livicon" data-name="gears" data-s="18"></i>
                                    Account Settings
                                </a>
                            </li> -->
                            <li role="presentation"></li>
                            <li>
                                  <a href="<%=request.getContextPath()%>/auth_logout">
                                 	 <i class="livicon" data-name="sign-out" data-s="18"></i>
                                     Logout
                                  </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
   