<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//인증정보(세션삭제)

    response.setHeader("Cache-Control", "no-store"); // 브라우저 캐시 방지
    response.setHeader("Pragma", "no-cache"); // 캐시 방지
    response.setHeader("Expires", "0"); // 캐시 방지
    
    /*
	HttpSession session = request.getSession(false);  // 기존 세션이 있을 경우만 반환
    if (session != null) {
        session.invalidate();  // 세션 무효화
    }
    */

    session.invalidate(); // 세션 무효화

	response.sendRedirect("index.jsp"); // 사용자 로그인 화면(웹 프로젝트의 초기 화면)으로 다시 이동
%>