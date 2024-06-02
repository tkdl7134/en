<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
  <div class="container">
    <div class="login-form">
      <h2 class="title">ログイン</h2>
      <form id="loginForm" method="post" action="MemberRegC">
        <div class="form-group">
          <label for="userId">ユーザーID</label>
          <input type="text" id="userId" name="userId" placeholder="ユーザーID" required>
        </div>
        <div class="form-group">
          <label for="password">パスワード</label>
          <input type="password" id="password" name="password" placeholder="パスワード" required>
        </div>
        <button type="submit">ログイン</button>
      </form>
    </div>
  </div>
  <script src="login.js"></script>
</body>
</html>
