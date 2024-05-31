<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LINE Login Example</title>
  <link rel="stylesheet" href="line-login.css"> <!-- CSSファイルをリンク -->
</head>
<body>
  <button id="loginButton">LINE Login</button>
  <button id="registerButton">会員登録</button>
  <div id="profile" style="display: none">
    <p id="userName"></p>
    <button id="myPageButton">マイページ</button>
    <button id="logoutButton">ログアウト</button>
  </div>
  <script src="line-login.js"></script>
</body>
</html>