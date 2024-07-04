<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>会員情報修正</title>

<script src="https://yubinbango.github.io/yubinbango/yubinbango.js"
	charset="UTF-8"></script>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="myPage/update.css">
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
}

.yj-main-logo {
	z-index: 4;
	width: 130px;
	height: 130px;
	position: fixed;
	top: 4rem;
	left: 5rem;
}

.yj-main-menubox {
	position: fixed;
	top: 6rem;
	right: 5rem;
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 175px;
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

		<h1 class="hs_title">会員情報修正</h1>

		<div class="hs_mypage-menus">
			<div class="hs_btn-container">
				<a href="MemberDetailC" class="hs_btn me">✿ 会員情報 ✿</a> <img
					class="yellow_line" alt=""
					src="loginPage/ImgFolder/yellow_line.png">
			</div>
			<div class="hs_btn-container">
				<a href="mytemplateController" class="hs_btn ">✿ テンプレート管理 ✿</a> <img
					class="yellow_line" alt=""
					src="loginPage/ImgFolder/yellow_line.png">
			</div>

			<div class="hs_btn-container">
				<a href="MyMeetingC" class="hs_btn ">✿ 会リスト ✿</a> <img
					class="yellow_line" alt=""
					src="loginPage/ImgFolder/yellow_line.png">
			</div>
		</div>

		<form action="MemberUpdateC" method="post"
			enctype="multipart/form-data" id="MemberUpdateC">

			<div class="hs_container">

				<div class="hs_content-title-account">
					<div class="hs_content-title-text">アカウント情報</div>
				</div>

				<div class="hs_container-input id">
					<div class="hs_content-input id">
						<div class="hs_content-text id">ID</div>
						<input type="hidden" name="m_id" id="m_id" class="hs_input id"
							placeholder="縁結びID" value="${sessionScope.m_id}">
						<div class="hs_update-id" id="display_id">${sessionScope.m_id}</div>
					</div>

					<div class="hs_content-input pw">
						<div class="hs_content-text pw">パスワード</div>
						<input type="password" name="m_pw" id="m_pw" class="hs_input pw"
							placeholder="パスワード" maxlength="20" minlength="6">
						<button type="button" id="show_pw" class="hs_pwcheck show"></button>
					</div>
					<div class="annai">*半角英数字記号6~12桁</div>
					
					<div class="hs_content-input pw-confirm">
						<div class="hs_content-text pwconfirm">パスワード(確認)</div>
						<input type="password" name="m_pw_confirm" id="m_pw_confirm"
							class="hs_input pw" placeholder="パスワード(確認)" maxlength="20" minlength="6">
					</div>
				</div>

				<div class="hs_content-title-user">
					<div class="hs_content-title-text">ユーザー情報</div>
				</div>

				<div class="hs_container-input">
					<div class="hs_content-input name">
						<div class="hs_content-text name">名前</div>
						<input type="text" name="m_name_sei" class="hs_input name_sei"
							placeholder="姓" maxlength="10" value="${i.m_name1}"> <input
							type="text" name="m_name_mei" class="hs_input name_mei"
							placeholder="名" maxlength="10" value="${i.m_name2}">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text kana">フリガナ</div>
						<input type="text" name="m_name_kana_sei"
							class="hs_input kana_sei" placeholder="セイ" maxlength="10"
							value="${i.m_name_kana1}"> <input type="text"
							name="m_name_kana_mei" class="hs_input kana_mei" placeholder="メイ"
							maxlength="10" value="${i.m_name_kana2}">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text rome">名前(ローマ字)</div>
						<input type="text" name="m_name_rome_mei"
							class="hs_input rome_mei" placeholder="First name" maxlength="10"
							value="${i.m_name_rome1}"> <input type="text"
							name="m_name_rome_sei" class="hs_input rome_sei"
							placeholder="Last name" maxlength="10" value="${i.m_name_rome2}">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text gender">性別</div>
						<div class="radio-gender">
							<div class="radio-gender male">
								<input type="radio" id="gender_male" name="m_gender"
									class="hs_input gender" value="男性"
									<c:if test="${i.m_gender eq '男性'}">checked</c:if>> <label
									for="gender_male">男性</label>
							</div>
							<div class="radio-gender male">
								<input type="radio" id="gender_female" name="m_gender"
									class="hs_input gender" value="女性"
									<c:if test="${i.m_gender eq '女性'}">checked</c:if>> <label
									for="gender_female">女性</label>
							</div>
							<div class="radio-gender male">
								<input type="radio" id="gender_other" name="m_gender"
									class="hs_input gender" value="その他"
									<c:if test="${i.m_gender eq 'その他'}">checked</c:if>> <label
									for="gender_other">その他</label>
							</div>
						</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text birth">生年月日</div>
						<input type="text" name="m_birthY" id="m_birthY"
							class="hs_input birth" maxlength="4" value="${i.m_birth_year}">
						<div class="hs_content-text bd">年</div>
						<input type="text" name="m_birthM" id="m_birthM"
							class="hs_input birth" maxlength="2" value="${i.m_birth_month}">
						<div class="hs_content-text bd">月</div>
						<input type="text" name="m_birthD" id="m_birthD"
							class="hs_input birth" maxlength="2" value="${i.m_birth_day}">
						<div class="hs_content-text bd">日</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text email">メールアドレス</div>
						<input type="email" name="m_email" class="hs_input email"
							placeholder="example@example.com" id="emailInput" maxlength="50"
							value="${i.m_email}">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text phone">電話番号</div>
						<input type="text" name="m_phone" class="hs_input phone"
							placeholder="ハイフン(-)なしでご入力ください" maxlength="15"
							value="${i.m_phone}">
					</div>

					<div class="h-adr">
						<span class="p-country-name" style="display: none;">Japan</span>

						<div class="hs_content-input">
							<div class="hs_content-text post">郵便番号</div>
							<div class="hs_content-text postmark">〒</div>
							<input type="text" name="a_postcode" id="a_postcode"
								class="hs_input post p-postal-code" placeholder="郵便番号"
								maxlength="8" value="${i.a_postcode}">
						</div>

						<div class="hs_content-input">
							<input type="hidden" value="${i.a_address[0]}" id="adnum">
							<label for="a_prefecture" class="hs_content-text prefecture">都道府県</label>
							<select id="a_prefecture" name="a_prefecture"
								class="hs_input prefecture p-region-id">
								<option value="" disabled selected>選択してください</option>
								<option value="1">北海道</option>
								<option value="2">青森県</option>
								<option value="3">岩手県</option>
								<option value="4">宮城県</option>
								<option value="5">秋田県</option>
								<option value="6">山形県</option>
								<option value="7">福島県</option>
								<option value="8">茨城県</option>
								<option value="9">栃木県</option>
								<option value="10">群馬県</option>
								<option value="11">埼玉県</option>
								<option value="12">千葉県</option>
								<option value="13">東京都</option>
								<option value="14">神奈川県</option>
								<option value="15">新潟県</option>
								<option value="16">富山県</option>
								<option value="17">石川県</option>
								<option value="18">福井県</option>
								<option value="19">山梨県</option>
								<option value="20">長野県</option>
								<option value="21">岐阜県</option>
								<option value="22">静岡県</option>
								<option value="23">愛知県</option>
								<option value="24">三重県</option>
								<option value="25">滋賀県</option>
								<option value="26">京都府</option>
								<option value="27">大阪府</option>
								<option value="28">兵庫県</option>
								<option value="29">奈良県</option>
								<option value="30">和歌山県</option>
								<option value="31">鳥取県</option>
								<option value="32">島根県</option>
								<option value="33">岡山県</option>
								<option value="34">広島県</option>
								<option value="35">山口県</option>
								<option value="36">徳島県</option>
								<option value="37">香川県</option>
								<option value="38">愛媛県</option>
								<option value="39">高知県</option>
								<option value="40">福岡県</option>
								<option value="41">佐賀県</option>
								<option value="42">長崎県</option>
								<option value="43">熊本県</option>
								<option value="44">大分県</option>
								<option value="45">宮崎県</option>
								<option value="46">鹿児島県</option>
								<option value="47">沖縄県</option>
								<option value="48">海外</option>
							</select>
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text city">住所</div>
							<input type="text" name="a_city" id="a_city"
								class="hs_input city p-locality p-street-address p-extended-address"
								placeholder="市区町村" maxlength="50" value="${i.a_address[1]}">
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text street"></div>
							<input type="text" name="a_street" id="a_street"
								class="hs_input street" placeholder="番地" maxlength="50"
								value="${i.a_address[2]}">
						</div>

						<div class="hs_content-input building">
							<div class="hs_content-text building"></div>
							<input type="text" name="a_building" id="a_building"
								class="hs_input building" placeholder="建物名 ・ 部屋番号"
								maxlength="50"
								value="${i.a_address[3] != null ? i.a_address[3] : ''}">
						</div>
					</div>

					<%-- <div class="hs_content-input img">
						<div class="hs_content-text img">プロフィール画像</div>
						<input type="file" name="newImg" id="m_img" class="hs_input img" value="${m_img}">
						<input type="hidden" name="oldImg">
					</div> --%>
					<div class="btn-box">
						<button id="btnReg" class="btn-reg" type="button"
							onclick="register()">修正</button>
						<button id="btnReg" class="btn-back" type="button"
							onclick="goBack()">取消</button>
					</div>

				</div>
			</div>
			<div class="hs_footer">
				<img alt="" src="regPage/ImgFolder/top_button.png"
					class="top-button">
				<div class="hs_footer-background"></div>
			</div>
		</form>
	</div>

	<script>
	
	document.addEventListener('DOMContentLoaded', function() {
	    let options = document.querySelectorAll("#a_prefecture option");
	    let select = document.getElementById("a_prefecture");
	    let val = document.getElementById("adnum").value;
	    console.log(val);
		select.value = val;
	});
	
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
	
	function goBack() {
        window.history.back();
    }
	
	document.addEventListener("DOMContentLoaded", function() {
        var sessionId = "${sessionScope.m_id}";
        if (sessionId.startsWith("LINE_")) {
            sessionId = "LINE_USER";
        }
        document.getElementById("display_id").textContent = sessionId;
    });
	
	document.addEventListener("DOMContentLoaded", function() {
	    const topButton = document.querySelector('.top-button');
	    
	    topButton.addEventListener('click', function() {
	        window.scrollTo({
	            top: 0,
	            behavior: 'smooth' // 부드러운 스크롤
	        });
	    });
	});

	document.addEventListener("DOMContentLoaded", function() {
	  const registerButton = document.getElementById("btnReg");
	  
	// ID 필드에 대한 입력 제한
	    document.querySelector('input[name="m_id"]').addEventListener("input", function() {
	        this.value = this.value.replace(/[^a-zA-Z0-9]/g, ''); // 영문자와 숫자만 허용
	    });
	  
	  // 入力フィールドに数字のみ許可
	  document.querySelectorAll('input[name="m_phone"], input[name="m_birthY"], input[name="m_birthM"], input[name="m_birthYD"]').forEach(input => {
	    input.addEventListener("input", function() {
	      this.value = this.value.replace(/[^0-9]/g, ''); // 数字のみ許可
	    });
	  });
	  
	  // 入力フィールドに数字と(-)許可
	  document.querySelectorAll('input[name="a_postcode"]').forEach(input => {
	    input.addEventListener("input", function() {
	      this.value = this.value.replace(/[^0-9-]/g, '');
	    });
	  });

	// 入力フィールドに英字のみ許可
	  document.querySelector('input[name="m_name_rome_mei"]').addEventListener("input", function() {
		    this.value = this.value.replace(/[^a-zA-Z]/g, ''); // 英字のみ許可
		  });
		  
		  document.querySelector('input[name="m_name_rome_sei"]').addEventListener("input", function() {
		    this.value = this.value.replace(/[^a-zA-Z]/g, ''); // 英字のみ許可
		  });
		});
	
	// 비밀번호 입력 필드들
    var passwordField = document.getElementById('m_pw');
    var confirmPasswordField = document.getElementById('m_pw_confirm');
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
    confirmPasswordField.addEventListener('input', filterInput);

    // 비밀번호 표시/숨기기 기능
    showPasswordButton.addEventListener('click', function() {
            var type = passwordField.type === 'password' ? 'text' : 'password';
            passwordField.type = type;
            confirmPasswordField.type = type;
            this.classList.toggle('show', type === 'password');
            this.classList.toggle('hide', type === 'text');
        });
	
	// 入力フィールドに空白除外
	document.addEventListener('DOMContentLoaded', (event) => {
        const m_name_sei = document.querySelector('input[name="m_name_sei"]');
        const m_name_mei = document.querySelector('input[name="m_name_mei"]');
        const m_name_kana_sei = document.querySelector('input[name="m_name_kana_sei"]');
        const m_name_kana_mei = document.querySelector('input[name="m_name_kana_mei"]');
        const m_email = document.querySelector('input[name="m_email"]');
        const m_pw = document.querySelector('input[name="m_pw"]');
        const m_pw_confirm = document.querySelector('input[name="m_pw_confirm"]');

        const removeWhitespace = (e) => {
            e.target.value = e.target.value.replace(/\s/g, '');
        };

        m_name_sei.addEventListener('input', removeWhitespace);
        m_name_mei.addEventListener('input', removeWhitespace);
        m_name_kana_sei.addEventListener('input', removeWhitespace);
        m_name_kana_mei.addEventListener('input', removeWhitespace);
        m_email.addEventListener('input', removeWhitespace);
        m_pw.addEventListener('input', removeWhitespace);
        m_pw_confirm.addEventListener('input', removeWhitespace);
    });
	
	// input 요소를 선택합니다.
	const inputElementd = document.querySelector('input[name="m_birthD"]');

	// input 요소에 input 이벤트 리스너를 추가합니다.
	inputElementd.addEventListener('input', function() {
	    // 현재 입력된 값(value)을 가져옵니다.
	    let value = this.value;

	    // 입력된 값이 숫자인지 체크합니다.
	    if (/^\d*$/.test(value)) {
	        // 숫자이면, 입력된 값을 정수로 변환합니다.
	        let num = parseInt(value, 10);

	        // 입력된 값이 1에서 31 사이의 범위에 있는지 확인합니다.
	        if (num < 1 || num > 31) {
	            // 범위를 벗어나면 입력값을 잘라냅니다.
	            this.value = value.slice(0, value.length - 1);
	        }
	    } else {
	        // 숫자가 아닌 경우, 입력값을 잘라냅니다.
	        this.value = value.slice(0, value.length - 1);
	    }
	});
	// input 요소를 선택합니다.
	const inputElementm = document.querySelector('input[name="m_birthM"]');

	// input 요소에 input 이벤트 리스너를 추가합니다.
	inputElementm.addEventListener('input', function() {
	    // 현재 입력된 값(value)을 가져옵니다.
	    let value = this.value;

	    // 입력된 값이 숫자인지 체크합니다.
	    if (/^\d*$/.test(value)) {
	        // 숫자이면, 입력된 값을 정수로 변환합니다.
	        let num = parseInt(value, 10);

	        // 입력된 값이 1에서 31 사이의 범위에 있는지 확인합니다.
	        if (num < 1 || num > 12) {
	            // 범위를 벗어나면 입력값을 잘라냅니다.
	            this.value = value.slice(0, value.length - 1);
	        }
	    } else {
	        // 숫자가 아닌 경우, 입력값을 잘라냅니다.
	        this.value = value.slice(0, value.length - 1);
	    }
	});
	
	function register() {
		
		// 필수 입력 항목들을 확인
	    let requiredFields = [
	        { field: $("#m_pw"), name: 'パスワード' },
	        { field: $("#m_pw_confirm"), name: 'パスワード(確認)' },
	        { field: $("input[name='m_name_sei']"), name: '名前' },
	        { field: $("input[name='m_name_mei']"), name: '名前' },
	        { field: $("input[name='m_name_kana_sei']"), name: 'フリガナ' },
	        { field: $("input[name='m_name_kana_mei']"), name: 'フリガナ' },
	        { field: $("input[name='m_name_rome_mei']"), name: '名前(ローマ字)' },
	        { field: $("input[name='m_name_rome_sei']"), name: '名前(ローマ字)' },
	        { field: $("input[name='m_gender']:checked"), name: '性別' },
	        { field: $("input[name='m_birthY']"), name: '生年月日' },
	        { field: $("input[name='m_birthM']"), name: '生年月日' },
	        { field: $("input[name='m_birthD']"), name: '生年月日' },
	        { field: $("input[name='m_email']"), name: 'メールアドレス' },
	        { field: $("input[name='m_phone']"), name: '電話番号' },
	        { field: $("#a_postcode"), name: '郵便番号' },
	        { field: $("#a_prefecture"), name: '都道府県' },
	        { field: $("#a_city"), name: '市区町村' },
	        { field: $("#a_street"), name: '番地' }
	    ];

	 // 패스워드 최소 길이 설정
	    let passwordMinLength = $('#m_pw').attr('minlength') || 8; // 기본적으로 8자리로 설정

	    // 필수 입력 항목 확인
	    for (let i = 0; i < requiredFields.length; i++) {
	        if (requiredFields[i].field.val() === null || requiredFields[i].field.val().trim() === '') {
	            let emptyField = requiredFields[i].field[0];
	            Swal.fire({
	                icon: 'warning',
	                title: '入力してない項目があります。',
	                customClass: {
	                    popup: 'swal2-popup',
	                    confirmButton: 'swal2-confirm'
	                },
	                didClose: () => {
	                    emptyField.focus();
	                    emptyField.scrollIntoView({ behavior: 'smooth', block: 'center' });
	                }
	            });
	            return false;
	        }
	    }

	    // 패스워드 유효성 검사
	    let pw = $("#m_pw").val().trim();
	    let pwConfirm = $("#m_pw_confirm").val().trim();

	    if (pw.length < passwordMinLength) {
	        Swal.fire({
	            icon: 'warning',
	            title: 'パスワードは最低' + passwordMinLength + '桁以上ご入力ください。',
	            customClass: {
	                popup: 'swal2-popup',
	                confirmButton: 'swal2-confirm'
	            }
	        });
	        return false;
	    }

	    if (pw !== pwConfirm) {
	        Swal.fire({
	            icon: 'warning',
	            title: 'パスワードが一致しません。',
	            customClass: {
	                popup: 'swal2-popup',
	                confirmButton: 'swal2-confirm'
	            }
	        });
	        return false;
	    }

	    // 이메일 유효성 검사
	    let emailInput = document.getElementById('emailInput');
	    let emailValue = emailInput.value;

	    if (!(emailValue.includes('@') && emailValue.includes('.')) || emailValue.includes(' ')) {
	        Swal.fire({
	            icon: 'warning',
	            title: 'メールアドレスの形式が正しくありません。',
	            customClass: {
	                popup: 'swal2-popup',
	                confirmButton: 'swal2-confirm'
	            }
	        });
	        return false;
	    }

	    // 모든 유효성 검사 통과 후 폼 제출
	    document.querySelector('#MemberUpdateC').submit();

	    return true;
	}
		
	function checkForm() {
	    let m_pw = $("#m_pw").val().trim();
	    let m_pw_confirm = $("#m_pw_confirm").val().trim();
	    let m_name_sei = $("input[name='m_name_sei']").val().trim();
	    let m_name_mei = $("input[name='m_name_mei']").val().trim();
	    let m_name_kana_sei = $("input[name='m_name_kana_sei']").val().trim();
	    let m_name_kana_mei = $("input[name='m_name_kana_mei']").val().trim();
	    let m_name_rome_mei = $("input[name='m_name_rome_mei']").val().trim();
	    let m_name_rome_sei = $("input[name='m_name_rome_sei']").val().trim();
	    let m_gender = $("input[name='m_gender']:checked").val();
	    let m_birthY = $("input[name='m_birthY']").val().trim();
	    let m_birthM = $("input[name='m_birthM']").val().trim();
	    let m_birthD = $("input[name='m_birthD']").val().trim();
	    let m_email = $("input[name='m_email']").val().trim();
	    let m_phone = $("input[name='m_phone']").val().trim();
	    let a_postcode = $("#a_postcode").val().trim();
	    let a_prefecture = $("#a_prefecture").val();
	    let a_city = $("#a_city").val().trim();
	    let a_street = $("#a_street").val().trim();

	    // 필수 입력란 체크
	     if (m_id === '' || m_pw === '' || m_pw_confirm === '' || m_name_sei === '' || m_name_mei === '' || m_name_kana_sei === '' || 
	    	m_name_kana_mei === '' || m_name_rome_mei === '' ||  m_name_rome_sei === '' ||!m_gender || m_birthY === '' || m_birthM === '' || m_birthD === '' || 
	        m_email === '' || m_phone === '' || a_postcode === '' || a_prefecture === '' || a_city === '' || 
	        a_street === '') {
	        // 하나라도 비어 있는 경우
	        $("#btnReg").removeClass("btn-reg-complete");
	    } else {
	        // 모든 필수 항목이 입력된 경우
	        $("#btnReg").addClass("btn-reg-complete");
	    }
	}

	// 입력란이 변경될 때마다 확인
	$("input, select").on("change keyup", checkForm);
	
	</script>
</body>
</html>