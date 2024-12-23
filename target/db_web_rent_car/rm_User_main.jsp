<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

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
        <title>Hanseo Car rent_admin_management</title>

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
									<li class="scroll"><a href="fc_getinfo_user_assign.jsp" onclick="navigateTo('fc_getinfo_user_assign')">Car rent</a></li>
									<li class="scroll"><a href="Admin_management.jsp" onclick="navigateTo('Admin_management')">Car management</a></li>
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

			<div class="container">
				<div class="row" style="margin-bottom: 200px;">
					<div class="col-md-11">
						<div class="model-search-content">
							<div class="row">
								<div class="col-md-offset-1 col-md-10 col-sm-12">
									<div style="text-align:center">차량 추가</div>
									<div class="single-model-search">
										<h2>차량 번호</h2>									
										<input type="text" id="carNumber" placeholder="차량 번호를 입력하세요" required>														
									</div>
									<div class="single-model-search">
										<h2>차량 모델</h2>										
									<div class="model-select-icon">
										<select class="form-control">
											  <option value="default">차량 모델</option><!-- /.option-->
											  <option value="소형차">소형차</option><!-- /.option-->
											<option value="세단">세단</option><!-- /.option-->
											  <option value="SUV">SUV</option><!-- /.option-->
											  <option value="벤">벤</option><!-- /.option-->
											<option value="기타">기타</option><!-- /.option-->
										</select><!-- /.select-->
									</div><!-- /.model-select-icon -->					
								    </div>
									<div class="single-model-search">
										<h2>가격</h2>									
										<input type="text" id="carPrice" placeholder="가격을 입력하세요" required>														
									</div>
									<div class="single-model-search">
										<h2>차량 이름</h2>									
										<input type="text" id="carName" placeholder="차량 이름을 입력하세요" required>														
									</div>
												
									<div class="col-md-11 col-sm-12">
										<div class="single-model-search text-center">
											<button class="welcome-btn model-search-btn" onclick="CreateFunction()">
												Create
											</button>											
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section><!--/.welcome-hero-->
		<!--welcome-hero end -->

		<section id="featured-cars" class="featured-cars">
    <div class="container">
        <div class="section-header">
            <p>Various <span>types of</span> cars</p>
            <h2>Type of car</h2>
        </div>
        <div id="cars-list" class="featured-cars-content">
            <!-- 자동차 정보 테이블 -->
            <table class="table table-striped" style="border: 1px solid black; border-collapse: collapse;">
                <thead>
                    <tr>
                        <th>Car ID</th>
                        <th>Car Type</th>
                        <th>Car Name</th>
                        <th>Car Cost</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rent_car", "root", "0808");
                            String sql = "SELECT * FROM car";
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("Car_id") %></td>
                        <td><%= rs.getString("Car_type") %></td>
                        <td><%= rs.getString("Car_name") %></td>
                        <td><%= rs.getInt("Car_cost") %></td>
                    </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (pstmt != null) pstmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</section>


		<script>
			// AJAX를 통해 서버에서 차량 목록을 가져와 추가하는 함수
			function loadCars() {
				fetch('/get_cars')
					.then(response => response.json())
					.then(cars => {
						const carsList = document.getElementById('cars-list');
						carsList.innerHTML = ''; // 초기화
						cars.forEach(car => {
							carsList.innerHTML += `
								<div class="col-lg-3 col-md-4 col-sm-6">
									<div class="single-featured-cars">
										<div class="featured-img-box">
											<div class="featured-cars-img">
												<img src="${car.image_url}" alt="car">
											</div>
										</div>
										<div class="featured-cars-txt">
											<h2><a href="#">${car.model}</a></h2>
											<h3>$${car.price}</h3>
										</div>
									</div>
								</div>`;
						});
					})
					.catch(error => console.error('Error loading cars:', error));
			}
		
			// 페이지 로드 시 차량 목록을 불러옵니다.
			document.addEventListener("DOMContentLoaded", loadCars);
		</script>

		<section>
			<div class="container">
				<div class="row" style="margin-top: 200px;">
					<div class="col-md-11">
						<div class="model-search-content">
							<div class="row">
								<div class="col-md-offset-1 col-md-10 col-sm-12">								
									<div class="single-model-search">
										<h2>차량 삭제</h2>									
										<input type="text" id="carNumber" placeholder="차량 번호를 입력하세요" required>														
									</div>														
									<div class="col-md-11 col-sm-12">
										<div class="single-model-search text-center">										
											<button class="welcome-btn model-search-btn" onclick="DeleteFunction()">
												Delete
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
        
		<!-- Create 버튼 클릭 시 차량 고유번호 값을 가져와서 처리하는 함수 -->
		<script>
		function logoutFunction() { // 로그아웃 버튼
				window.location.href = `fc_logout.jsp`;
			}

		function CreateFunction() {
			const carNumber = document.getElementById("carNumber").value;
			const carModel = document.querySelector("#car-model").value;
			const carPrice = document.getElementById("carPrice").value;
			const carName = document.getElementById("carName").value;
	
			if (!carNumber || carModel === "default" || !carPrice || !carName) {
				alert("모두 입력해주세요.");
				return;
			}
	
			// 차량 생성 요청
			fetch("/create_car", {
				method: "POST",
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					car_number: carNumber,
					model: carModel,
					price: carPrice,
					car_Name: carName
				})
			})
			.then(response => response.json())
			.then(data => {
				if (data.success) {
					alert("차량 추가 성공!");
					loadCars(); // 차량 목록 새로고침
				} else {
					alert("차량 추가 실패: " + data.message);
				}
			})
			.catch(error => console.error("Error:", error));
		}
		</script>
		<script>
			function DeleteFunction() {
				const carNumber = document.getElementById("carNumber").value;
				
				if (!carNumber) {
					alert("차량 번호를 다시 입력하세요.");
					return;
				}
		
				// 예시: 서버로 데이터를 보내는 POST 요청
				fetch("your_login_api_endpoint", {
					method: "POST",
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify({id: carNumber})
				})
				.then(response => response.json())
				.then(data => {
					if (data.success) {
						alert("차량 삭제 성공!");
						// 차량 삭제 성공 시 이동할 페이지 설정
						window.location.href = "Admin_management.jsp";
					} else {
						alert("차량 삭제 실패: " + data.message);
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