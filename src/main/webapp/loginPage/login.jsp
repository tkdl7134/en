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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
.swal2-popup {
	background-color: #FFF5F4 !important; /* 배경색 설정 */
}

.swal2-confirm {
	background-color: #FF4C50 !important; /* 원하는 색상 코드로 변경 */
	color: white !important; /* 텍스트 색상 */
}
</style>

</head>
<body class="hs_body">

	<div class="hs_background">
	
		<div class="yj-main-s2-logo">
			<img class="yj-main-s2-logo img" alt=""
				src="loginPage/ImgFolder/Logo.png">
		</div>
		<div class="yj-main-s2-menu">
			<img class="yj-main-s2-menu img" alt=""
				src="loginPage/ImgFolder/default_menu_1.png">
		</div>


		<div class="horizontal-container-title">
			<p class="hs_heading">ログイン</p>
		</div>

		<form id="loginForm" action="MemberC" method="post">
			<div class="hs_container-login-border">
				<div class="hs_login">
					<div class="hs_login id">ID</div>
					<input type="text" id="m_id" name="m_id" placeholder="縁結びID"
						class="hs_input">
					<div class="hs_login pw">パスワード</div>
					<input type="password" id="m_pw" name="m_pw" placeholder="パスワード"
						class="hs_input"><br>
					<button type="submit" class="hs_btn-login">ログイン</button>
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
		$(document).ready(function() {
			$('#loginForm').submit(function(event) {
				event.preventDefault(); // 기본 폼 제출 방지

				var id = $('#m_id').val();
				var pw = $('#m_pw').val();

				// 입력값 유효성 검사
				if (id.trim() === '') {
					Swal.fire({
						icon : 'warning',
						title : 'IDを入力してください。',
						/*  text: 'IDを入力してください。', */
						customClass : {
							popup : 'swal2-popup',
							confirmButton : 'swal2-confirm'
						}
					});
					return;
				}
				if (pw.trim() === '') {
					Swal.fire({
						icon : 'warning',
						title : 'パスワードを入力してください。',
						/*  text: 'パスワードを入力してください。', */
						customClass : {
							confirmButton : 'swal2-confirm'
						}
					});
					return;
				}

				// 서버로 로그인 요청
				$.ajax({
					type : 'POST',
					url : 'MemberC',
					data : {
						'm_id' : id,
						'm_pw' : pw
					},
					success : function(response) {
						if (response.trim() === 'success') {
							// 로그인 성공 후 필요한 작업 수행 (예: 페이지 리다이렉트)
							window.location.href = 'HSC'; // 로그인 성공 후 이동할 페이지
						} else {
							/* alert('IDまたはPWが一致しません。'); //메시지 출력 */
							Swal.fire({
								icon : 'warning',
								title : 'IDまたはPWが一致しません。',
								text : '存在しないアカウントか、ID＆PWが一致しません。',
								customClass : {
									confirmButton : 'swal2-confirm'
								}
							});
							$("#m_id").val("");
							$("#m_pw").val("");
						}
					},
					error : function() {
						/* alert('サーバーエラーが発生しました。'); */
						Swal.fire({
							icon : 'error',
							title : 'サーバーエラーが発生しました。',
							/*  text: 'サーバーエラーが発生しました。', */
							customClass : {
								confirmButton : 'swal2-confirm'
							}
						});
					}
				});
			});
		});
	</script>

</body>
</html>