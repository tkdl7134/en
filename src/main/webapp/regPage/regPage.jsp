<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="reg.css">
<title>会員登録ページ</title>
</head>
<body>
  <div class="container">
    <div class="register-form">
      <h2 class="title">会員登録</h2>
      <form id="registerForm" method="post" action="register">
        <div class="form-group">
          <label for="userId">ユーザーID</label>
          <input type="text" id="userId" name="userId" placeholder="ユーザーID" required>
        </div>
        <div class="form-group">
          <label for="password">パスワード</label>
          <input type="password" id="password" name="password" placeholder="パスワード" required>
        </div>
        <div class="form-group">
          <label for="name">名前</label>
          <input type="text" id="name" name="name" placeholder="名前" required>
        </div>
        <div class="form-group">
          <label for="kana">フリガナ</label>
          <input type="text" id="kana" name="kana" placeholder="フリガナ" required>
        </div>
        <div class="form-group">
          <label for="birthdate">生年月日</label>
          <input type="date" id="birthdate" name="birthdate" required>
        </div>
        <div class="form-group">
          <label for="gender">性別</label>
          <select id="gender" name="gender" required>
            <option value="" disabled selected>選択してください</option>
            <option value="male">男性</option>
            <option value="female">女性</option>
            <option value="other">その他</option>
          </select>
        </div>
        <div class="form-group">
          <label for="email">メールアドレス</label>
          <input type="email" id="email" name="email" placeholder="メールアドレス" required>
        </div>
        <div class="form-group">
          <label for="phone">電話番号</label>
          <input type="tel" id="phone" name="phone" placeholder="電話番号" required>
        </div>
        <div class="form-group">
          <label for="newsletter">ニュースレターを受け取る</label>
          <select id="newsletter" name="newsletter" required>
            <option value="" disabled selected>選択してください</option>
            <option value="true">はい</option>
            <option value="false">いいえ</option>
          </select>
        </div>
        <button type="submit">登録</button>
      </form>
    </div>
  </div>
  <script src="register.js"></script>
</body>
</html>
