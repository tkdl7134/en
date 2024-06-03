// login.js
document
  .getElementById("lineLoginButton")
  .addEventListener("click", function () {
    const clientId = "2005476894"; // LINE Developers에서 발급받은 채널 ID 입력
    const redirectUri = encodeURIComponent("http://localhost/En/LineLoginCallbackC"); // 콜백 URL 수정

    const lineAuthUrl = `https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=${clientId}&redirect_uri=${redirectUri}&state=12345&scope=profile%20openid%20email`;
    window.location.href = lineAuthUrl;
  });