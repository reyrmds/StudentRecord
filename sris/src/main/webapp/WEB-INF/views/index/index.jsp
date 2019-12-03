<!DOCTYPE html>
<html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>`
<head>
	<title>Home | SRIS</title>
    <%@include file="../includes/head.jsp" %>
    <!-- font Awesome -->
    <link href="${pageContext.request.contextPath}/resources/vendors/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/styles/black.css" rel="stylesheet" type="text/css" id="colorscheme" />
    <link href="${pageContext.request.contextPath}/resources/css/panel.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/metisMenu.css" rel="stylesheet" type="text/css"/>    
    <!-- end of global css -->    
    <!--page level css -->
	<link href="${pageContext.request.contextPath}/resources/css/pages/carousel.css" rel="stylesheet" />
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
                <h1>Home | SRIS</h1>
				<ol class="breadcrumb">
                    <li>
                        <a href="/sris/index">
                            <i class="livicon" data-name="home" data-size="14" data-loop="true"></i>
                            Home
                        </a>
                    </li>
                    
                    <li class="active">SRIS</li>
                </ol>
            </section>
            <!--section ends-->
            <section class="content">
                <!--main content-->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="box-body">
                                    <!--carousel starts-->
                                    <div class="row">
                                        <!-- The carousel -->
                                        <div id="transition-timer-carousel" class="carousel slide transition-timer-carousel" data-ride="carousel">
                                            <!-- Indicators -->
                                            <ol class="carousel-indicators">
                                                <li data-target="#transition-timer-carousel" data-slide-to="0" class="active"></li>
                                                <li data-target="#transition-timer-carousel" data-slide-to="1"></li>
                                                <li data-target="#transition-timer-carousel" data-slide-to="2"></li>
                                                <li data-target="#transition-timer-carousel" data-slide-to="3"></li>
                                            </ol>

                                            <!-- Wrapper for slides -->
                                            <div class="carousel-inner">
                                                <div class="item active">
                                                    <img src="${pageContext.request.contextPath}/resources/img/srs1.png" class='img-responsive' alt="image">
                                                    <div class="carousel-caption">
                                                        <h1 class="carousel-caption-header">Student Records Information System</h1>
                                                        <p class="carousel-caption-text hidden-sm hidden-xs">
                                                        An Information System that manages student records
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img src="${pageContext.request.contextPath}/resources/img/srs2.png" class='img-responsive' alt="image">
                                                    <div class="carousel-caption">
                                                        <h1 class="carousel-caption-header">Student Records Information System</h1>
                                                        <p class="carousel-caption-text hidden-sm hidden-xs">
                                                        Able to keep and secure student records
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img src="${pageContext.request.contextPath}/resources/img/srs3.png" class='img-responsive' alt="image">
                                                    <div class="carousel-caption">
                                                        <h1 class="carousel-caption-header">Student Records Information System</h1>
                                                        <p class="carousel-caption-text hidden-sm hidden-xs">
                                                        Track student records
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <img src="${pageContext.request.contextPath}/resources/img/srs4.png" class='img-responsive' alt="image">
                                                    <div class="carousel-caption">
                                                        <h1 class="carousel-caption-header">Student Records Information System</h1>
                                                        <p class="carousel-caption-text hidden-sm hidden-xs">
                                                        Help generate student related reports
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Controls -->
                                            <a class="left carousel-control" href="#transition-timer-carousel" data-slide="prev">
                                                <span class="glyphicon glyphicon-chevron-left"></span>
                                            </a>
                                            <a class="right carousel-control" href="#transition-timer-carousel" data-slide="next">
                                                <span class="glyphicon glyphicon-chevron-right"></span>
                                            </a>

                                            <!-- Timer "progress bar" -->
                                            <hr class="transition-timer-carousel-progress-bar animate" />
                                        </div>
                                    </div>
                                    <!--carousel ends-->
                                </div>
                            </div>
                        </div>
                    </div>
                  
					
               
                    </div>
                </div>
                <!--main content ends-->
				
				
            </section>
            <!-- content -->
        </aside>
        <!-- right-side -->
    </div>
    <!-- ./wrapper -->
    
	
	<%@include file="../includes/footer.jsp" %> 
    <!-- end of global js -->
    <!-- begining of page level js -->
    <script src="${pageContext.request.contextPath}/resources/js/carousel.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        $('#myCarousel').carousel({
            interval: 4000
        });

        var clickEvent = false;
        $('#myCarousel').on('click', '.nav a', function() {
            clickEvent = true;
            $('.nav li').removeClass('active');
            $(this).parent().addClass('active');
        }).on('slid.bs.carousel', function(e) {
            if (!clickEvent) {
                var count = $('.nav').children().length - 1;
                var current = $('.nav li.active');
                current.removeClass('active').next().addClass('active');
                var id = parseInt(current.data('slide-to'));
                if (count == id) {
                    $('.nav li').first().addClass('active');
                }
            }
            clickEvent = false;
        });
    });
    </script>
    <!-- end of page level js -->
</body>
</html>