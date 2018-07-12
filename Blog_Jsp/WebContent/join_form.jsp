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

<title>Simple Blog - Join</title>

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
				<h3>Join us</h3>
				<hr />
				<form action="join.jsp" method="post" id="joinForm">
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>ID</label> <input type="text" class="form-control"
								placeholder="ID" id="id" required
								data-validation-required-message="Please enter your ID correctly." name="id">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Password</label> <input type="password"
								class="form-control" placeholder="Password" id="pwd"
								required
								data-validation-required-message="Please enter your password correctly." name="pwd">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Confirm Password</label> <input type="password"
								class="form-control" placeholder="Confirm Password" id="pwd2"
								required
								data-validation-required-message="Please enter your password correctly.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Email</label> <input type="email"
								class="form-control" placeholder="Email" id="email"
								required
								data-validation-required-message="Please enter your email correctly." name="email">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br />
					<button class="btn btn-primary" type="submit">Join</button>
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
		$("#joinForm").ajaxForm(function(response){
			if(response.isJoinSuccess) {
				alert("Thank you for joining us");
				location.href="index.jsp";
			} else {
				alert("Please check the form");
			}
		});
	</script>
</body>

</html>
