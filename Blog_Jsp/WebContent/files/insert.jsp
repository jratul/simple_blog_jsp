<%@page import="com.simple.files.dao.FilesDao"%>
<%@page import="com.simple.files.dto.FilesDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realPath = application.getRealPath("/upload");

	int sizeLimit = 1024*1024*50;
	
	MultipartRequest mr = new MultipartRequest(request,
			realPath,
			sizeLimit,
			"utf-8",
			new DefaultFileRenamePolicy());
	
	String title = mr.getParameter("title");
	String orgFileName = mr.getOriginalFileName("myFile");
	String saveFileName = mr.getFilesystemName("myFile");
	long fileSize = mr.getFile("myFile").length();
	
	String writer = (String) session.getAttribute("id");
	boolean isInsertSuccess = false;
	if(writer != null) {
		FilesDto dto = new FilesDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		
		isInsertSuccess = FilesDao.getInstance().insert(dto);
	}
%>
{ "isInsertSuccess" : <%=isInsertSuccess %>}

