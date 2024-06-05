// login.js
document
    .getElementById("lineLoginButton")
    .addEventListener("click", function() {
        const clientId = "2005476894"; // LINE Developers에서 발급받은 채널 ID
        const redirectUri = encodeURIComponent("http://localhost/En/LineLoginCallbackC"); // 콜백 URL
        const state = Math.random().toString(36).substring(2); // CSRF 방지를 위한 state 파라미터 생성

        const lineAuthUrl = `https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=${clientId}&redirect_uri=${redirectUri}&state=${state}&scope=profile%20openid%20email`;
        window.location.href = lineAuthUrl;
    });