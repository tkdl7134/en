<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
	<h2>회원가입</h2>

    <c:if test="${not empty error}">
        <p style="color: red;">${error}</p>
    </c:if>

    <c:if test="${not empty idCheckResult}">
        <p style="color: ${idCheckResult eq 'available' ? 'green' : 'red'};">${idCheckResult}</p>
    </c:if>

    <form action="MemberIdCheckC" method="post">
        아이디<input type="text" name="m_id" id="m_id" placeholder="아이디" required>
        <button type="button" onclick="dupleChk()">중복 확인</button> 
        <div id="idCheckResult"></div> <br> 
    </form>
        
<form action="MemberRegC" method="post" onsubmit="return validatePassword()">
        비밀번호<input type="password" name="m_pw" id="m_pw" placeholder="비밀번호" required><br><br>
        비밀번호 확인<input type="password" name="m_pw_confirm" id="m_pw_confirm" placeholder="비밀번호 확인" required><br><br>
        이름<input type="text" name="m_name" placeholder="이름" required><br><br>
        후리가나<input type="text" name="m_name_kana" placeholder="후리가나" required><br><br>
        성별<input type="radio" name="m_gender" value="남성" checked> 남성
        <input type="radio" name="m_gender" value="여성"> 여성
        <input type="radio" name="m_gender" value="기타"> 기타
        <br><br>
        우편번호<input type="text" name="a_postcode" placeholder="우편번호" required><br><br>
        <!-- <label for="a_prefecture">都道府県</label>
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
                </select> <br><br> -->
                주소 <input type="text" name="a_address" required><br><br>
       <!--  市区町村<br><input type="text" name="a_city" required><br><br>
        番地 <br><input type="text" name="a_street" required><br><br>
        ビル・マンション名など <br><input type="text" name="a_building" required><br><br> -->
        이메일<input type="email" name="m_email" placeholder="이메일" required><br><br>
        전화번호<input type="text" name="m_phone" placeholder="전화번호" required><br><br>
        생년월일<input type="date" name="m_birth" required> <br><br>
        <input type="submit" value="회원가입">
    </form>

	<script>
		function validatePassword() {
			const pw = document.getElementById('m_pw').value;
			const pwConfirm = document.getElementById('m_pw_confirm').value;

			if (pw !== pwConfirm) {
				alert("비밀번호가 일치하지 않습니다.");
				return false; // 폼 제출 방지
			}
			return true; // 폼 제출 허용
		}
		
        function dupleChk(){
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