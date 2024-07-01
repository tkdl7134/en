// 날짜 출력
$(function () {
  $("#specialDate").datepicker({
    onSelect: function () {
      var date = $.datepicker.formatDate(
        "yy.mm.dd DD",
        $("#specialDate").datepicker("getDate")
      );
      // alert(date);
      $("#je_weddingDay").text(date);
      $("#je_receptionDay").text(date);
    },
  });
});

// 이름출력
function printName() {
  const fields = [
    // 신랑
    { inputId: "je_g-kanji1", outputId: "je_groom-kanjiL" },
    { inputId: "je_g-kanji2", outputId: "je_groom-kanjiF" },
    // { inputId: "je_g-kana1", outputId: "je_groom-kanaL" },
    // { inputId: "je_g-kana2", outputId: "je_groom-kanaF" },
    // { inputId: "je_g-roma1", outputId: "je_groom-romaL" },
    // { inputId: "je_g-roma1", outputId: "je_groom-romaF" },
    // 신부
    { inputId: "je_b-kanji1", outputId: "je_bride-kanjiL" },
    { inputId: "je_b-kanji2", outputId: "je_bride-kanjiF" },
    // { inputId: "je_b-kana1", outputId: "je_bride-kanaL" },
    // { inputId: "je_b-kana2", outputId: "je_bride-kanaF" },
    // { inputId: "je_b-roma1", outputId: "je_bride-romaL" },
    // { inputId: "je_b-roma1", outputId: "je_bride-romaF" },
  ];

  fields.forEach((field) => {
    document.getElementById(field.outputId).innerText = document.getElementById(
      field.inputId
    ).value;
  });
}

// 나머지 정보 출력
function printInfo() {
  const fields = [
    { inputId: "je_main-building", outputId: "je_mainEvent-building" },
    { inputId: "je_main-addr", outputId: "je_mainEvent-addr" },
    { inputId: "je_side-building", outputId: "je_sideEvent-building" },
    { inputId: "je_side-addr", outputId: "je_sideEvent-addr" },
    { inputId: "je_invite-m", outputId: "je_invite-message" },
    { inputId: "je_finish-m", outputId: "je_finish-message" },
  ];

  fields.forEach((field) => {
    document.getElementById(field.outputId).innerText = document.getElementById(
      field.inputId
    ).value;
  });
}




