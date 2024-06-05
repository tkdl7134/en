<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ログイン</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>ログイン</h2>
    <form action="/En/MemberC" method="post">
        <input type="text" name="m_id" placeholder="ユーザーID" required><br>
        <input type="password" name="m_pw" placeholder="パスワード" required><br>
        <button>ログイン</button>
    </form>
    <button id="lineLoginButton">LINEログイン</button>
    <script src="login.js"></script> 
</body>
</html>