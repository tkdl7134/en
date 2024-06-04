<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="../css/style.css"> <%-- 상대 경로 수정 --%>
</head>
<body>
    <h2>회원 정보 수정</h2>

    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
            <p style="color: red;"><%= errorMessage %></p>
    <%
        }
    %>

    <%
        MemberDTO dto = (MemberDTO) request.getAttribute("dto");
        if (dto != null) {
    %>
            <form action="/En/MemberUpdateC" method="post">
                <input type="hidden" name="m_id" value="<%= dto.getM_id() %>"> <%-- 아이디는 숨겨서 전달 --%>
                <p>아이디: <%= dto.getM_id() %></p> <%-- 아이디는 읽기 전용으로 표시 --%>
                <label for="m_pw">비밀번호:</label>
                <input type="password" id="m_pw" name="m_pw" value="<%= dto.getM_pw() %>" placeholder="새 비밀번호" required><br><br>
                <label for="m_name">이름:</label>
                <input type="text" id="m_name" name="m_name" value="<%= dto.getM_name() %>" required><br><br>
                <label for="m_name_kana">이름 (카타카나):</label>
                <input type="text" id="m_name_kana" name="m_name_kana" value="<%= dto.getM_name_kana() %>" required><br><br>
                <label for="m_birth">생년월일:</label>
                <input type="date" id="m_birth" name="m_birth" value="<%= dto.getM_birth() %>" required><br><br>
                <label>성별:</label>
                <input type="radio" name="m_gender" value="남성" <%= dto.getM_gender().equals("남성") ? "checked" : "" %>> 남성
                <input type="radio" name="m_gender" value="여성" <%= dto.getM_gender().equals("여성") ? "checked" : "" %>> 여성<br><br>
                <label for="m_email">이메일:</label>
                <input type="email" id="m_email" name="m_email" value="<%= dto.getM_email() %>" required><br><br>
                <label for="m_phone">전화번호:</label>
                <input type="tel" id="m_phone" name="m_phone" value="<%= dto.getM_phone() %>" required><br><br>
                <label for="a_address">주소:</label>
                <input type="text" id="a_address" name="a_address" value="<%= dto.getA_address() %>" required><br><br>
                <label for="a_postcode">우편번호:</label>
                <input type="text" id="a_postcode" name="a_postcode" value="<%= dto.getA_postcode() %>" required><br><br>
                <input type="submit" value="수정">
            </form>
    <%
        } else {
    %>
            <p style="color: red;">회원 정보가 없습니다.</p>
    <%
        }
    %>
    <a href="/En/MemberDetailC"> <button>마이페이지로 돌아가기</button></a> <br> <%-- MemberDetailC 서블릿으로 이동 --%>
    <a href="main.jsp"> <button>메인으로</button></a> <br>
</body>
</html>