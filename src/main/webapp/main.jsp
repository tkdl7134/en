<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホームページ</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/index.css">
<style>
body {
	background-color: #333;
	color: white;
}

.navbar-dark .navbar-nav .nav-link {
	color: white;
}

#login-area {
	position: absolute;
	top: 10px;
	right: 100px;
}

#login-area-tbl {
	width: 220px;
	border: none;
	font-size: 13pt;
}

#login-area-tbl td {
	width: 160px;
	text-align: center;
}
</style>
</head>
<body>
<div class="container" style="max-width: 1024px;">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="HC">Hs's place</a>
	<div id="login-area">
		<jsp:include page="${loginPage }"></jsp:include>
	</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="AC">A</a></li>
				<li class="nav-item"><a class="nav-link" href="BC">B</a></li>
				<li class="nav-item"><a class="nav-link" href="CC">C</a></li>
				<li class="nav-item"><a class="nav-link" href="unitC">Unit</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="BMIC">BMI</a></li>
			</ul>
		</div>
	</nav>
	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-md-12 text-center">
				<jsp:include page="${contentPage }"></jsp:include>
			</div>
		</div>
	</div>
	</div>
</body>
</html>