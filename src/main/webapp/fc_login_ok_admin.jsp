<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String Admin_id = request.getParameter("Admin_id");
	String Admin_pw = request.getParameter("Admin_pw");
	
	// 1.변수선언
    String jdbcUrl = "jdbc:mysql://localhost:3306/rent_car";
	String dbId = "root";
	String dbPwd = "0808";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 2. 관리자 아이디, 패스워드 유무 확인 SQL
	String sql = "SELECT * FROM admin WHERE Admin_id = ? AND Admin_pw = ?";
	
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
		
		// 3. pstmt 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, Admin_id);  // 입력받은 아이디를 쿼리로 설정
        pstmt.setString(2, Admin_pw);  // 입력받은 비밀번호를 쿼리로 설정

		// 쿼리 실행
        rs = pstmt.executeQuery();

		if (rs.next()) {  // 로그인 성공 (인증의 수단: session)
            String Admin_name = rs.getString("Admin_name");

            // 세션에 관리자 정보 저장
            // HttpSession session = request.getSession();
            session.setAttribute("Admin_id", Admin_id);
            session.setAttribute("Admin_name", Admin_name);

            // 로그인 성공 시 페이지 이동
            response.sendRedirect("Admin_rent.jsp"); // 관리자 대여 페이지로 이동

        } else {  // 로그인 실패
            response.sendRedirect("fc_login_fail_admin.jsp"); // 실패 페이지로 이동
        }
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("Admin_login.jsp?error=exception");
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