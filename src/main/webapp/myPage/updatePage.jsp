<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>アカウント情報修正</title>
</head>
<body>
	<h2>アカウント情報修正</h2>

	<form action="MemberUpdateC" method="post"
		onsubmit="return validatePassword()">
		<input type="hidden" name="m_id" value="${sessionScope.m_id}">
		<%-- 아이디는 숨겨서 전달 --%>
		<p>ユーザーID: ${sessionScope.m_id}</p>
		<%-- 아이디는 읽기 전용으로 표시 --%>
		パスワード<input type="password" id="m_pw" name="m_pw" required><br>
		<br> パスワード確認<input type="password" id="m_pw_confirm"
			name="m_pw_confirm" required><br>
		<br> 名前<input type="text" id="m_name" name="m_name"
			value="${sessionScope.m_name}" required><br>
		<br> フリガナ<input type="text" id="m_name_kana" name="m_name_kana"
			value="${sessionScope.m_name_kana}" required><br>
		<br> 名前(英語)<input type="text" id="m_name_rome" name="m_name_rome"
			value="${sessionScope.m_name_rome}" required><br>
		<br> 性別<input type="radio" name="m_gender" value="男性">
		男性 <input type="radio" name="m_gender" value="女性"> 女性 <input
			type="radio" name="m_gender" value="その他"> その他 <br>
		<br> 郵便番号<input type="text" id="a_postcode" name="a_postcode"
			value="${sessionScope.a_postcode}" required><br>
		<br> 都道府県<select id="a_prefecture" name="a_prefecture" required>
			<option value="${fn:length(addressParts) > 0 ? addressParts[0] : ''}">選択してください</option>
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
		</select> <br>
		<br> 市区町村<br>
		<input type="text" name="a_city" id="a_city" value="${sessionScope.a_city}" required><br>
		<br> 番地 <br>
		<input type="text" name="a_street" id="a_street" value="${sessionScope.a_street}" required><br>
		<br> ビル・マンション名など <br>
		<input type="text" name="a_building" id="a_building" value="${sessionScope.a_building}" required><br>

		<br> メールアドレス<input type="email" name="m_email"
			value="${sessionScope.m_email}" required><br>
		<br> 電話番号<input type="text" name="m_phone"
			value="${sessionScope.m_phone}" required><br>
		<br> 生年月日<input type="date" id="m_birth" name="m_birth"
			value="${sessionScope.m_regdate}" required><br>
		<br> <button>修正</button>
	</form>
	<a href="javascript:window.history.back();"><button>取消</button></a>
	<br>
	<%-- MemberDetailC 서블릿으로 이동 --%>
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