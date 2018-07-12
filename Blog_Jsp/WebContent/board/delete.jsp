<%@page import="com.simple.board.dao.BoardDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	boolean isDeleteSuccess = BoardDao.getInstance().delete(num);
%>
{ "isDeleteSuccess" : <%=isDeleteSuccess%>}