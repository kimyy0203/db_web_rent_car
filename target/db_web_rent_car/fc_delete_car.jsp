<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String Car_id = request.getParameter("Car_id");  // 차량 번호
    	
	// 1.변수선언
    String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root";
	String dbPwd = "0808";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 2. 자동차 아이디 있는지 체크 SQL
	String checkSql = "SELECT COUNT(*) FROM car WHERE Car_id = ?";
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
		// 3. 자동차 아이디 중복 체크
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, Car_id);
        rs = pstmt.executeQuery();

		rs.next(); // 결과의 첫 번째 값 가져오기
        int count = rs.getInt(1); // 중복된 Car_id의 수 확인

		if (count == 0) { // Car_id가 존재하지 않은 경우
            response.sendRedirect("fc_delete_car_fail.jsp?error=duplicate");
            return;
        }

		// 4. 대여 중인 차량은 삭제 불가능 하므로 대여 중인 차량 확인
		String checkRentingSql = "SELECT COUNT(*) FROM renting WHERE Car_id = ?";
		pstmt = conn.prepareStatement(checkRentingSql);
		pstmt.setString(1, Car_id); // 차량 번호

		rs = pstmt.executeQuery();
		if (rs.next()) {
    		count = rs.getInt(1); // 대여 중인 Car_id의 수 확인
		} else {
    		count = 0; // 기본값 설정
		}

		if (count > 0) { // Car_id가 reting 테이블에 존재하는 경우
            response.sendRedirect("fc_delete_car_fail.jsp?error=duplicate");
            return;
        }

		// 5. 해당 차량 번호가 있을 경우 데이터 삽입
		String deleteSql = "DELETE FROM car WHERE Car_id = ?";
		pstmt = conn.prepareStatement(deleteSql);
		pstmt.setString(1, Car_id); // 차량 번호
       		
		// 6. sql문 실행
		int result = pstmt.executeUpdate();
		
		if (result == 1) { // 성공적으로 삭제된 경우
            response.sendRedirect("fc_getinfo_car.jsp");
        } else { // 삭제 실패한 경우
            response.sendRedirect("fc_delete_car_fail.jsp");
        }
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("fc_delete_car_fail.jsp?error=exception");
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