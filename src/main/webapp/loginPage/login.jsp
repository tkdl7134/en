<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ログイン</title>
<link rel="stylesheet" type="text/css" href="loginPage/login.css">
<link rel="stylesheet" type="text/css" href="main/main.css">
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

body {
	-webkit-user-select: none; /* Chrome, Safari */
	-moz-user-select: none; /* Firefox */
	-ms-user-select: none; /* Internet Explorer/Edge */
	user-select: none; /* 표준 */
	background-color: #FFF5F4;
}
</style>

</head>
<body class="hs_body">

	<div class="hs_background">

		<div class="yj-main-logo">
			<a href="MainC" class="mainLogo"><img
				src="main/imgFolder/yj-main-logo.png" alt="섹션2 로고" /></a>
		</div>
		
		<jsp:include page="${mainNav }" />

		<div class="horizontal-container-title">
			<h1 class="hs_heading">ログイン</h1>
		</div>

		<form id="loginForm" action="MemberC" method="post">
			<div class="hs_container-login-border">
				<div class="hs_login">
					<div class="hs_login id">ID</div>
					<input type="text" id="m_id" name="m_id" placeholder="縁結びID"
						class="hs_input" maxlength="20">
					<div class="hs_login pw">パスワード</div>
					<input type="password" id="m_pw" name="m_pw" placeholder="パスワード"
						class="hs_input" maxlength="20">
						<button type="button" id="show_pw" class="hs_pwcheck show"></button>
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
	const menus = document.querySelectorAll(".yj-main-menu");

	menus.forEach((menu) => {
		const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");
		const navi = menu.parentElement.querySelector(".yj-main-nav");
		menu.addEventListener("click", function() {
			console.log(menu);
			console.log(navi);
			const menuBtn = menu.querySelector("img");
			if (navi.classList.contains("nav-hidden")) {
				menuBtn.src = "main/imgFolder/yj-main-menu2.png";
				navi.classList.remove("nav-hidden");
				navi.classList.add("nav-show");
			} else {
				menuBtn.src = "main/imgFolder/yj-main-menu1.png";
				navi.classList.remove("nav-show");
				navi.classList.add("nav-hidden");
			}
		});
	});
	
	document.addEventListener('DOMContentLoaded', function() {
	    // ID 필드에 대한 입력 제한
	    document.querySelector('input[name="m_id"]').addEventListener("input", function() {
	        this.value = this.value.replace(/[^a-zA-Z0-9]/g, ''); // 영문자와 숫자만 허용
	    });
	
	 // 비밀번호 입력 필드들
        var passwordField = document.getElementById('m_pw');
        var showPasswordButton = document.getElementById('show_pw');

        // 유효한 문자 정규식 (알파벳 대소문자, 숫자, 특수기호)
        var validChars = /^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]*$/;

        // 입력 필터 함수
        function filterInput(event) {
            var input = event.target.value;
            if (!validChars.test(input)) {
                event.target.value = input.replace(/[^a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/g, '');
            }
        }

        // 입력 필드에 이벤트 리스너 추가
        passwordField.addEventListener('input', filterInput);

        // 비밀번호 표시/숨기기 기능
        showPasswordButton.addEventListener('click', function() {
            var type = passwordField.type === 'password' ? 'text' : 'password';
            passwordField.type = type;
            this.classList.toggle('show', type === 'password');
            this.classList.toggle('hide', type === 'text');
        });
    });
	
	
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

				// 모든 버튼과 입력 필드를 
				$('button, input').prop('disabled', true);

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
							if(${param.reception=='yes'}){
								const receptionForm = document.createElement('form');
								receptionForm.setAttribute('method', 'post');
								receptionForm.setAttribute('action', 'ReceptionC');
							    document.body.appendChild(receptionForm);
								receptionForm.submit();
							}
							else{
							location.href = 'MainC'; // 로그인 성공 후 이동할 페이지
							}
						} else {
							/* alert('IDまたはPWが一致しません。'); //메시지 출력 */
							Swal.fire({
								icon : 'error',
								title : 'IDまたはPWが一致しません。',
								text : '存在しないアカウントか、ID＆PWが一致しません。',
								customClass : {
									confirmButton : 'swal2-confirm'
								}
							});
							$("#m_id").val("");
							$("#m_pw").val("");

							// 모든 버튼과 입력 필드를 다시 활성화
							$('button, input').prop('disabled', false);
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
						// 모든 버튼과 입력 필드를 다시 활성화
						$('button, input').prop('disabled', false);
					}
				});
			});
		});
/* 
		// 세션 스토리지에서 값을 불러오는 함수
		function loadFromSessionStorage() {
			const birthYear = sessionStorage.getItem('birthYear');
			const birthMonth = sessionStorage.getItem('birthMonth');
			const birthDay = sessionStorage.getItem('birthDay');

			if (birthYear) {
				document.getElementById('m_birthY').value = birthYear;
			}
			if (birthMonth) {
				document.getElementById('m_birthM').value = birthMonth;
			}
			if (birthDay) {
				document.getElementById('m_birthD').value = birthDay;
			}
		}

		// 페이지가 로드될 때 값을 불러옴
		window.addEventListener('load', loadFromSessionStorage);
		
		 */
	</script>

</body>
</html>