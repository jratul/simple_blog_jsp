<%@page import="com.simple.board.dao.BoardDao"%>
<%@page import="com.simple.board.dto.BoardDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String id = (String) session.getAttribute("id");
	
	boolean isUpdateSuccess = false;
	
	if(id != null && writer != null && id.equals(writer)) {
		BoardDto dto = new BoardDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		isUpdateSuccess = BoardDao.getInstance().update(dto);
	}
%>
{ "isUpdateSuccess" : <%=isUpdateSuccess%>}