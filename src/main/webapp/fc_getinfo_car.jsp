<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 관리자 세션 검증
	
	String Admin_id = (String)session.getAttribute("Admin_id");
	if (Admin_id == null) {
    response.sendRedirect("Admin_login.jsp");
	}
	

    // DB 연결에 필요한 변수 선언
	String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root"; // MySQL 사용자명
	String dbPwd = "0808"; // MySQL 비밀번호
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// MySQL에 맞게 SQL 문 작성 (컬럼명과 테이블명도 확인 필요)
	String sql = "SELECT * FROM car ORDER BY Car_type, Car_cost";
	
	try {
		// 드라이버 호출
		Class.forName("com.mysql.cj.jdbc.Driver");
		// conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);		
		// SQL 실행
		rs = pstmt.executeQuery();		
		List<Map<String, Object>> carList = new ArrayList<>();

		while (rs.next()) {
            // 각 행의 데이터를 맵에 저장
            Map<String, Object> carData = new HashMap<>();
            carData.put("Car_id", rs.getString("Car_id"));
            carData.put("Car_type", rs.getString("Car_type"));
            carData.put("Car_name", rs.getString("Car_name"));
            carData.put("Car_cost", rs.getInt("Car_cost"));

            // 리스트에 추가
            carList.add(carData);
        }		
		// 데이터를 request 객체에 저장
        request.setAttribute("carList", carList);
        // 다음 JSP로 포워드
        request.getRequestDispatcher("Admin_management.jsp").forward(request, response);

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