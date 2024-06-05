<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>マイページ</title>
</head>
<h2>マイページ</h2>

<c:if test="${not empty errorMessage}">
	<p style="color: red;">${errorMessage}</p>
</c:if>

<c:if test="${not empty dto}">
	<p>ユーザーID: ${dto.m_id}</p>
	<p>名前: ${dto.m_name}</p>
	<p>フリガナ: ${dto.m_name_kana}</p>
	<p>性別: ${dto.m_gender}</p>
	<p>郵便番号: ${dto.a_postcode}</p>

	<c:set var="addressParts" value="${fn:split(dto.a_address, ', ')}" />
	<%-- 주소 분리 --%>
	<p>都道府県: ${addressParts[0]}</p>
	<p>市区町村: ${addressParts[1]}</p>
	<p>番地: ${addressParts[2]}</p>
	<p>ビル・マンション名など: ${addressParts[3]}</p>
	<p>メールアドレス : ${dto.m_email}</p>
	<p>電話番号: ${dto.m_phone}</p>

	<fmt:parseDate value="${dto.m_birth}" pattern="yyyy-MM-dd"
		var="parsedDate" />
	<p>
		生年月日:
		<fmt:formatDate value="${parsedDate}" pattern="yyyy年 MM月 dd日" />
	</p>

	<a href="myPage/updatePage.jsp"><button>変更する</button></a>
	<br>
	<form action="MemberDeleteC" method="post" onsubmit="return confirmDelete()">
		<button type="submit">アカウント削除</button>
	</form>
	<a href="javascript:window.history.back();"><button>戻る</button></a>
</c:if>

<script>
function confirmDelete() {
    if (confirm("本当に削除しますか？")) {
        return true; // 확인 버튼 클릭 시 폼 제출
    } else {
        return false; // 취소 버튼 클릭 시 폼 제출 방지
    }
}
</script>
</body>
</html>