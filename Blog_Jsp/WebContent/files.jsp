<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.simple.files.dao.FilesDao"%>
<%@page import="com.simple.files.dto.FilesDto"%>
<%@page import="com.simple.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Blog - Files</title>

<script src="js/jquery-3.3.1.js"></script>
<script src="js/gallery.js"></script>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="css/clean-blog.min.css" rel="stylesheet">

<style>
	.td-img {
		width: 200px;
		height: 200px;
	}
	.td-thumb {
		cursor: pointer;
	}
	.td-thumb:hover {
		transform: scale(1.05);
		transition: transform 0.4s ease-out;
	} 
</style>

</head>

<body>
	<%
		List<FilesDto> list = FilesDao.getInstance().getList();

		int numOfFiles = list.size();

		String cPath = request.getContextPath();
		String id = (String) session.getAttribute("id");
		if (id == null) {
			id = "";
		}
	%>
	<!-- Navigation -->
	<%@include file="nav.jsp"%>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('img/files-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">
						<h1>Files</h1>
						<span class="subheading">Upload your files.</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class=" col-sm-12 mx-auto">
				<h3>Files</h3>
				<hr />
				<%if(!id.equals("")) { %>
				<a class="btn btn-success" href="files_upload_form.jsp">Upload</a> <br />
				<%} %>
				<br />
				<table class="table table-striped">
					<colgroup>
						<col width="33%" />
						<col width="33%" />
						<col width="33%" />
					</colgroup>

					<%
						for (int i = 0; i < Math.ceil(numOfFiles / 3.0); i++) {
					%>
					<tr>
						<%
							for (int j = 0; j < 3; j++) {
						%>
						<td style="position: relative;">
							<%
								if (i * 3 + j < numOfFiles) {
									FilesDto dto = list.get(i * 3 + j);
							%> <center><strong class="title"><%=dto.getTitle()%></strong></center><br />
							<center>
								<% 
								Pattern p = Pattern.compile("\\.(jpg|jpeg|png|gif)$", Pattern.CASE_INSENSITIVE);
								Matcher m = p.matcher(dto.getSaveFileName());
								if(m.find()) {
								%>
								<img src="<%=cPath%>/upload/<%=dto.getSaveFileName()%>"
									class="img-responsive img-thumbnail td-img td-thumb" />
								<%}else { %>
								<img src="img/no-image.png" class="img-responsive img-thumbnail td-img"/>
								<%} %>
								<center>
									<br />
									<%=dto.getWriter()%>
									<br />
									<%=dto.getRegdate()%>
									<br />
									<%=dto.getOrgFileName()%>(<%=dto.getFileSize() %> Bytes) <br />
									Downloads : <%=dto.getDownCount() %> <br />
									<a href="files/download.jsp?num=<%=dto.getNum() %>" onclick="javascript:reloadList()" class="btn btn btn-primary">Download</a>
									<%if(id.equals(dto.getWriter())) { %>
									<button class="btn btn-danger td-btn"
										onclick="javascript:deleteFile(<%=dto.getNum()%>)">Delete</button>
									<%} %>
								<%
									}
								%>
						</td>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>

	<hr>

	<!-- Footer -->
	<%@include file="footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/clean-blog.min.js"></script>
	<script src="js/jquery-3.3.1.js"></script>
	<script>
		function reloadList() {
			setTimeout(function() {
				window.location.reload();
			}, 100);
		}
		
		function deleteFile(num) {
			var willDelete = confirm("Do you really want to delete this file?");
			if(willDelete) {
				$.ajax({
					url: "files/delete.jsp",
					method: "post",
					data: {"num" : num},
					success : function(response) {
						if(response.isDeleteSuccess) {
							alert("Complete to delete this file.");
							location.reload();
						} else {
							alert("Fail to delete this file.");
						}
					},
					
					error: function(response) {
						alert("Fail to delete this file");
					}
				})
			}
		}
		
	</script>
</body>

</html>
