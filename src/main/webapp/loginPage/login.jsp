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

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

</head>
<body class="hs_body">
	<div class="hs_background">
		<div class="horizontal-container-btn">
			<img class="menu-btn-enmusubi" alt="asd"
				src="loginPage/ImgFolder/menu-btn-enmusubi.png"> <img
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
					<input type="text" id="m_id" name="m_id" placeholder="縁結びID"
						class="hs_input">
					<div class="hs_login pw">パスワード</div>
					<input type="password" id="m_pw" name="m_pw" placeholder="パスワード"
						class="hs_input"><br>
					<button type="submit" class="hs_btn-login" onclick="login()">ログイン</button>
				</div>
			</div>
		</form>

		<div class="hs_btn">
			<a
				href="https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=2005476894&redirect_uri=http://localhost/En/LineLoginC&state=enmusubi123&scope=profile%20openid&nonce=09876xyz"
				class="hs_btn line-login">LINEでログイン</a> <a href="MemberRegC"
				class="hs_btn reg">✿ 会員登録はこちら ✿</a> <img class="yellow_line" alt=""
				src="loginPage/ImgFolder/yellow_line.png">
		</div>
	</div>
	<script>
		function login() {
			var id = document.getElementById('m_id').value;
			var pw = document.getElementById('m_pw').value;

			// 입력값이 비어있는지 확인
			if (id.trim() === '') {
				alert('ID를 입력해주세요.');
				return false;
			}
			if (pw.trim() === '') {
				alert('비밀번호를 입력해주세요.');
				return false;
			}

			// 클라이언트에서 처리하는 방법

			// DB에서 가져온 예시 ID와 비밀번호
			var dbId = 'm_id'; // 실제로는 DB에서 가져오는 값
			var dbPw = 'm_pw'; // 실제로는 DB에서 가져오는 값

			// ID와 비밀번호 비교
			if (id !== dbId) {
				alert('존재하지 않는 회원입니다.');
				return false;
			}
			if (pw !== dbPw) {
				alert('비밀번호가 다릅니다.');
				return false;
			}

			// 로그인 성공 시 다음 동작을 수행하거나 페이지를 이동합니다.
			alert('로그인 성공!');
			// 예를 들어, 로그인 성공 후의 동작을 여기에 추가할 수 있습니다.

			return true; // 로그인 성공
		}
	</script>

</body>
</html>