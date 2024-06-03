<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
<link rel="stylesheet" href="login_style.css">
</head>
<body>
  <div class="hs_container">
    <div class="hs_login-form">
      <h2 class="hs_title">ログイン</h2>
      <form id="loginForm" method="post" action="/En/MemberC">
        <div class="hs_form-group">
          <label for="memberId">ユーザーID</label>
          <input type="text" id="memberId" name="memberId" placeholder="ユーザーID" required>
        </div>
        <div class="hs_form-group">
          <label for="memberPW">パスワード</label>
          <input type="password" id="memberPW" name="memberPW" placeholder="パスワード" required>
        </div>
        <button type="submit">ログイン</button>
      </form>
      <div class="hs_line-login">
        <button id="lineLoginButton">LINEログイン</button>
      </div>
      <div class="hs_register-link">
        <form method="get" action="/En/regPage/reg.jsp">
          <button type="submit">会員登録</button>
        </form>
      </div>
    </div>
  </div>
  <script src="login.js"></script>
</body>
</html>
