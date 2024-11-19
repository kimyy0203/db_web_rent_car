<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String User_id = request.getParameter("User_id");
	String User_pw = request.getParameter("User_pw");
	
	// 1.변수선언
    String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root";
	String dbPwd = "0808";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 2. 아이디, 패스워드 유무 확인 SQL
	String sql = "SELECT * FROM user WHERE User_id = ? AND User_pw = ?";
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
		// 3. pstmt 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, User_id);  // 입력받은 아이디를 쿼리로 설정
        pstmt.setString(2, User_pw);  // 입력받은 비밀번호를 쿼리로 설정

		// 쿼리 실행
        rs = pstmt.executeQuery();

		if (rs.next()) {  // 로그인 성공 (인증의 수단: session)
            String User_name = rs.getString("User_name");

            // 세션에 사용자 정보 저장
            session.setAttribute("User_id", User_id);
            session.setAttribute("User_name", User_name);

            // 로그인 성공 시 페이지 이동
            response.sendRedirect("User_rent.jsp"); // 사용자 대여 페이지로 이동

        } else {  // 로그인 실패
            response.sendRedirect("fc_login_fail.jsp"); // 실패 페이지로 이동
        }
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("User_login.jsp?error=exception");
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