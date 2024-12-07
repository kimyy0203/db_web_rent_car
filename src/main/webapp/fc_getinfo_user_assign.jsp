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

   // 데이터를 저장할 리스트
    List<Map<String, Object>> carList1 = new ArrayList<>();
    List<Map<String, Object>> carList2 = new ArrayList<>();
   try {
      // 드라이버 호출
      Class.forName("com.mysql.cj.jdbc.Driver");
      // conn 생성
      conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);     
      // 첫 번째 쿼리 실행
        String sql1 = "SELECT * FROM renting WHERE Date_st IS NULL";
        pstmt = conn.prepareStatement(sql1);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Map<String, Object> carData = new HashMap<>();
            carData.put("User_id", rs.getString("User_id"));
            carData.put("Car_id", rs.getString("Car_id"));
            carList1.add(carData);
        }       
        // 두 번째 쿼리 실행
        String sql2 = "SELECT * FROM renting WHERE Date_st IS NOT NULL ORDER BY Date_st";
        pstmt = conn.prepareStatement(sql2);
        rs = pstmt.executeQuery();
        while (rs.next()) {
            Map<String, Object> carData = new HashMap<>();
            carData.put("User_id", rs.getString("User_id"));
            carData.put("Car_id", rs.getString("Car_id"));
            carData.put("Date_st", rs.getString("Date_st"));
            carList2.add(carData);
        }     	
		// 데이터를 request 객체에 저장
    	request.setAttribute("carList1", carList1);
   	request.setAttribute("carList2", carList2);
    	// Admin_rent.jsp로 포워드
    	request.getRequestDispatcher("Admin_rent.jsp").forward(request, response);

   } catch(Exception e) {
      e.printStackTrace();
      response.sendRedirect("Admin_rent.jsp");
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