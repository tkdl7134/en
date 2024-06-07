<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ログイン</title>
</head>
<body>
    <h2>ログイン</h2>
    <form action="/En/MemberC" method="post">
        <input type="text" name="m_id" placeholder="ユーザーID" required><br>
        <input type="password" name="m_pw" placeholder="パスワード" required><br>
        <button>ログイン</button>
    </form>
    
    <a href="https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=2005476894&redirect_uri=http://localhost/En/LineLoginC&state=enmusubi123&scope=profile%20openid&nonce=09876xyz">
    <button id="lineLoginButton">LINEログイン</button>
	 </a>
</body>
</html>