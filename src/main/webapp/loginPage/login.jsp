<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ログイン</title>
<link rel="stylesheet" type="text/css" href="loginPage/login.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
	rel="stylesheet">

</head>
<body class="hs_body">
	<div class="hs_background">
		<div class="horizontal-container-btn">
			<img class="menu-btn-enmusubi" alt="asd"
				src="loginPage/ImgFolder/828a704e967fa89b.png"> <img
				class="menu-btn-1" alt="asd"
				src="loginPage/ImgFolder/menu_btn_1.png">
		</div>

		<div class="horizontal-container-title">
			<p class="hs_heading">ログイン</p>
		</div>

		<form action="MemberC" method="post">
			<div class="hs_container-login-border">
				<div class="hs_login">
					<div class="hs_login id">ID</div>
					<input type="text" name="m_id" placeholder="   ユーザーID" required
						class="hs_input">
					<div class="hs_login pw">パスワード</div>
					<input type="password" name="m_pw" placeholder="   パスワード" required
						class="hs_input"><br>
					<button class="hs_btn-login">ログイン</button>
				</div>
			</div>
		</form>

		<div class="hs_btn">
			<a
				href="https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=2005476894&redirect_uri=http://localhost/En/LineLoginC&state=enmusubi123&scope=profile%20openid&nonce=09876xyz"
				class="hs_btn line-login">LINEでログイン</a>
				<a href="MemberRegC"
				class="hs_btn reg">✿ 会員登録はこちら ✿</a>
				<img class="yellow_line" alt=""
				src="loginPage/ImgFolder/yellow_line.png">
		</div>
	</div>
</body>
</html>