<%@page import="com.simple.board.dao.BoardDao"%>
<%@page import="com.simple.board.dto.BoardDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String id = (String) session.getAttribute("id");
	
	boolean isInsertSuccess = false;
	
	if(id != null && writer!=null && id.equals(writer)) {
		BoardDto dto = new BoardDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		isInsertSuccess = BoardDao.getInstance().insert(dto);
	}
%>
{ "isInsertSuccess" : <%=isInsertSuccess%>}