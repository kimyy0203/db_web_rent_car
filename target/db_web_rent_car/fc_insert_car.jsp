<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String Car_id = request.getParameter("Car_id");  // 차량 번호
    String Car_type = request.getParameter("Car_type");  // 차량 종류
    String Car_name = request.getParameter("Car_name");  // 차량 이름
    String Car_cost = request.getParameter("Car_cost");  // 차량 가격
	
	// 1.변수선언
    String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root";
	String dbPwd = "0808";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 2. 자동차 아이디 중복 체크 SQL
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

		if (count > 0) { // 중복된 Car_id가 존재할 경우
            response.sendRedirect("fc_insert_car_fail.jsp?error=duplicate");
            return;
        }
		// 4. 중복이 없을 경우 데이터 삽입
		String insertSql = "INSERT INTO car (Car_id, Car_type, Car_name, Car_cost) VALUES (?, ?, ?, ?)";
		pstmt = conn.prepareStatement(insertSql);
		pstmt.setString(1, Car_id); // 차량 번호
        pstmt.setString(2, Car_type); // 차량 종류
        pstmt.setString(3, Car_name); // 차량 이름
        pstmt.setInt(4, Integer.parseInt(Car_cost)); // 차량 가격 (정수형으로 변환)		
		// 5. sql문 실행
		int result = pstmt.executeUpdate();
		
		if (result == 1) { // 성공적으로 추가된 경우
            response.sendRedirect("fc_getinfo_car.jsp");
        } else { // 삽입 실패한 경우
            response.sendRedirect("fc_insert_car_fail.jsp");
        }
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("fc_insert_car_fail.jsp?error=exception");
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