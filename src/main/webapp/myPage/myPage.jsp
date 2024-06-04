<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
<link rel="stylesheet" href="css/style.css">
</head>
<h2>마이페이지</h2>

<%
String errorMessage = (String) request.getAttribute("errorMessage");
if (errorMessage != null) {
%>
<p style="color: red;"><%=errorMessage%></p>
<%
}
%>

<%
MemberDTO dto = (MemberDTO) request.getAttribute("dto"); // request에서 회원 정보 가져오기
if (dto != null) {
%>
<p>아이디: <%= dto.getM_id() %></p>
            <p>이름: <%= dto.getM_name() %></p>
            <p>이름 (카타카나): <%= dto.getM_name_kana() %></p>
            <p>생년월일: <%= dto.getM_birth() %></p>
            <p>성별: <%= dto.getM_gender() %></p>
            <p>이메일: <%= dto.getM_email() %></p>
            <p>전화번호: <%= dto.getM_phone() %></p>
            <p>주소: <%= dto.getA_address() %></p>
            <p>우편번호: <%= dto.getA_postcode() %></p>
	
	<a href="myPage/updatePage.jsp"><button>회원정보 수정</button> </a> <br>
	<a href="/En/MemberDeleteC"><button>탈퇴</button> </a> <br>
	<a href="main.jsp"><button>메인으로</button> </a>

<%
}
%>
</body>
</html>