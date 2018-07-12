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
	<%
		List<BoardDto> list = BoardDao.getInstance().getList();
	%>

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
				<a class="btn btn-success" href="board_insert_form.jsp">Write</a> 
				<br /><br />
				<table class="table table-striped">
					<thead>
						<tr>
							<th style="width: 10%">#</th>
							<th style="width: 50%">Title</th>
							<th style="width: 10%">Writer</th>
							<th style="width: 30%">Reg. Date</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (BoardDto tmp : list) {
						%>
						<tr>
							<td><%=tmp.getNum()%></td>
							<td><a href="board_detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle()%></a></td>
							<td><%=tmp.getWriter()%></td>
							<td><%=tmp.getRegDate()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
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
</body>

</html>
