<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ログイン</title>
    <link rel="stylesheet" type="text/css" href="login.css">
    <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
</head>
<body class="hs_body">
<img class="enmusubi" alt="" src="./ImgFolder/828a704e967fa89b.png">
<img class="menu-btn-1" alt="" src="./ImgFolder/menu_btn_1.png">
<img class="opt-pink" alt="" src="./ImgFolder/footer.png">

    <h2 class="hs_heading">ログイン</h2>

    <form action="MemberC" method="post" class="hs_form">
        <input type="text" name="m_id" placeholder="ユーザーID" required class="hs_input"><br>
        <input type="password" name="m_pw" placeholder="パスワード" required class="hs_input"><br>
        <button class="hs_login-btn">ログイン</button>
    </form>
    
    <button id="lineLoginButton" class="hs_btn">LINEでログイン</button> <br>
    <a href="MemberRegC"><button class="hs_btn">✿会員登録はこちら✿</button></a> <br>
<script>
$(document).ready(function() {
    $('#lineLoginButton').click(function() {
        window.location.href = "https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=2005476894&redirect_uri=http://localhost/En/LineLoginC&state=enmusubi123&scope=profile%20openid&nonce=09876xyz";
    });
});
    </script>
</body>
</html>