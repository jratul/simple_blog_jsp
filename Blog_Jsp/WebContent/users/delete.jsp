<%@page import="com.simple.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");

	boolean isDeleteSuccess = false;

	if(id != null) {
		isDeleteSuccess = UsersDao.getInstance().delete(id);
	}
	session.invalidate();
%>
{ "isDeleteSuccess" : <%=isDeleteSuccess%>}