<!DOCTYPE html>
<html>

<head>
    <title>Login | SRIS</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/sris-logo.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- global level css -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" />
    <!-- end of global level css -->
    <!-- page level css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pages/login.css" />
    <!-- end of page level css -->
</head>
<%  session.invalidate();  %>
<body style="background:#5583A1">
    <div class="container" >
        <div class="row vertical-offset-100">
            <div class="col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-4 col-lg-4 col-lg-offset-4">
                <div id="container_demo">
                    <div id="wrapper">
                        <div id="login" class="animate form">
							<form name="form" action="<%=request.getContextPath()%>/auth_login" method="post">
                                <h3 class="black_bg">
                                    
                                    <img src="${pageContext.request.contextPath}/resources/img/sris.png" class="img-circle" alt="SRIS" style="height:150px; width:150px; margin-top:5px; margin-bottom:5px;">
                    		
                                    <br></h3>
                                <p>
                                    <label style="margin-bottom:0px;" for="username" class="uname"> <i class="livicon" data-name="user" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                                        E-mail or Username
                                    </label>
                                    <input id="username" name="username" required type="text" placeholder="username or e-mail" />
                                </p>
                                <p>
                                    <label style="margin-bottom:0px;" for="password" class="youpasswd"> <i class="livicon" data-name="key" data-size="16" data-loop="true" data-c="#3c8dbc" data-hc="#3c8dbc"></i>
                                        Password
                                    </label>
                                    <input id="password" name="password" required type="password" placeholder="Type your password" />
                                </p>

                                <p class="button">
                                    <input type="submit" id="loginbutton" value="Login" class="btn btn" />
                                </p>
								<span style="color:red; text-align:center"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>

                            </form>
                        </div>

					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- global js -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
    <!--livicons-->
    <script src="${pageContext.request.contextPath}/resources/vendors/livicons/minified/raphael-min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/livicons/minified/livicons-1.4.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/josh.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/metisMenu.js" type="text/javascript"> </script>
    <script src="${pageContext.request.contextPath}/resources/vendors/holder-master/holder.js" type="text/javascript"></script>
	
    <!-- end of global js -->
</body>
</html>
