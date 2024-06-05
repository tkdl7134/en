<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>マイページ</title>
  <link rel="stylesheet" href="myPage/myPage.css">
</head>
<body>
  <div class="container">
    <aside class="sidebar">
      <ul>
        <li><a href="InvitationController" >招待管理</a></li>
        <li><a href="#">マイテンプレート</a></li>
        <li><a href="#">情報管理</a></li>
        <li><a href="#">統計</a></li>
      </ul>
    </aside>
    <main class="content">
      <h1>マイページ</h1>
      <form>
        <div class="form-group">
          <label for="userId">ID:</label>
          <input type="text" id="userId" name="userId" readonly>
        </div>
        <div class="form-group">
          <label for="password">PW:</label>
          <input type="password" id="password" name="password" readonly>
        </div>
        <div class="form-group">
          <label for="name">名前:</label>
          <input type="text" id="name" name="name" readonly>
        </div>
        <div class="form-group">
          <label for="furigana">フリガナ:</label>
          <input type="text" id="furigana" name="furigana" readonly>
        </div>
        <div class="form-group">
          <label for="birthdate">生年月日:</label>
          <input type="date" id="birthdate" name="birthdate" readonly>
        </div>
        <div class="form-group">
          <label for="gender">性別:</label>
          <input type="text" id="gender" name="gender" readonly>
        </div>
        <div class="form-group">
          <label for="email">メール:</label>
          <input type="email" id="email" name="email" readonly>
        </div>
        <div class="form-group">
          <label for="newsletter">メルマガ受信の有無:</label>
          <input type="text" id="newsletter" name="newsletter" readonly>
        </div>
      </form>
    </main>
  </div>
</body>
</html>
