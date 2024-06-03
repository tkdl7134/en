document.addEventListener("DOMContentLoaded", function () {
  const loginButton = document.getElementById("loginButton");
  const lineLoginButton = document.getElementById("lineLoginButton");
  const profileDiv = document.getElementById("profile");
  const userNameElement = document.getElementById("userName");
  const myPageButton = document.getElementById("myPageButton");
  const logoutButton = document.getElementById("logoutButton");

  const clientId = "2005476894"; // LINE Developersで取得したチャネルIDを文字列として入力
  const redirectUri = "http://localhost/En/loginPage/loginPage.jsp"; // 設定したコールバックURLを入力

  lineLoginButton.addEventListener("click", () => {
    const lineAuthUrl = `https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=${clientId}&redirect_uri=${encodeURIComponent(
      redirectUri
    )}&state=12345&scope=profile%20openid%20email`;
    window.location.href = lineAuthUrl;
  });

  function getQueryParams() {
    const params = {};
    const queryString = window.location.search.substring(1);
    const regex = /([^&=]+)=([^&]*)/g;
    let m;
    while ((m = regex.exec(queryString))) {
      params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
    }
    return params;
  }

  async function fetchAccessToken(code) {
    const response = await fetch("https://api.line.me/oauth2/v2.1/token", {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: new URLSearchParams({
        grant_type: "authorization_code",
        code: code,
        redirect_uri: redirectUri,
        client_id: clientId,
        client_secret: "c023cd86708ee211f26c4344ca4347b7", // LINE Developersで取得したチャネルシークレットを入力
      }),
    });
    const data = await response.json();
    return data.access_token;
  }

  async function fetchUserProfile(accessToken) {
    const response = await fetch("https://api.line.me/v2/profile", {
      headers: {
        Authorization: `Bearer ${accessToken}`,
      },
    });
    const profile = await response.json();
    return profile;
  }

  async function handleLogin() {
    const params = getQueryParams();
    if (params.code) {
      const accessToken = await fetchAccessToken(params.code);
      const profile = await fetchUserProfile(accessToken);

      userNameElement.textContent = profile.userId; // 라인의 ID를 출력
      profileDiv.style.display = "block";
      lineLoginButton.style.display = "none"; // LINE 로그인 버튼을 숨김
    }
  }

  myPageButton.addEventListener("click", () => {
    window.location.href = "/mypage.html"; // マイページのURLを指定
  });

  logoutButton.addEventListener("click", () => {
    // ログアウト処理 (예: アクセストークン의 무효화 및 세션 클리어)
    alert("ログアウトしました");
    profileDiv.style.display = "none";
    lineLoginButton.style.display = "block"; // LINE 로그인 버튼을 다시 표시
  });

  handleLogin();
});
