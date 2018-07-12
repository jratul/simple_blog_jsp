<%@page import="com.simple.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));

	BoardDto dto = BoardDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Blog - Board</title>

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

</head>

<body>

	<!-- Navigation -->
	<%@include file="nav.jsp"%>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('img/board-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">
						<h1>Board</h1>
						<span class="subheading">Leave your opinion.</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class=" col-sm-12 mx-auto">
				<h3>Board</h3>
				<hr />
				<table class="table table-bordered">
					<tr>
						<th style="width: 10%">#</th>
						<td><%=dto.getNum()%></td>
					</tr>
					<tr>
						<th>Writer</th>
						<td><%=dto.getWriter()%></td>
					</tr>
					<tr>
						<th>Title</th>
						<td><%=dto.getTitle()%></td>
					</tr>
					<tr>
						<th>Content</th>
						<td><textarea cols="130" rows="10" disabled
								class="form-control"><%=dto.getContent()%></textarea></td>
					</tr>
					<tr>
						<th>Reg. Date</th>
						<td><%=dto.getRegDate()%></td>
					</tr>
				</table>
				<a href="board.jsp" class="btn btn-primary">List</a> 
				<%if(id!=null && dto.getWriter() != null && id.equals(dto.getWriter())) { %>
				<a href="board_update_form.jsp?num=<%=dto.getNum()%>" class="btn btn-success">Modify</a> 
				<a href="javascript: deleteCheck(<%=dto.getNum() %>);" class="btn btn-danger">Delete</a>
				<%} %>
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
	<script>
		function deleteCheck(num) {
			var isDelete = confirm("Do you really want to delete this post?");
			if(isDelete) {
				$.ajax({
					url: "board/delete.jsp",
					method: "post",
					data: {"num" : num},
					success: function(response) {
						console.log(response);
						if(response.isDeleteSuccess) {
							alert("Complete to delete this post.");
							location.href = "board.jsp";
						} else {
							alert("Fail to delete this post");
						}
					}
				});
			}
		}
	</script>
</body>

</html>
