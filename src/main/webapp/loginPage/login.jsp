<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>로그인</h2>
    <form action="MemberC" method="post">
        <input type="text" name="m_id" placeholder="아이디" required><br>
        <input type="password" name="m_pw" placeholder="비밀번호" required><br>
        <input type="submit" value="로그인">
    </form>
    <button id="lineLoginButton">LINE로그인</button>
    <script src="login.js"></script> 
</body>
</html>