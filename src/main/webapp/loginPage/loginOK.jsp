<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
</head>
<body>
	<!-- ログインエリアのテーブル -->
	<table id="login-area-tbl">
		<tr>
			<td>
				<!-- セッションスコープからメンバーIDと名前を表示 -->
				${sessionScope.member.mId} <br>
				(${sessionScope.member.mName})님 환영합니다.
			</td>
		</tr>
		<tr>
			<td>
				<!-- マイページへのリンクボタン -->
				<button onclick="location.href='MemberDetailC'">MyPage</button>
				<!-- ログアウトボタン -->
				<button onclick="location.href='MemberC?logout=true'">Logout</button>
			</td>
		</tr>
	</table>
</body>
</html>
