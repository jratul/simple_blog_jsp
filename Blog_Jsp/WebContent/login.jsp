<%@page import="com.simple.users.dao.UsersDao"%>
<%@page import="com.simple.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ajax 요청 파라미터 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String idSave = request.getParameter("idSave");
	
	//유효한 정보인지 확인
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	
	boolean isLoginSuccess = UsersDao.getInstance().isValid(dto);
	if(isLoginSuccess) {
		//로그인 처리하기
		session.setAttribute("id", id);
		if(idSave != null) {
			//savedId라는 쿠키 이름으로 id 저장하기
			Cookie cook = new Cookie("savedId", id);
			cook.setMaxAge(86400);
			response.addCookie(cook);
		}
	}
%>
{"isLoginSuccess":<%=isLoginSuccess%>}