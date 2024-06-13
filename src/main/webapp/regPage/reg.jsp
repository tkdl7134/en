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
</head>

<body class="hs_body">

	<div class="hs_background-1">
>

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
								required>
							<button type="button" onclick="dupleChk()" class="hs_idcheck">チェック</button>
							<!-- <div id="idCheckResult" class="hs_id-available"></div> -->
						</div>

						<div class="hs_content-input pw">
							<div class="hs_content-text pw">パスワード</div>
							<input type="password" name="m_pw" id="m_pw" class="hs_input pw"
								required>
						</div>
						<div class="hs_content-input pw-confirm">
							<div class="hs_content-text pwconfirm">パスワード確認</div>
							<input type="password" name="m_pw_confirm" id="m_pw_confirm"
								class="hs_input pw" required>
						</div>
					</div>

					<div class="hs_content-title-user">
						<div class="hs_content-title-text">ユーザー情報</div>
					</div>

					<div class="hs_container-input">
						<div class="hs_content-input-2">
							<div class="hs_content-text">名前</div>
							<input type="text" name="m_name" class="hs_input"
								placeholder="山田 太郎" required>
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">フリガナ</div>
							<input type="text" name="m_name_kana" class="hs_input"
								placeholder="ヤマダ タロウ" required>
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">名前(ローマ字)</div>
							<input type="text" name="m_name_rome" class="hs_input"
								placeholder="Yamada Tarou" required>
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">性別</div>
							<input type="radio" name="m_gender" class="hs_m_gender"
								value="男性"> 男性 <input type="radio" name="m_gender"
								class="hs_m_gender" value="女性"> 女性 <input type="radio"
								name="m_gender" class="hs_m_gender" value="その他"> その他
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">郵便番号</div>
							<input type="text" name="a_postcode" id="a_postcode"
								class="hs_input" placeholder="郵便番号">
						</div>

						<div class="hs_content-input">
							<label for="a_prefecture" class="hs_content-text prefecture">都道府県</label> <select
								id="a_prefecture" name="a_prefecture" class="hs_input">
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
							<div class="hs_content-text city">市区町村</div>
							<input type="text" name="a_city" id="a_city" class="hs_input"
								placeholder="市区町村">
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text street">番地</div>
							<input type="text" name="a_street" id="a_street" class="hs_input"
								placeholder="番地">
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">ビル・マンション名など</div>
							<input type="text" name="a_building" id="a_building"
								class="hs_input" placeholder="ビル・マンション名">
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">メールアドレス</div>
							<input type="email" name="m_email" class="hs_input"
								placeholder="example@example.com" required>
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">電話番号</div>
							<input type="text" name="m_phone" class="hs_input"
								placeholder="012-3456-7890">
						</div>

						<div class="hs_content-input">
							<div class="hs_content-text">生年月日</div>
							<input type="date" name="m_birth" class="hs_input">
						</div>

					</div>
				</div>
				<button>アカウント登録</button>
			</form>
		</div>
	</div>
	<a href="javascript:window.history.back();"><button>取消</button></a>
	<script>
	
	// 아이디 중복 확인 플래그 초기화
    isIdChecked = false; // 중복 확인 플래그 초기화
    isIdAvailable = false; // 사용 가능 플래그 초기화

		function validatePassword() {
			const pw = document.getElementById('m_pw').value;
			const pwConfirm = document.getElementById('m_pw_confirm').value;

			if (pw !== pwConfirm) {
				alert("パスワードが一致しません。");
				return false; // 폼 제출 방지
			}

			return true; // 폼 제출 허용
				
		}
		
        function dupleChk(){
        	isIdChecked = false; // 중복 확인 플래그 초기화
        	

        	
            let id = $("input[name='m_id']").val().trim();
            console.log(id);
            
            if (!id) { // id가 null이거나 공백일 경우
                alert("IDを入力してください。");
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
                        	alert("このIDは使用中です。別のIDを入力してください。"); // alert 창 표시
                            $("#m_id").val(""); 
                            $("#m_id").focus(); 
                        } else {
                            alert("このIDは使用可能です。"); // 사용 가능한 ID일 때 alert 창 표시
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