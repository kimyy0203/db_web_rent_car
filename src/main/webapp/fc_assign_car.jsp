<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String User_id = request.getParameter("User_id");  // 대여 승인 해줄 사용자 ID
		
	// 1.변수선언
    String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root";
	String dbPwd = "0808";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 2. 사용자 ID 유무 체크 SQL
	String checkSql = "SELECT COUNT(*) FROM renting WHERE User_id = ?";	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);		
		// 3. 신청 사용자 유무 체크
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, User_id);
        rs = pstmt.executeQuery();

		rs.next(); // 결과의 첫 번째 값 가져오기
        int count = rs.getInt(1); // 사용자 아이디 유무

		if (count == 0) { // 해당 사용자 ID가 신청 현황에 없음
            response.sendRedirect("fc_assign_car_fail.jsp?error=duplicate");
            return;
        }

		// 4. 대여 승인 날짜 기록 SQL
		String sql = "UPDATE renting SET Date_st = NOW() WHERE User_id = ? AND Date_st IS NULL";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, User_id);	
		
		// 5. sql문 실행
		int result = pstmt.executeUpdate();
		
		if(result == 1){ // 성공
			response.sendRedirect("fc_assign_car_succes.jsp");
		} else{ // 실패
			response.sendRedirect("fc_assign_car_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("fc_assign_car_fail.jsp?error=exception");
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