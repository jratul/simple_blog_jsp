<%@page import="com.simple.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
				<h3>Board - Modify</h3>
				<hr />
				<form action="board/update.jsp" method="post" id="boardUpdateForm">
					<input type="hidden" name="num" value="<%=num %>" />
					<input type="hidden" name="writer" value="<%=(String) session.getAttribute("id")%>"/>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Writer</label> <input type="text" class="form-control"
								placeholder="Writer" id="writer" required
								data-validation-required-message="Please enter your ID correctly."
								value="<%=(String) session.getAttribute("id")%>" disabled= "disabled">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Title</label> <input type="text"
								class="form-control" placeholder="Title" id="title" required
								data-validation-required-message="Please enter title correctly."
								name="title" value="<%=dto.getTitle()%>">
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group floating-label-form-group controls">
							<label>Content</label> <textarea
								class="form-control" placeholder="Content" id="content" required
								data-validation-required-message="Please enter content correctly."
								name="content" cols="130" rows="10" ><%=dto.getContent()%></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br />
					<button class="btn btn-success" type="submit">Modify</button>
					<a href="board_detail.jsp?num=<%=dto.getNum() %>" class="btn btn btn-danger">Cancel</a>
				</form>
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
	<script src="js/jquery.form.min.js"></script>
	<script>
		$("#boardUpdateForm").ajaxForm(function(response){
			if(response.isUpdateSuccess) {
				alert("Complete to update this post");
				location.href="board_detail.jsp?num=<%=dto.getNum()%>";
			} else {
				alert("fail to update this post");
			}
		});
	</script>
</body>

</html>
