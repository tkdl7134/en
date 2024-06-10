<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ログイン</title>
    <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
</head>
<body>
    <h2>ログイン</h2>
    <form action="MemberC" method="post">
        <input type="text" name="m_id" placeholder="ユーザーID" required><br>
        <input type="password" name="m_pw" placeholder="パスワード" required><br>
        <button>ログイン</button>
    </form>
    
    <button id="lineLoginButton">LINEログイン</button> <br>
    <a href="/En/MemberRegC"><button>会員登録</button></a>

<script>
$(document).ready(function() {
    $('#lineLoginButton').click(function() {
        window.location.href = "https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=2005476894&redirect_uri=http://localhost/En/LineLoginC&state=enmusubi123&scope=profile%20openid&nonce=09876xyz";
    });
});
    </script>
</body>
</html>