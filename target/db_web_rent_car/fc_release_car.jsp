<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
        // 오토 커밋을 종료시키고, 트랜잭션이 유지되도록 한다
        conn.setAutoCommit(false); 

		// 3. 사용자 ID 유무 및 대여 상태 확인
        String checkSql = "SELECT Car_id, Date_st FROM renting WHERE User_id = ?";
        pstmt = conn.prepareStatement(checkSql);
        pstmt.setString(1, User_id);
        rs = pstmt.executeQuery();

		if (!rs.next()) { // renting 테이블에 해당 User_id 없음
            response.sendRedirect("fc_release_car_fail.jsp?error=no_record");
            conn.rollback(); // 롤백
            return;
        }

        String Car_id = rs.getString("Car_id");
        Date Date_st = rs.getDate("Date_st");

        if (Date_st == null) { // Date_st가 NULL이면 반납 불가
            response.sendRedirect("fc_release_car_fail.jsp?error=invalid_status");
            conn.rollback(); // 롤백
            return;
        }

		// 4. 대여 반납 날짜 기록 SQL
		String sql = "UPDATE renting SET Date_end = NOW() WHERE User_id = ? AND Date_end IS NULL";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, User_id);	
		
		int updateResult = pstmt.executeUpdate();
		
		if (updateResult == 0) { // 업데이트 실패 시
            response.sendRedirect("fc_release_car_fail.jsp?error=update_failed");
            conn.rollback(); // 롤백
            return;
        }

        // 5.. Car_cost 가져오기
        String costSql = "SELECT Car_cost FROM car WHERE Car_id = ?";
        pstmt = conn.prepareStatement(costSql);
        pstmt.setString(1, Car_id);
        rs = pstmt.executeQuery();

        if (!rs.next()) { // Car_id가 car 테이블에 없음
            response.sendRedirect("fc_release_car_fail.jsp?error=car_not_found");
            conn.rollback(); // 롤백
            return;
        }

        int Car_cost = rs.getInt("Car_cost");

        // 6. 빌린 날 수 계산 및 총 비용 계산
        String diffSql = "SELECT DATEDIFF(NOW(), Date_st) AS rent_days FROM renting WHERE User_id = ?";
        pstmt = conn.prepareStatement(diffSql);
        pstmt.setString(1, User_id);
        rs = pstmt.executeQuery();

        rs.next();
        int daysRented = rs.getInt("rent_days");
        int Cost_sum = daysRented * Car_cost;

        // 7. Cost 테이블에 정보 저장
        String insertCostSql = "INSERT INTO cost (User_id, Date_st, Date_end, Cost_sum) VALUES (?, ?, NOW(), ?)";
        pstmt = conn.prepareStatement(insertCostSql);
        pstmt.setString(1, User_id);
        pstmt.setDate(2, new java.sql.Date(Date_st.getTime()));
        pstmt.setInt(3, Cost_sum);

        int insertResult = pstmt.executeUpdate();

        if (insertResult == 0) { // Cost 테이블에 삽입 실패
            response.sendRedirect("fc_release_car_fail.jsp?error=insert_failed");
            conn.rollback(); // 롤백
            return;
        }

        // 8. renting 테이블에서 사용자 데이터 삭제
        String deleteSql = "DELETE FROM renting WHERE User_id = ?";
        pstmt = conn.prepareStatement(deleteSql);
        pstmt.setString(1, User_id);

        int deleteResult = pstmt.executeUpdate();

        if (deleteResult == 0) { // renting 데이터 삭제 실패
            response.sendRedirect("fc_release_car_fail.jsp?error=delete_failed");
            conn.rollback(); // 롤백
            return;
        }

        // 9. 성공 페이지로 리다이렉트
        conn.commit(); // 모든 과정(sql문)이 성공 시 커밋
        response.sendRedirect("fc_release_car_succes.jsp");

	} catch(Exception e){
		e.printStackTrace();
        if(conn != null) {
            conn.rollback(); // 롤백
        }
		response.sendRedirect("fc_release_car_fail.jsp?error=exception");
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