<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>
</head>
<h2>마이페이지</h2>

<c:if test="${not empty errorMessage}">
	<p style="color: red;">${errorMessage}</p>
</c:if>

<c:if test="${not empty dto}">
	<p>아이디: ${dto.m_id}</p>
	<p>이름: ${dto.m_name}</p>
	<p>フリガナ: ${dto.m_name_kana}</p>
	<p>성별: ${dto.m_gender}</p>
	<p>우편번호: ${dto.a_postcode}</p>

	<c:set var="addressParts" value="${fn:split(dto.a_address, ', ')}" />
	<%-- 주소 분리 --%>
	<p>都道府県: ${addressParts[0]}</p>
	<p>市区町村: ${addressParts[1]}</p>
	<p>번지: ${addressParts[2]}</p>
	<p>건물명: ${addressParts[3]}</p>
	<p>이메일: ${dto.m_email}</p>
	<p>전화번호: ${dto.m_phone}</p>

	<fmt:parseDate value="${dto.m_birth}" pattern="yyyy-MM-dd"
		var="parsedDate" />
	<p>
		생년월일:
		<fmt:formatDate value="${parsedDate}" pattern="yyyy年 MM月 dd日" />
	</p>

	<a href="myPage/updatePage.jsp"><button>회원정보 수정</button></a>
	<br>
	<form action="MemberDeleteC" method="post">
		<button type="submit">탈퇴</button>
	</form>
	<a href="main.jsp"><button>메인으로</button></a>
</c:if>
</body>
</html>