<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="reg.css" />
<title>Insert title here</title>
<title>会員登録フォーム</title>
  </head>
  <body>
    <form>
      <div class="hs_title"><h2>会員登録フォーム</h2></div>

      <label for="id">ID:</label>
      <input type="text" id="id" name="id" placeholder="" required />

      <label for="password">パスワード:</label>
      <input
        type="password"
        id="password"
        name="password"
        placeholder="********"
        required
      />

      <label for="name">名前:</label>
      <input
        type="text"
        id="name"
        name="name"
        placeholder="山田 太郎"
        required
      />

      <label for="kana">フリガナ:</label>
      <input
        type="text"
        id="kana"
        name="kana"
        placeholder="ヤマダ タロウ"
        required
      />

      <label for="birthdate">生年月日:</label>
      <input type="date" id="birthdate" name="birthdate" required />

      <label for="gender">性別:</label>
      <select id="gender" name="gender" required>
        <option value="male">男性</option>
        <option value="female">女性</option>
        <option value="other">その他</option>
      </select>

      <label for="email">メールアドレス:</label>
      <input
        type="email"
        id="email"
        name="email"
        placeholder="example@example.com"
        required
      />

      <label for="phone">電話番号:</label>
      <input
        type="tel"
        id="phone"
        name="phone"
        placeholder="012-3456-7890"
        required
      />

      <label for="newsletter">メルマガ受信の有無:</label>
      <select id="newsletter" name="newsletter" required>
        <option value="yes">受信する</option>
        <option value="no">受信しない</option>
      </select>

      <button type="submit">登録する</button>
    </form>
  </body>
</html>
