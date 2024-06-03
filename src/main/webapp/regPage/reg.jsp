<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="reg.css">
<title>会員登録ページ</title>
</head>
<body>
  <div class="hs_container">
    <div class="hs_register-form">
      <h2 class="hs_title">会員登録</h2>
      <form id="registerForm" method="post" action="MemberRegC">
        <div class="hs_form-group">
          <label for="userId">ユーザーID</label>
          <input type="text" id="userId" name="userId" placeholder="ユーザーID" required>
        </div>
        <div class="hs_form-group">
          <label for="password">新しいパスワード</label>
          <input type="password" id="password" name="password" placeholder="新しいパスワード" required>
        </div>
        <div class="hs_form-group">
          <label for="confirmPassword">新しいパスワード（確認）</label>
          <input type="password" id="confirmPassword" name="confirmPassword" placeholder="新しいパスワード（確認）" required>
        </div>
        <div class="hs_form-group">
          <label for="name">氏名</label>
          <input type="text" id="name" name="name" placeholder="氏名" required>
        </div>
        <div class="hs_form-group">
          <label for="kana">フリガナ</label>
          <input type="text" id="kana" name="kana" placeholder="フリガナ" required>
        </div>
        <div class="hs_form-group">
          <label>性別</label>
          <input type="radio" id="male" name="gender" value="男" required> 男
          <input type="radio" id="female" name="gender" value="女" required> 女
          <input type="radio" id="other" name="gender" value="その他" required> その他
        </div>
        <div class="hs_form-group">
          <label for="postalCode">郵便番号</label>
          <input type="text" id="postalCode1" name="postalCode1" placeholder="郵便番号" required> - 
          <input type="text" id="postalCode2" name="postalCode2" required>
        </div>
        <div class="hs_form-group">
          <label for="prefecture">都道府県</label>
          <select id="prefecture" name="prefecture" required>
            <option value="" disabled selected>選択してください</option>
           <option value="北海道">北海道</option>
            <option value="青森県">青森県</option>
            <option value="岩手県">岩手県</option>
            <option value="宮城県">宮城県</option>
            <option value="秋田県">秋田県</option>
            <option value="山形県">山形県</option>
            <option value="福島県">福島県</option>
            <option value="茨城県">茨城県</option>
            <option value="栃木県">栃木県</option>
            <option value="群馬県">群馬県</option>
            <option value="埼玉県">埼玉県</option>
            <option value="千葉県">千葉県</option>
            <option value="東京都">東京都</option>
            <option value="神奈川県">神奈川県</option>
            <option value="新潟県">新潟県</option>
            <option value="富山県">富山県</option>
            <option value="石川県">石川県</option>
            <option value="福井県">福井県</option>
            <option value="山梨県">山梨県</option>
            <option value="長野県">長野県</option>
            <option value="岐阜県">岐阜県</option>
            <option value="静岡県">静岡県</option>
            <option value="愛知県">愛知県</option>
            <option value="三重県">三重県</option>
            <option value="滋賀県">滋賀県</option>
            <option value="京都府">京都府</option>
            <option value="大阪府">大阪府</option>
            <option value="兵庫県">兵庫県</option>
            <option value="奈良県">奈良県</option>
            <option value="和歌山県">和歌山県</option>
            <option value="鳥取県">鳥取県</option>
            <option value="島根県">島根県</option>
            <option value="岡山県">岡山県</option>
            <option value="広島県">広島県</option>
            <option value="山口県">山口県</option>
            <option value="徳島県">徳島県</option>
            <option value="香川県">香川県</option>
            <option value="愛媛県">愛媛県</option>
            <option value="高知県">高知県</option>
            <option value="福岡県">福岡県</option>
            <option value="佐賀県">佐賀県</option>
            <option value="長崎県">長崎県</option>
            <option value="熊本県">熊本県</option>
            <option value="大分県">大分県</option>
            <option value="宮崎県">宮崎県</option>
            <option value="鹿児島県">鹿児島県</option>
            <option value="沖縄県">沖縄県</option>
            <option value="海外">海外</option>
          </select>
        </div>
        <div class="hs_form-group">
          <label for="city">市区町村</label>
          <input type="text" id="city" name="city" placeholder="市区町村" required>
        </div>
        <div class="hs_form-group">
          <label for="address">番地</label>
          <input type="text" id="address" name="address" placeholder="番地" required>
        </div>
        <div class="hs_form-group">
          <label for="building">ビル・マンション名など</label>
          <input type="text" id="building" name="building" placeholder="ビル・マンション名など">
        </div>
        <div class="hs_form-group">
          <label for="email">メールアドレス</label>
          <input type="email" id="email" name="email" placeholder="メールアドレス" required>
        </div>
        <div class="hs_form-group">
          <label for="phone">電話番号</label>
          <input type="tel" id="phone" name="phone" placeholder="電話番号" required>
        </div>
        <div class="hs_form-group">
          <label for="birthYear">生年月日</label>
          <input type="text" id="birthYear" name="birthYear" placeholder="年" required> 年
          <input type="text" id="birthMonth" name="birthMonth" placeholder="月" required> 月
          <input type="text" id="birthDay" name="birthDay" placeholder="日" required> 日
        </div>
        <button type="submit">登録</button>
      </form>
    </div>
  </div>
</body>
</html>
