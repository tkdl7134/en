<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>アカウント登録</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style type="text/css">
.id-duplicate { color: red; } /* 중복 ID */
.id-available { color: blue; }  /* 사용 가능 ID */
</style>
</head>
<body>
	<h2>アカウント登録</h2>

<form action="MemberRegC" method="post" onsubmit="return validatePassword()">
        ユーザーID<input type="text" name="m_id" id="m_id" placeholder="ユーザーID" required>
        <button type="button" onclick="dupleChk()">IDチェック</button>
        <div id="idCheckResult" class="id-available"></div> <br> 
    
        パスワード<input type="password" name="m_pw" id="m_pw" placeholder="パスワード" required><br><br>
        パスワード確認<input type="password" name="m_pw_confirm" id="m_pw_confirm" placeholder="パスワード確認" required><br><br>
        名前<input type="text" name="m_name" placeholder="山田 太郎" required><br><br>
        フリガナ<input type="text" name="m_name_kana" placeholder="ヤマダ タロウ" required><br><br>
        名前(英語)<input type="text" name="m_name_rome" placeholder="Yamada Tarou" required><br><br>
        性別<input type="radio" name="m_gender" value="male" checked> 男性
        <input type="radio" name="m_gender" value="female"> 女性
        <input type="radio" name="m_gender" value="other"> その他
        <br><br>
        郵便番号<input type="text" name="a_postcode" placeholder="郵便番号" required><br><br>
       <label for="a_prefecture">都道府県</label>
                <select id="a_prefecture" name="a_prefecture" required>
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
                </select> <br><br>
      市区町村<br><input type="text" name="a_city" placeholder="市区町村" required><br><br>
        番地 <br><input type="text" name="a_street" placeholder="番地" required><br><br>
        ビル・マンション名など <br><input type="text" name="a_building" placeholder="ビル・マンション名" required><br><br>
        メールアドレス<input type="email" name="m_email" placeholder="example@example.com" required><br><br>
        電話番号<input type="text" name="m_phone" placeholder="012-3456-7890" required><br><br>
        生年月日<input type="date" name="m_birth" required> <br><br>
        <button>アカウント登録</button>
    </form>
<a href="javascript:window.history.back();"><button>取消</button></a>
	<script>
	
	let isIdAvailable = false; // 아이디 사용 가능 여부 플래그

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
        	
            let id = $("input[name='m_id']").val();
            console.log(id);
             $.ajax({
                    type: "post",
                    url: "MemberIdCheckC",
                    data: {id},
                    dataType: 'json',
                    success: function (response) {
                        console.log(response);
                        console.log(response.idcheck);
                        $('#idCheckResult').text(response.idcheck);

                        // 중복된 아이디인 경우 
                        if (!isIdAvailable) {
                            $("#m_id").val(""); // 아이디 입력 필드 초기화
                            $("#m_id").focus(); // 아이디 입력 필드에 포커스
                        }

                        if (response.idcheck === "使用中IDです。") {
                            $('#idCheckResult').addClass('id-duplicate').removeClass('id-available');
                        } else if (response.idcheck === "使用可能IDです。") {
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