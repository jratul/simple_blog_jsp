<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">Simple Blog</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="post.jsp">Sample
						Post</a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a>
				</li>
				<li style="color: white">|</li>
				<%if((String)session.getAttribute("id") == null) { %>
				<li class="nav-item"><a class="nav-link" href="login_form.jsp">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="join_form.jsp">Join</a></li>
				<%} else { %>
				<li class="nav-item"><a class="nav-link" href="javascript:doLogout()">Logout</a></li>
				<li class="nav-item"><a class="nav-link" href="mypage.jsp">MyPage(<u class="text-warning"><%= (String)session.getAttribute("id")%></u>)</a></li>
				<%} %>
			</ul>
		</div>
	</div>
</nav>
<script>
	function doLogout() {
		alert("See you later!");
		$.ajax({
			url: "logout.jsp",
			success: function() {}
		});
		location.href = "index.jsp";
	}
</script>