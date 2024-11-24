<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String Car_id = request.getParameter("Car_id");  // 차량 번호
	String User_id = (String)session.getAttribute("User_id"); //사용자 ID
	if (User_id == null) {
    response.sendRedirect("User_login.jsp");
	}
    	
	// 1.변수선언
    String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root";
	String dbPwd = "0808";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 2. 자동차 중복 체크 SQL
	String checkSql = "SELECT COUNT(*) FROM renting WHERE Car_id = ?";
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
		// 3. 자동차 중복 체크
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, Car_id);
        rs = pstmt.executeQuery();

		rs.next(); // 결과의 첫 번째 값 가져오기
        int count = rs.getInt(1); // 중복된 아이디의 수

		if (count > 0) { // 중복된 차량이 있음
            response.sendRedirect("fc_rent_car_fail.jsp?error=duplicate");
            return;
        }

		// 4. 회원가입 SQL
		String sql = "INSERT INTO renting (User_id, Car_id, Date_st, Date_end) VALUES (?, ?, NULL, NULL)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, User_id);
		pstmt.setString(2, Car_id);
		
		
		// 5. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("fc_rent_car_succes.jsp");
		} else{ // 실패
			response.sendRedirect("fc_rent_car_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("fc_rent_car_fail.jsp?error=exception");
	} finally{
		try{
			if(rs != null) rs.close();
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>