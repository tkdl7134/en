<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ログイン</title>
<link rel="stylesheet" type="text/css" href="/loginPage/login.css">

</head>
<body class="hs_body">

	<div class="horizontal-container-btn">
		<img class="enmusubi" alt=""
			src="loginPage/ImgFolder/828a704e967fa89b.png"> <img
			class="menu-btn-1" alt="" src="loginPage/ImgFolder/menu_btn_1.png">
	</div>

	<div class="horizontal-container-title">
		<p class="hs_heading">ログイン</p>
		<img class="btn-footer" alt="" src="/loginPage/ImgFolder/footer.png">
	</div>

	<form action="MemberC" method="post" class="hs_form">
		<div class="hs_container-login">
			<p class="hs_login id">ID</p>
			<input type="text" name="m_id" placeholder="ユーザーID" required
				class="hs_input">
			<p class="hs_login pw">パスワード</p>
			<input type="password" name="m_pw" placeholder="パスワード" required
				class="hs_input"><br>
			<button class="hs_btn login">ログイン</button>
		</div>
	</form>
	<a
		href="https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=2005476894&redirect_uri=http://localhost/En/LineLoginC&state=enmusubi123&scope=profile%20openid&nonce=09876xyz"
		class="hs_btn line-login">LINEでログイン</a>
	<br>
	<a href="MemberRegC" class="hs_btn reg">✿会員登録はこちら✿</a>
	<br>
	<img class="yellow_line" alt="" src="./ImgFolder/yellow_line.png">
</body>
</html>