<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// String id = (String)session.getAttribute("Admin_id");
    	// DB 연결에 필요한 변수 선언
	String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car"; // your_database_name 변경 필요
	String dbId = "root"; // MySQL 사용자명
	String dbPwd = "0808"; // MySQL 비밀번호
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// MySQL에 맞게 SQL 문 작성 (컬럼명과 테이블명도 확인 필요)
	String sql = "SELECT * FROM car";
	
	try {
		// 드라이버 호출
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		
		// SQL 실행
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			String Car_id = rs.getString("Car_id");
			String Car_type = rs.getString("Car_type");
			String Car_name = rs.getString("Car_name");
			int Car_cost = rs.getString("Car_cost");
			
			// 포워드로 전달하기 위해
			request.setAttribute("Car_id", Car_id);
			request.setAttribute("Car_type", Car_type);
			request.setAttribute("Car_name", Car_name);
			request.setAttribute("Car_cost", Car_cost);
			
			// 포워드 이동
			request.getRequestDispatcher("Admin_management.jsp").forward(request, response);
			
		} else { // 세션이 만료된 경우
			response.sendRedirect("Admin_login.jsp");
		}
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("Admin_login.jsp");
	} finally {
		try {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
			if (rs != null) rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>