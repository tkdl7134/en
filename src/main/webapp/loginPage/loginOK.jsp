<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="login-area-tbl">
		<tr>
			<td>${sessionScope.account.m_id }<br>
			(${account.m_name })님 환영합니다.
			</td>
		</tr>
		<tr>
			<td>
				<button onclick="location.href='MemberDetailC'">MyPage</button>
				<button onclick="location.href='MemberC'">logout</button>
			</td>
		</tr>
	</table>

</body>
</html>