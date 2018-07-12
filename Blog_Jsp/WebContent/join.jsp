<%@page import="com.simple.users.dao.UsersDao"%>
<%@page import="com.simple.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ajax 요청 파라미터 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	UsersDao dao = UsersDao.getInstance();
	
	boolean canUseId = dao.canUseId(id);
	boolean isJoinSuccess = false;
	
	if(canUseId) {
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		isJoinSuccess = dao.insert(dto);
	} 
%>
{"isJoinSuccess" : <%=isJoinSuccess%>}