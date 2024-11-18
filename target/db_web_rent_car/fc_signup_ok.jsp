<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String User_id = request.getParameter("User_id");
	String User_pw = request.getParameter("User_pw");
	String User_name = request.getParameter("User_name");
	
	// 1.변수선언
    String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root";
	String dbPwd = "0808";

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "INSERT INTO user (User_id, User_pw, User_name) VALUES (?, ?, ?)";
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, User_id);
		pstmt.setString(2, User_pw);
		pstmt.setString(3, User_name);
		
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("fc_signup_succes.jsp");
		} else{ // 실패
			response.sendRedirect("fc_signup_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>