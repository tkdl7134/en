<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<h2>회원가입</h2>
	<%
	String error = (String) request.getAttribute("error");
	if (error != null) {
	%>
	<p style="color: red;"><%=error%></p>
	<%
	}
	%>
	<form action="/En/MemberRegC" method="post" onsubmit="return validateForm()">
        <input type="text" name="m_id" id="m_id" placeholder="아이디" required>
        <button type="button" onclick="checkId()">중복 확인</button><br>
        <input type="password" name="m_pw" id="m_pw" placeholder="비밀번호" required><br>
        <input type="password" name="m_pw_confirm" id="m_pw_confirm" placeholder="비밀번호 확인" required><br>
        <input type="text" name="m_name" placeholder="이름" required><br>
        <input type="text" name="m_name_kana" placeholder="이름 (카타카나)" required><br>
        <input type="date" name="m_birth" required><br>
        <input type="radio" name="m_gender" value="남성" checked> 남성
        <input type="radio" name="m_gender" value="여성"> 여성<br>
        <input type="email" name="m_email" placeholder="이메일" required><br>
        <input type="tel" name="m_phone" placeholder="전화번호" required><br>
        <input type="text" name="a_address" placeholder="주소" required><br>
        <input type="text" name="a_postcode" placeholder="우편번호" required><br>
        <input type="hidden" name="idCheck" id="idCheck" value="false"> <%-- 아이디 중복 확인 여부 저장 --%>
        <input type="submit" value="회원가입">
    </form>

	<script>
	function validateForm() {
        const isIdChecked = document.getElementById('idCheck').value === 'true';
        if (!isIdChecked) {
            alert("아이디 중복 확인을 해주세요.");
            return false;
        }
        return validatePassword();
    }

		function validatePassword() {
			const pw = document.getElementById('m_pw').value;
			const pwConfirm = document.getElementById('m_pw_confirm').value;

			if (pw !== pwConfirm) {
				alert("비밀번호가 일치하지 않습니다.");
				return false; // 폼 제출 방지
			}
			return true; // 폼 제출 허용
		}

		function checkId() {
			const m_id = document.getElementById('m_id').value;
		    document.getElementById('idCheck').value = 'false'; // 중복 확인 버튼 클릭 시 idCheck 값 초기화

            // AJAX를 사용하여 서버에 아이디 중복 확인 요청
            const xhr = new XMLHttpRequest();
            xhr.open('POST', '/En/MemberIdCheckC', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    const response = xhr.responseText;
                    if (response === 'available') {
                        alert("사용 가능한 아이디입니다.");
                        document.getElementById('idCheck').value = 'true'; // 중복 확인 완료 표시
                    } else {
                        alert("이미 사용 중인 아이디입니다.");
                        document.getElementById('idCheck').value = 'false'; // 중복 확인 실패 표시
                    }
                }
            };
            xhr.send(`m_id=${m_id}`);
        }
	</script>
</body>
</html>