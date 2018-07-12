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

<title>Simple Blog - Login</title>

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
	String savedId = "";
	Cookie[] cooks = request.getCookies();
	if(cooks !=null & cooks.length > 0) {
		for(Cookie tmp:cooks) {
			//쿠키의 이름이 "canPopup" 이라면
			if(tmp.getName().equals("savedId")) {
				//팝업창을 띄우지 않도록 설정
				savedId = tmp.getValue();
			}
		}
	}
	String url = request.getParameter("url");
	if(url == null) {
		url = request.getContextPath() + "/";
	}
%>

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
				<h3>Login</h3>
				<hr />
				<form action="login.jsp" method="post" id="loginForm">
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>ID</label> <input type="text" class="form-control"
								placeholder="ID" id="id" required
								data-validation-required-message="Please enter your ID correctly." name="id"
								value = <%=savedId %>>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="control-group">
						<div class="form-group floating-label-form-group controls">
							<label>Password</label> <input type="password"
								class="form-control" placeholder="Password" id="pwd"
								required
								data-validation-required-message="Please enter your password correctly." name="pwd" >
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br />
					<label>
						<input type="checkbox" name="idSave" value="yes" <%if(savedId.length() > 0) {%> checked="checked" <%} %>/> save ID
					</label>
					<br />
					<button class="btn btn-primary" type="submit">Login</button>
					<a href="join_form.jsp" class="btn btn-success">Join</a>
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
		$("#loginForm").ajaxForm(function(response){
			if(response.isLoginSuccess) {
				location.href="<%=url%>";
			} else {
				alert("Please check ID and password.");	
			}
		});
	</script>
</body>

</html>
