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
        <title>Hanseo Car rent_admin_login</title>

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
				                </ul><!--/.nav -->
				            </div><!-- /.navbar-collapse -->
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
			<!-- Admin_login start-->
			<div class="container">
				<div class="row">
					<div class="col-md-11">
						<div class="model-search-content">
							<div class="row">
								<div class="col-md-offset-1 col-md-10 col-sm-12">

									<form id = "login_admin_Form" action="fc_login_ok_admin.jsp" method="post" onsubmit="return loginFunction()">
										<div style="text-align:center">ADMIN LOGIN</div>
										<div class="single-model-search">
											<h2>ID</h2>									
											<input type="text" id="Admin_id" name="Admin_id" placeholder="ID를 입력하세요" required>														
										</div>
										<div class="single-model-search">
											<h2>PASSWORD</h2>									
											<input type="password" id="Admin_pw" name="Admin_pw" placeholder="PASSWORD 입력하세요" required>											
										</div>								
										<div class="col-md-11 col-sm-12">
											<div class="single-model-search text-center">
												<button type="submit" class="welcome-btn model-search-btn">
													Login
												</button>
												<button type="button" class="welcome-btn model-search-btn" onclick="navigateTo('User_login')">
													user-login
												</button>											
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Admin_login end-->
		</section><!--/.welcome-hero-->
		<!--welcome-hero end -->

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

		<!-- Login 버튼 클릭 시 ID와 PASSWORD 값을 가져와서 처리하는 함수 -->
		<script>			
			function loginFunction() {
				const adminId = document.getElementById("Admin_id").value.trim(); // .trim() 수정
    			const adminPassword = document.getElementById("Admin_pw").value.trim();

    			// 입력값 확인
    			if (!adminId || !adminPassword) {
        			alert("ID와 PASSWORD를 모두 입력해주세요.");
        			return false; // 폼 제출 중단
    			}

    			return true; // 폼 제출 진행
			}
		
			// JSP 페이지로 이동
			function navigateTo(page) {
				window.location.href = `${page}.jsp`;
			}
		</script>
		
        
    </body>
	
</html>