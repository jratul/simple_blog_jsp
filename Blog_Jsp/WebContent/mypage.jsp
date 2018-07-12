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
				<table class="table table-bordered">
					<tr>
						<td>ID</td>
						<td><%=dto.getId() %></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><%=dto.getPwd() %></td>
					</tr>
					<tr>
						<td>Reg. Date</td>
						<td><%=dto.getRegDate() %></td>
					</tr>
				</table>
				<a href="" class="btn btn-success">Modify info</a>
				<a href="javascript:deleteId()" class="btn btn-danger">Delete Account</a>
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
