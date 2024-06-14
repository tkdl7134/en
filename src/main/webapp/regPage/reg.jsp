<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="stylesheet" type="text/css" href="regPage/reg.css">

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

	<div class="hs_background-1">


		<div class="horizontal-container-btn">
			<img class="menu-btn-enmusubi" alt=""
				src="regPage/ImgFolder/menu-btn-enmusubi.png"> <img
				class="menu-btn-1" alt="" src="regPage/ImgFolder/menu_btn_1.png">
		</div>

		<div class="hs_title">会員登録</div>

		<form action="MemberRegC" method="post"
			onsubmit="return validatePassword()">

			<div class="hs_container">

				<div class="hs_content-title-account">
					<div class="hs_content-title-text">アカウント情報</div>
				</div>

				<div class="hs_container-input">
					<div class="hs_content-input id">
						<div class="hs_content-text id">ID</div>
						<input type="text" name="m_id" id="m_id" class="hs_input id"
							placeholder="縁結びID">
						<button type="button" onclick="dupleChk()" class="hs_idcheck">チェック</button>
						<!-- <div id="idCheckResult" class="hs_id-available"></div> -->
					</div>

					<div class="hs_content-input pw">
						<div class="hs_content-text pw">パスワード</div>
						<input type="password" name="m_pw" id="m_pw" class="hs_input pw"
							placeholder="パスワード">
					</div>
					<div class="hs_content-input pw-confirm">
						<div class="hs_content-text pwconfirm">パスワード(確認)</div>
						<input type="password" name="m_pw_confirm" id="m_pw_confirm"
							class="hs_input pw" placeholder="パスワード(確認)">
					</div>
				</div>

				<div class="hs_content-title-user">
					<div class="hs_content-title-text">ユーザー情報</div>
				</div>

				<div class="hs_container-input">
					<div class="hs_content-input name">
						<div class="hs_content-text name">名前</div>
						<input type="text" name="m_name" class="hs_input name"
							placeholder="山田 太郎">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text kana">フリガナ</div>
						<input type="text" name="m_name_kana" class="hs_input kana"
							placeholder="ヤマダ タロウ">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text rome">名前(ローマ字)</div>
						<input type="text" name="m_name_rome" class="hs_input rome"
							placeholder="Yamada Tarou">
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
						<input type="number" name="m_birthY" class="hs_input birth"
							maxlength="4" min="1" max="9999">
						<div class="hs_content-text bd">年</div>
						<input type="number" name="m_birthM" class="hs_input birth"
							maxlength="2" min="1" max="12">
						<div class="hs_content-text bd">月</div>
						<input type="number" name="m_birthD" class="hs_input birth"
							maxlength="2" min="1" max="31">
						<div class="hs_content-text bd">日</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text email">メールアドレス</div>
						<input type="email" name="m_email" class="hs_input email"
							placeholder="example@example.com">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text phone">電話番号</div>
						<input type="" name="m_phone" class="hs_input phone"
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
							placeholder="市区町村">
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text street"></div>
						<input type="text" name="a_street" id="a_street"
							class="hs_input street" placeholder="番地">
					</div>

					<div class="hs_content-input building">
						<div class="hs_content-text building"></div>
						<input type="text" name="a_building" id="a_building"
							class="hs_input building" placeholder="ビル・マンション名など">
					</div>

					<button id="btnReg" class="btn-reg" onclick="register()">登録</button>

				</div>
			</div>
		</form>
	</div>

	<script>

	document.addEventListener("DOMContentLoaded", function() {
	  const registerButton = document.getElementById("registerButton");
	  
	  // 入力フィールドに数字のみ許可
	  document.querySelectorAll('input[name="m_phone"]').forEach(input => {
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
	
	function register() {
		// 필수 입력 항목들을 확인
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
	    if (m_id === '') {
	    /* alert("IDを入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : 'IDを入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#m_id").focus();
	    return false;
	}
	if (m_pw === '') {
	    /* alert("パスワードを入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : 'パスワードを入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#m_pw").focus();
	    return false;
	}
	if (m_pw_confirm === '') {
	    /* alert("パスワード(確認)を入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : 'パスワードを入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#m_pw_confirm").focus();
	    return false;
	}
	if (m_name === '') {
	    /* alert("名前を入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '名前を入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("input[name='m_name']").focus();
	    return false;
	}
	if (m_name_kana === '') {
	    /* alert("フリガナを入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : 'フリガナを入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("input[name='m_name_kana']").focus();
	    return false;
	}
	if (m_name_rome === '') {
	    /* alert("名前（ローマ字）を入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '名前(ローマ字)を入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("input[name='m_name_rome']").focus();
	    return false;
	}
	if (!m_gender) {
	    /* alert("性別を選択してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '性別を選択してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("input[name='m_gender']").focus();
	    return false;
	}
	if (m_birthY === '' || m_birthM === '' || m_birthD === '') {
	    /* alert("生年月日をすべて入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '生年月日をすべて入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("input[name='m_birthY']").focus();
	    return false;
	}
	if (m_email === '') {
	    /* alert("メールアドレスを入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : 'メールアドレスを入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("input[name='m_email']").focus();
	    return false;
	}
	if (m_phone === '') {
	    /* alert("電話番号を入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '電話番号を入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("input[name='m_phone']").focus();
	    return false;
	}
	if (a_postcode === '') {
	    /* alert("郵便番号を入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '郵便番号を入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#a_postcode").focus();
	    return false;
	}
	if (a_prefecture === '') {
	    /* alert("都道府県を選択してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '都道府県を選択してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#a_prefecture").focus();
	    return false;
	}
	if (a_city === '') {
	    /* alert("市区町村を入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '市区町村を入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#a_city").focus();
	    return false;
	}
	if (a_street === '') {
	    /* alert("番地を入力してください。"); */
	    Swal.fire({
			icon: 'warning',
			title : '番地を入力してください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#a_street").focus();
	    return false;
	}

	if (!isIdChecked || !isIdAvailable) {
	    /* alert("IDのチェックを行ってください。"); */
	    Swal.fire({
			icon: 'warning',
			title : 'IDのチェックを行ってください。',
			customClass : {
				popup : 'swal2-popup',
				confirmButton : 'swal2-confirm'
			}
		});
	    $("#m_id").focus(); 
	    return false;
	}
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

		function validatePassword() {
			const pw = document.getElementById('m_pw').value;
			const pwConfirm = document.getElementById('m_pw_confirm').value;

			if (pw !== pwConfirm) {
				/* alert("パスワードが一致しません。"); */
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
			return true; // 폼 제출 허용
		}
		
        function dupleChk(){
        	isIdChecked = false; // 중복 확인 플래그 초기화
        	
            let id = $("input[name='m_id']").val().trim();
            console.log(id);
            
            if (!id) { // id가 null이거나 공백일 경우
                /* alert("IDを入力してください。"); */
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
            					icon: 'warning',
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