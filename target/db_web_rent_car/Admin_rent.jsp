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
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		
        <!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
		

    </head>
	
	<body>
		<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
	
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
									<li class="scroll"><a href="Admin_rent.jsp" onclick="navigateTo('Admin_rent')">Car rent</a></li>
									<li class="scroll"><a href="Admin_management.jsp" onclick="navigateTo('Admin_management')">Car management</a></li>
									<li class="scroll"><a href="Admin_money.jsp" onclick="navigateTo('Admin_money')">Cost</a></li>
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
					<p>List of <span>Registered</span> Users</p>
					<h2>User Information</h2>
				</div>	
				<div class="row">
					<!-- Left Column: Users waiting to rent a car -->
					<div class="col-md-6">
						<h3>Users Waiting to Rent</h3>
						<div id="waiting-users-list" class="featured-users-content">
							<!-- 차량 대기 중 사용자 목록이 여기에 추가됩니다. -->
						</div>
					</div>
		
					<!-- Right Column: Users currently renting a car -->
					<div class="col-md-6">
						<h3>Users Currently Renting</h3>
						<div id="renting-users-list" class="featured-users-content">
							<!-- 차량을 빌린 사용자 목록이 여기에 추가됩니다. -->
						</div>
					</div>
				</div>				
			</div>
		</section>
		<style>
			.featured-cars .col-md-6 {
				float: left;
				padding: 30px;
			}
			.featured-cars .row {
				display: flex;
				flex-wrap: wrap;
			}
			#waiting-users-list, #renting-users-list {
				margin-top: 30px;
			}
		</style>
		<script>
			// 서버에서 사용자 목록을 가져와 각 섹션에 추가하는 함수
			function loadUsers() {
				fetch('/get_users')
					.then(response => response.json())
					.then(users => {
						const waitingList = document.getElementById('waiting-users-list');
						const rentingList = document.getElementById('renting-users-list');
						
						waitingList.innerHTML = ''; // 초기화
						rentingList.innerHTML = ''; // 초기화
		
						users.forEach(user => {
							const userHTML = `
								<div class="single-featured-users">
									<div class="featured-user-txt">
										<h2><a href="#">${user.name}</a></h2>
										<p>ID: ${user.id}</p>
										<p>Email: ${user.email}</p>
									</div>
								</div>`;
							
							if (user.status === 'waiting') {
								waitingList.innerHTML += userHTML;
							} else if (user.status === 'renting') {
								rentingList.innerHTML += userHTML;
							}
						});
					})
					.catch(error => console.error('Error loading users:', error));
			}
			//페이지 로드시 사용자 목록 보여줌.
			document.addEventListener("DOMContentLoaded", loadUsers);
		</script>

		<!--car-rent-start-->
		<section>
			<div class="container">
				<div class="row" style="margin-top: 200px;">
					<div class="col-md-11">
						<div class="model-search-content">
							<div class="row">
								<div class="col-md-offset-1 col-md-10 col-sm-12">								
									<div class="single-model-search">
										<h2>USER ID</h2>									
										<input type="text" id="userId" placeholder="아이디를 입력하세요" required>														
									</div>														
									<div class="col-md-11 col-sm-12">
										<div class="single-model-search text-center">										
											<button class="welcome-btn model-search-btn" onclick="AssignFunction1()">
												승인
											</button>
											<button class="welcome-btn model-search-btn" onclick="AssignFunction2()">
												반납
											</button>
										</div>
									</div>									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--car-rent-end-->
		
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

			function AssignFunction1() { //승인버튼
				const userId = document.getElementById("userId").value;
				
				if (!userId) {
					alert("아이디를 다시 입력하세요.");
					return;
				}
		
				// 예시: 서버로 데이터를 보내는 POST 요청
				fetch("your_login_api_endpoint", {
					method: "POST",
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify({id: userId})
				})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						alert("차량 삭제 성공!");
						// 차량 삭제 성공 시 이동할 페이지 설정
						window.location.href = "Admin_rent.jsp";
					} else {
						alert("차량 삭제 실패: " + data.message);
					}
				})
				.catch(error => console.error("Error:", error));
			}

			function AssignFunction2() { //반납 버튼
				const userId = document.getElementById("userId").value;
				
				if (!userId) {
					alert("아이디를 다시 입력하세요.");
					return;
				}
		
				// 예시: 서버로 데이터를 보내는 POST 요청
				fetch("your_login_api_endpoint", {
					method: "POST",
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify({id: userId})
				})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						alert("차량 반납 성공!");
						// 차량 삭제 성공 시 이동할 페이지 설정
						window.location.href = "Admin_rent.jsp";
					} else {
						alert("차량 반납 실패: " + data.message);
					}
				})
				.catch(error => console.error("Error:", error));
			}
		
			// JSP 페이지로 이동
			function navigateTo(page) {
				window.location.href = `${page}.jsp`;
			}
		</script>
    </body>
	
</html>