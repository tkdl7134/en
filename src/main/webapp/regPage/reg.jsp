<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>会員登録</title>

<link rel="stylesheet" type="text/css" href="regPage/reg.css">

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

		<div class="hs_title">会員登録</div>

		<!-- <form action="MemberRegC" method="post"> -->
		<form action="MemberRegC" method="post" enctype="multipart/form-data">

			<div class="hs_container">

				<div class="hs_content-title-account">
					<div class="hs_content-title-text">アカウント情報</div>
				</div>

				<div class="hs_container-input">
					<div class="hs_content-input id">
						<div class="hs_content-text id">ID</div>
						<input type="text" name="m_id" id="m_id" class="hs_input id"
							placeholder="縁結びID" maxlength="20">
						<button type="button" onclick="dupleChk()" class="hs_idcheck">チェック</button>
					</div>

					<div class="hs_content-input pw">
						<div class="hs_content-text pw">パスワード</div>
						<input type="password" name="m_pw" id="m_pw" class="hs_input pw"
							placeholder="パスワード" maxlength="20">
					</div>
					<div class="hs_content-input pw-confirm">
						<div class="hs_content-text pwconfirm">パスワード(確認)</div>
						<input type="password" name="m_pw_confirm" id="m_pw_confirm"
							class="hs_input pw" placeholder="パスワード(確認)" maxlength="20">
					</div>
				</div>

				<div class="hs_content-title-user">
					<div class="hs_content-title-text">ユーザー情報</div>
				</div>

				<div class="hs_container-input">
					<div class="hs_content-input name">
						<div class="hs_content-text name">名前</div>
						<input type="text" name="m_name" class="hs_input name"
							placeholder="山田 太郎" maxlength="20">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text kana">フリガナ</div>
						<input type="text" name="m_name_kana" class="hs_input kana"
							placeholder="ヤマダ タロウ" maxlength="20">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text rome">名前(ローマ字)</div>
						<input type="text" name="m_name_rome" class="hs_input rome"
							placeholder="Yamada Tarou" maxlength="20">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text gender">性別</div>
						<div class="radio-gender">
							<div class="radio-gender male">
								<input type="radio" id="gender_male" name="m_gender"
									class="hs_input gender" value="男性"> <label
									for="gender_male">男性</label>
							</div>
							<div class="radio-gender male">
								<input type="radio" id="gender_female" name="m_gender"
									class="hs_input gender" value="女性"> <label
									for="gender_female">女性</label>
							</div>
							<div class="radio-gender male">
								<input type="radio" id="gender_other" name="m_gender"
									class="hs_input gender" value="その他"> <label
									for="gender_other">その他</label>
							</div>
						</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text birth">生年月日</div>
						<input type="text" name="m_birthY" id="m_birthY"
							class="hs_input birth" maxlength="4">
						<div class="hs_content-text bd">年</div>
						<input type="text" name="m_birthM" id="m_birthM"
							class="hs_input birth" maxlength="2">
						<div class="hs_content-text bd">月</div>
						<input type="text" name="m_birthD" id="m_birthD"
							class="hs_input birth" maxlength="2">
						<div class="hs_content-text bd">日</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text email">メールアドレス</div>
						<input type="email" name="m_email" class="hs_input email"
							placeholder="example@example.com" id="emailInput" maxlength="50">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text phone">電話番号</div>
						<input type="text" name="m_phone" class="hs_input phone"
							placeholder="ハイフン(-)なしでご入力ください" maxlength="15">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text post">郵便番号</div>
						<div class="hs_content-text postmark">〒</div>
						<input type="text" name="a_postcode" id="a_postcode"
							class="hs_input post" placeholder="郵便番号" maxlength="10">
					</div>

					<div class="hs_content-input">
						<label for="a_prefecture" class="hs_content-text prefecture">都道府県</label>
						<select id="a_prefecture" name="a_prefecture"
							class="hs_input prefecture">
							<option value="" disabled selected>選択してください</option>
							<option value="北海道">北海道</option>
							<option value="青森県">青森県</option>
							<option value="岩手県">岩手県</option>
							<option value="宮城県">宮城県</option>
							<option value="秋田県">秋田県</option>
							<option value="山形県">山形県</option>
							<option value="福島県">福島県</option>
							<option value="茨城県">茨城県</option>
							<option value="栃木県">栃木県</option>
							<option value="群馬県">群馬県</option>
							<option value="埼玉県">埼玉県</option>
							<option value="千葉県">千葉県</option>
							<option value="東京都">東京都</option>
							<option value="神奈川県">神奈川県</option>
							<option value="新潟県">新潟県</option>
							<option value="富山県">富山県</option>
							<option value="石川県">石川県</option>
							<option value="福井県">福井県</option>
							<option value="山梨県">山梨県</option>
							<option value="長野県">長野県</option>
							<option value="岐阜県">岐阜県</option>
							<option value="静岡県">静岡県</option>
							<option value="愛知県">愛知県</option>
							<option value="三重県">三重県</option>
							<option value="滋賀県">滋賀県</option>
							<option value="京都府">京都府</option>
							<option value="大阪府">大阪府</option>
							<option value="兵庫県">兵庫県</option>
							<option value="奈良県">奈良県</option>
							<option value="和歌山県">和歌山県</option>
							<option value="鳥取県">鳥取県</option>
							<option value="島根県">島根県</option>
							<option value="岡山県">岡山県</option>
							<option value="広島県">広島県</option>
							<option value="山口県">山口県</option>
							<option value="徳島県">徳島県</option>
							<option value="香川県">香川県</option>
							<option value="愛媛県">愛媛県</option>
							<option value="高知県">高知県</option>
							<option value="福岡県">福岡県</option>
							<option value="佐賀県">佐賀県</option>
							<option value="長崎県">長崎県</option>
							<option value="熊本県">熊本県</option>
							<option value="大分県">大分県</option>
							<option value="宮崎県">宮崎県</option>
							<option value="鹿児島県">鹿児島県</option>
							<option value="沖縄県">沖縄県</option>
							<option value="海外">海外</option>
						</select>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text city">住所</div>
						<input type="text" name="a_city" id="a_city" class="hs_input city"
							placeholder="市区町村" maxlength="50">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text street"></div>
						<input type="text" name="a_street" id="a_street"
							class="hs_input street" placeholder="番地" maxlength="50">
					</div>

					<div class="hs_content-input building">
						<div class="hs_content-text building"></div>
						<input type="text" name="a_building" id="a_building"
							class="hs_input building" placeholder="ビル・マンション名など"
							maxlength="50">
					</div>
					<div class="hs_content-input img">
						<div class="hs_content-text img">プロフィール画像</div>
						<input type="file" name="m_img" id="m_img" class="hs_input img">
					</div>

					<div class="btn-box">
						<button id="btnReg" class="btn-reg" type="button"
							onclick="register()">登録</button>
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
	
	function goBack() {
        window.history.back();
    }
	
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

	  // 入力フィールドに英字とスペースのみ許可
	  document.querySelector('input[name="m_name_rome"]').addEventListener("input", function() {
	    this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // 英字とスペースのみ許可
	  });
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
	        { field: $("input[name='m_name']"), name: '名前' },
	        { field: $("input[name='m_name_kana']"), name: 'フリガナ' },
	        { field: $("input[name='m_name_rome']"), name: '名前(ローマ字)' },
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

	    for (let i = 0; i < requiredFields.length; i++) {
	        if (requiredFields[i].field.val() === null || requiredFields[i].field.val().trim() === '') {
	            Swal.fire({
	                icon: 'warning',
	                title: '入力してない項目があります。',
	                customClass: {
	                    popup: 'swal2-popup',
	                    confirmButton: 'swal2-confirm'
	                }
	            });
	            return false;
	        }
	    }
	    
	 // 아이디 중복 확인이 안 되었을 경우 경고 메시지 표시

		const pw = document.getElementById('m_pw').value;
		const pwConfirm = document.getElementById('m_pw_confirm').value;
		
		const emailInput = document.getElementById('emailInput');
        const emailValue = emailInput.value;

	    if (!isIdChecked || !isIdAvailable) {
	        Swal.fire({
	            icon: 'warning',
	            title: 'IDチェックを行ってください。',
	            customClass: {
	                popup: 'swal2-popup',
	                confirmButton: 'swal2-confirm'
	            }
	        });
	        return false; // 폼 제출 방지
	    }
	    
		if (pw !== pwConfirm) {
			Swal.fire({
				icon: 'warning',
				title : 'パスワードが一致しません。',
				customClass : {
					popup : 'swal2-popup',
					confirmButton : 'swal2-confirm'
				}
			});
			return false; // 폼 제출 방지
		}
		
			if (!(emailValue.includes('@') && emailValue.includes('.')) || emailValue.includes(' ')) {
				Swal.fire({
					icon: 'warning',
					title : 'メールアドレスの形式が正しくありません。',
					customClass : {
						popup : 'swal2-popup',
						confirmButton : 'swal2-confirm'
					}
				});
			return false; // 폼 제출 방지
		}
		
			document.querySelector('form').submit();
	}
	
	function checkForm() {
	    let m_id = $("#m_id").val().trim();
	    let m_pw = $("#m_pw").val().trim();
	    let m_pw_confirm = $("#m_pw_confirm").val().trim();
	    let m_name = $("input[name='m_name']").val().trim();
	    let m_name_kana = $("input[name='m_name_kana']").val().trim();
	    let m_name_rome = $("input[name='m_name_rome']").val().trim();
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
	    if (m_id === '' || m_pw === '' || m_pw_confirm === '' || m_name === '' || m_name_kana === '' || 
	        m_name_rome === '' || !m_gender || m_birthY === '' || m_birthM === '' || m_birthD === '' || 
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
	
	// 아이디 중복 확인 플래그 초기화
    isIdChecked = false; // 중복 확인 플래그 초기화
    isIdAvailable = false; // 사용 가능 플래그 초기화

        function dupleChk(){
        	isIdChecked = false; // 중복 확인 플래그 초기화
        	
            let id = $("input[name='m_id']").val().trim();
            console.log(id);
            
            // 특수문자 확인 정규식
            let specialCharPattern = /[^a-zA-Z0-9]/;
            
            if (!id) {
                Swal.fire({
					icon: 'warning',
					title : 'IDを入力してください。',
					customClass : {
						popup : 'swal2-popup',
						confirmButton : 'swal2-confirm'
					}
				});
                return;
            }
            
            if (specialCharPattern.test(id)) { // id에 특수문자가 포함되어 있는 경우
                Swal.fire({
                    icon: 'warning',
                    title: '使用できない文字が含まれています。',
                    text: '英語と数字のみ入力お願いします。',
                    customClass: {
                        popup: 'swal2-popup',
                        confirmButton: 'swal2-confirm'
                    }
                });
                return;
            }
            
             $.ajax({
                    type: "post",
                    url: "MemberIdCheckC",
                    data: {id},
                    dataType: 'json',
                    success: function (response) {
                        console.log(response);
                        console.log(response.idcheck);
                        $('#idCheckResult').text(response.idcheck);
                        
                   		// 중복 확인 여부 및 사용 가능 여부 플래그 설정
                        isIdChecked = true;
                        isIdAvailable = response.idcheck === "使用可能ID"; // 사용 가능한 경우에만 true로 설정

                        console.log("isIdChecked:", isIdChecked); // 디버깅 로그 추가
                        console.log("isIdAvailable:", isIdAvailable); // 디버깅 로그 추가
                        
                     	// 중복된 아이디인 경우에만 입력 필드 초기화 및 포커스
                        if (!isIdAvailable) {
                        	/* alert("このIDは使用中です。別のIDを入力してください。"); // alert 창 표시 */
                        	Swal.fire({
            					icon: 'warning',
            					title : 'このIDは使用中です。',
            					text : '別のIDを入力してください。',
            					customClass : {
            						popup : 'swal2-popup',
            						confirmButton : 'swal2-confirm'
            					}
            				});
                            $("#m_id").val(""); 
                            $("#m_id").focus(); 
                        } else {
                            /* alert("このIDは使用可能です。"); // 사용 가능한 ID일 때 alert 창 표시 */
                            Swal.fire({
            					icon: 'success',
            					title : 'このIDは使用可能です。',
            					customClass : {
            						popup : 'swal2-popup',
            						confirmButton : 'swal2-confirm'
            					}
            				});
                        }

                        if (response.idcheck === "使用中ID") {
                            $('#idCheckResult').addClass('id-duplicate').removeClass('id-available');
                        } else if (response.idcheck === "使用可能ID") {
                            $('#idCheckResult').addClass('id-available').removeClass('id-duplicate');
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown)
                    }
                 });
            }

	</script>

</body>
</html>