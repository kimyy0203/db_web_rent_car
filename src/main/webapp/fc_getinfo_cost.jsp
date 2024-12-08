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
	String sql = "SELECT cost.User_id, cost.Date_st, cost.Date_end, cost.Cost_sum, user.User_name FROM cost LEFT JOIN user ON cost.User_id = user.User_id ORDER BY Date_end, Date_st";
	
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
            carData.put("User_id", rs.getString("User_id"));
            carData.put("Date_st", rs.getString("Date_st"));
            carData.put("Date_end", rs.getString("Date_end"));
            carData.put("Cost_sum", rs.getInt("Cost_sum"));
            carData.put("User_name", rs.getString("User_name"));

            // 리스트에 추가
            carList.add(carData);
        }
		
		// 데이터를 request 객체에 저장
        request.setAttribute("carList", carList);

        // 다음 JSP로 포워드
        request.getRequestDispatcher("Admin_money.jsp").forward(request, response);

	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("Admin_money.jsp");
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