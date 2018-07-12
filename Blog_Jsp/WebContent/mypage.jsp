<%@page import="com.simple.users.dao.UsersDao"%>
<%@page import="com.simple.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String id = (String) session.getAttribute("id");
	
	UsersDto dto = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Blog - MyPage <%if(id!=null) {%>- <%=id %><%} %></title>

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
	<%@include file="nav.jsp" %>

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('img/home-bg.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">
						<h1>Simple Blog</h1>
						<span class="subheading">Write your HISTORY</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<h3>My Page<%if(id!=null) { %> - <%=id %><%} %></h3>
				<hr />
				<form action="users/update.jsp" method="post" id="updateForm">
					<input type="hidden" name="id" value="<%=dto.getId() %>" />
					<input type="hidden" name="regDate" value="<%=dto.getRegDate() %>" />
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>ID</label> <input type="text" class="form-control"
								placeholder="ID" id="id" required
								data-validation-required-message="Please enter your ID correctly."
								value = <%=dto.getId() %> disabled="disabled">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Password</label> <input type="password"
								class="form-control" placeholder="Password" id="pwd"
								required
								data-validation-required-message="Please enter your password correctly." name="pwd" 
								value = <%=dto.getPwd() %>>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Confirm Password</label> <input type="password"
								class="form-control" placeholder="Confirm Password" id="pwd2"
								required
								data-validation-required-message="Please enter your password correctly."
								value = <%=dto.getPwd() %>>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Email</label> <input type="email"
								class="form-control" placeholder="Email" id="email"
								required
								data-validation-required-message="Please enter your email correctly." name="email"
								value = <%=dto.getEmail() %>>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Reg. Date</label> <input type="text"
								class="form-control" placeholder="Reg. Date" id="regDate"
								required
								data-validation-required-message="Please enter your email correctly." disabled = "disabled"
								value = <%=dto.getRegDate() %>>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br />
					<button class="btn btn-success" type="submit">Modify Info</button>
					<a href="javascript:deleteId()" class="btn btn-danger">Delete Account</a>
				</form>
			</div>
		</div>
	</div>

	<hr>

	<!-- Footer -->
	<%@include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/clean-blog.min.js"></script>
	<script src="js/jquery.form.min.js"></script>
	<script>
		$("#updateForm").ajaxForm(function(response){
			if(response.isUpdateSuccess) {
				alert("Complete to update info");
			} else {
				alert("Fail to update info");
			}
			location.reload();
		});
	
		function deleteId() {
			var willDelete = confirm("Do you really want to delete your account?");
			if(willDelete) {
				$.ajax({
					url: "users/delete.jsp",
					success: function(response) {
						if(response.isDeleteSuccess) {
							alert("Complete to delete your account");
							location.href = "index.jsp";
						} else {
							alert("Fail to delete your account");
						}
					}
				});
			}
		}
	</script>
</body>

</html>
