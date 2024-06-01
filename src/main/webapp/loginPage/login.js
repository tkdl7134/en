document
  .getElementById("loginForm")
  .addEventListener("submit", function (event) {
    event.preventDefault(); // デフォルトのフォーム送信を防ぐ

    const userId = document.getElementById("userId").value;
    const password = document.getElementById("password").value;

    if (userId && password) {
      alert("ログイン成功: " + userId);
      // ここにサーバーへの送信コードを追加
    } else {
      alert("ユーザーIDとパスワードを入力してください");
    }
  });

document
  .getElementById("lineLoginButton")
  .addEventListener("click", function () {
    const clientId = "2005476894"; // LINE Developersで取得したチャネルIDを入力
    const redirectUri = encodeURIComponent("http://localhost/En/main.jsp"); // 設定したコールバックURLを入力

    const lineAuthUrl = `https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=${clientId}&redirect_uri=${redirectUri}&state=12345&scope=profile%20openid%20email`;
    window.location.href = lineAuthUrl;
  });
