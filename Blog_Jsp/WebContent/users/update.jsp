<%@page import="com.simple.users.dao.UsersDao"%>
<%@page import="com.simple.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	boolean isUpdateSuccess = UsersDao.getInstance().update(dto);
%>
{ "isUpdateSuccess" : <%= isUpdateSuccess %>}