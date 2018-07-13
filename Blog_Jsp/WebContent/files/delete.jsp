<%@page import="java.io.File"%>
<%@page import="com.simple.files.dto.FilesDto"%>
<%@page import="com.simple.files.dao.FilesDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 파일 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));

	FilesDao dao = FilesDao.getInstance();
	FilesDto dto = dao.getData(num);
	
	//파일 시스템에서 삭제하기 위해서는 저장된 파일명을 알아야한다.
	String saveFileName = dao.getData(num).getSaveFileName();
	
	boolean isDeleteSuccess = false;

	//세션의 아이디와 삭제할 글의 작성자와 같은지 한 번 더 확인
	String id =(String) session.getAttribute("id");
	if(id.equals(dto.getWriter())) {
		//1. DB에서 파일 정보 삭제
		dao.delete(num);
		//2. WebContent/upload 폴더에서 실제 파일 삭제
		String path = application.getRealPath("/upload") + File.separator + saveFileName;
		
		System.out.println("path : " + path);
		//File 객체를 생성해서 삭제
		new File(path).delete();
		isDeleteSuccess = true;
	}
%>
{"isDeleteSuccess" : <%=isDeleteSuccess%>}