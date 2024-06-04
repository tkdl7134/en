<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <p style="color: red;"><%= error %></p>
    <%
        }
    %>
    <form action="/En/MemberRegC" method="post" onsubmit="return validatePassword()"> <%-- onsubmit 이벤트 추가 --%>
        <input type="text" name="m_id" placeholder="아이디" required><br>
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
    </script>
</body>
</html>