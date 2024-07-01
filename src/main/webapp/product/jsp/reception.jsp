<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="product/css/reception.css">
<script type="text/javascript" src="product/js/reception.js"></script>
</head>
<body>
	<form action="ReceptionC" method="post">
		<input type="hidden" name="eno" value="${param.eno }">
		<div class="i-container">
			<div class="yj-main-s2-logo">
				<img alt="" src="finance/img/logo.png">
			</div>
			<div class="yj-main-s2-menu">
				<img alt="" src="finance/img/default_menu.png">
			</div>
			<div class="i-left-box">
				<div>
					<h1>続けるため。。。</h1>
				</div>
				<div class="i-btn" onclick="ReceptionLogin()">
					<h2>会員ログイン</h2>
				</div>
				<div style="height: 100px;"></div>
			</div>
			<div class="yj-main-s5-bigCon">
				<div class="yj-main-s5-container">
					<img class="yj-main-s5-invitation"
						src="main/imgFolder/reception-complete.png" alt="noImg" />

				</div>
			</div>
		</div>
	</form>
</body>
</html>