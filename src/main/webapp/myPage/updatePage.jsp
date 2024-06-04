<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 정보 수정</title>
</head>
<body>
    <h2>회원 정보 수정</h2>

     <form action="/En/MemberUpdateC" method="post">
        <input type="hidden" name="m_id" value="${sessionScope.m_id}"> <%-- 아이디는 숨겨서 전달 --%>
        <p>아이디: ${sessionScope.m_id}</p> <%-- 아이디는 읽기 전용으로 표시 --%>
        <label for="m_pw">비밀번호:</label>
        <input type="password" id="m_pw" name="m_pw" value="${sessionScope.m_pw}" placeholder="새 비밀번호" required><br><br>
        <label for="m_name">이름:</label>
        <input type="text" id="m_name" name="m_name" value="${sessionScope.m_name}" required><br><br>
        <label for="m_name_kana">이름 (카타카나):</label>
        <input type="text" id="m_name_kana" name="m_name_kana" value="${sessionScope.m_name_kana}" required><br><br>
        <label for="m_birth">생년월일:</label>
        <input type="date" id="m_birth" name="m_birth" value="${sessionScope.m_birth}" required><br><br>
        <label>성별:</label>
        <input type="radio" name="m_gender" value="남성" ${sessionScope.m_gender == '남성' ? 'checked' : ''}> 남성
        <input type="radio" name="m_gender" value="여성" ${sessionScope.m_gender == '여성' ? 'checked' : ''}> 여성<br><br>
        <input type="email" name="m_email" value="${sessionScope.m_email}" placeholder="이메일" required><br><br>
        <input type="tel" name="m_phone" value="${sessionScope.m_phone}" placeholder="전화번호" required><br><br>
        <input type="text" name="a_address" value="${sessionScope.a_address}" placeholder="주소" required><br><br>
        <input type="text" name="a_postcode" value="${sessionScope.a_postcode}" placeholder="우편번호" required><br><br>
        <input type="submit" value="수정">
    </form>
    <a href="/En/MemberDetailC"> <button>마이페이지로 돌아가기</button></a> <br> <%-- MemberDetailC 서블릿으로 이동 --%>
</body>
</html>