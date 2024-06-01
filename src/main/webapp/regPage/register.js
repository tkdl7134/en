document.addEventListener("DOMContentLoaded", function () {
  document.getElementById("registerForm").addEventListener("submit", function (event) {
    // イベントをキャンセルしてフォームの送信を防ぐ
    event.preventDefault(); 

    // フォームのフィールドを取得
    const userId = document.getElementById("userId").value;
    const password = document.getElementById("password").value;
    const name = document.getElementById("name").value;
    const kana = document.getElementById("kana").value;
    const birthdate = document.getElementById("birthdate").value;
    const gender = document.getElementById("gender").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    const newsletter = document.getElementById("newsletter").value;

    // 必須フィールドの検証
    if (!userId || !password || !name || !kana || !birthdate || !gender || !email || !phone || !newsletter) {
      alert("すべてのフィールドを入力してください");
      return; // フォーム送信をキャンセル
    }

    // すべてのフィールドが入力されている場合、フォームを送信
    this.submit();
  });
});
