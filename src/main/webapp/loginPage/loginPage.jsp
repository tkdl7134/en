<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="loginPage.css">
  <title>ログインページ</title>
</head>
<body>
  <div class="container">
    <div class="login-form">
      <h2 class="title">ログイン</h2>
      <form id="loginForm" method="post" action="login">
        <div class="form-group">
          <label for="userId">ユーザーID</label>
          <input type="text" id="userId" name="userId" placeholder="ユーザーID" required>
        </div>
        <div class="form-group">
          <label for="password">パスワード</label>
          <input type="password" id="password" name="password" placeholder="パスワード" required>
        </div>
        <button type="submit" id="loginButton">ログイン</button>
        <button type="button" id="lineLoginButton">LINE ログイン</button>
        <button type="button" id="registerButton" onclick="location.href='MemberRegC'">会員登録</button>
      </form>
    </div>
  </div>
  <script src="login.js"></script>
</body>
</html>