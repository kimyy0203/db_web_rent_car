<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <!-- meta data -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!--font-family-->
		<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

		<link href="https://fonts.googleapis.com/css?family=Rufina:400,700" rel="stylesheet">
        
        <!-- title of site -->
        <title>Hanseo Car rent_admin_rent</title>

        <!-- For favicon png -->
		<link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--linear icon css-->
		<link rel="stylesheet" href="assets/css/linearicons.css">

        <!--flaticon.css-->
		<link rel="stylesheet" href="assets/css/flaticon.css">

		<!--animate.css-->
        <link rel="stylesheet" href="assets/css/animate.css">

        <!--owl.carousel.css-->
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
		<link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
		
        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- bootsnav -->
		<link rel="stylesheet" href="assets/css/bootsnav.css" >	
        
        <!--style.css-->
        <link rel="stylesheet" href="assets/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="assets/css/responsive.css">
    </head>
	
	<body>		
		<!--welcome-hero start -->
		<section id="home" class="welcome-hero">

			<!-- top-area Start -->
			<div class="top-area">
				<div class="header-area">
					<!-- Start Navigation -->
				    <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

				        <div class="container">

				            <!-- Start Header Navigation -->
				            <div class="navbar-header">
				                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
				                    <i class="fa fa-bars"></i>
				                </button>
				                <a class="navbar-brand" href="index.jsp">Hanseo Car rent<span></span></a>

				            </div><!--/.navbar-header-->
				            <!-- End Header Navigation -->	
							 <!-- Collect the nav links, forms, and other content for toggling -->
							 <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
								<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
									<li class="scroll"><a href="fc_getinfo_user_assign.jsp" onclick="navigateTo('fc_getinfo_user_assign')">Car rent</a></li>
									<li class="scroll"><a href="fc_getinfo_car.jsp" onclick="navigateTo('fc_getinfo_car')">Car management</a></li>
									<li class="scroll"><a href="fc_getinfo_cost.jsp" onclick="navigateTo('fc_getinfo_cost')">Cost</a></li>
									<li class="scroll"><a onclick="logoutFunction()">Log out</a></li>
								</ul>
							</div>
							<script>
								function navigateTo(page) {
    								console.log(`${page} 이동 중...`); // 디버깅용 콘솔 메시지
   									window.location.href = `${page}.jsp`;
								}
							</script>					            
				        </div><!--/.container-->
				    </nav><!--/nav-->
				    <!-- End Navigation -->
				</div><!--/.header-area-->
			    <div class="clearfix"></div>

			</div><!-- /.top-area-->
			<!-- top-area End -->

			<div class="container">
				<div class="welcome-hero-txt">
					<h2>we can service for you</h2>					
				</div>
			</div>

			

		</section><!--/.welcome-hero-->
		<!--welcome-hero end -->

		<section id="featured-cars" class="featured-cars">
			<div class="container">
				<div class="section-header">
					<p>비용 정산</p>
					<h2>Cost settlement</h2>
				</div>				
				<div id="waiting-users-list" class="featured-users-content">
					<!-- 차량 목록을 데이터베이스에서 가져오는 기능 페이지(fc_getinfo_car.jsp) -->
					
					<%-- <script>location.href="fc_getinfo_car.jsp"</script> --%>

					<!-- 차량 목록이 여기에 동적으로 추가됩니다. -->
					<table class="table table-striped" style="border: 1px solid black; border-collapse: collapse;">
						<thead>
							<tr>
								<th>User ID</th>
								<th>User Name</th>
								<th>Date_st</th>
								<th>Date_end</th>
								<th>Cost_sum</th>
							</tr>
						</thead>
						<tbody>
							<%
								// Get the car list from the request
								List<Map<String, Object>> carList = (List<Map<String, Object>>) request.getAttribute("carList");
								if (carList != null && !carList.isEmpty()) {
									for (Map<String, Object> car : carList) {
							%>
							<tr>
								<td><%= car.get("User_id") %></td>
								<td><%= car.get("User_name") %></td>
								<td><%= car.get("Date_st") %></td>
								<td><%= car.get("Date_end") %></td>
								<td><%= car.get("Cost_sum") %></td>
							</tr>
							<%
									}
								} else {
							%>
							<tr>
								<td colspan="5">No rental data available at the moment.</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>	
					<!-- 차량 목록 테이블 출력 끝-->
				</div>							
			</div>
		</section>
		
		<!--contact start-->
		<footer id="contact"  class="contact">
			<div class="container">
				<div class="footer-top">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="single-footer-widget">
								<div class="footer-logo">
									<a href="index.jsp">hanseo car rent</a>
								</div>
								
								<div class="footer-contact">
									<p>문의: do0108081@gmail.com</p>						
								</div>
							</div>
						</div>
							
					</div>
				</div>
			</div><!--/.container-->

			<div id="scroll-Top">
				<div class="return-to-top">
					<i class="fa fa-angle-up " id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
				</div>
				
			</div><!--/.scroll-Top-->
			
        </footer><!--/.contact-->
		<!--contact end-->


		
		<!-- Include all js compiled plugins (below), or include individual files as needed -->

		<script src="assets/js/jquery.js"></script>
        
        <!--modernizr.min.js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
		
		<!--bootstrap.min.js-->
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- bootsnav js -->
		<script src="assets/js/bootsnav.js"></script>

		<!--owl.carousel.js-->
        <script src="assets/js/owl.carousel.min.js"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

        <!--Custom JS-->
        <script src="assets/js/custom.js"></script>
        
		<script>
			function logoutFunction() { // 로그아웃 버튼
				window.location.href = `fc_logout.jsp`;
			}
		
			// JSP 페이지로 이동
			function navigateTo(page) {
				window.location.href = `${page}.jsp`;
			}
		</script>
    </body>
	
</html>