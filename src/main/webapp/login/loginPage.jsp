<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>LINE Login Example</title>
  <link rel="stylesheet" href="login.css"> <!-- CSS파일 링크 -->
</head>
<body>
  <div class="hs_container">
    <h2 class="hs_title">～縁結び～</h2>
    <input type="text" id="id" name="id" placeholder="ID" required />
    <input type="password" id="password" name="password" placeholder="PASSWORD" required />
    <button id="loginButton">ログイン</button>
    <button id="lineLoginButton">LINE ログイン</button>
    <a href="http://localhost/En/regPage/regPage.jsp"><button id="registerButton">会員登録</button></a>
  </div>
 
  <script src="line-login.js"></script>
</body>
</html>
