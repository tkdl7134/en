<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="finance/css/send.css" />
  <script src="finance/js/send.js" defer></script>
  <div class="kh-s-container">
    <div class="kh-s-popup">
      <h1>関係による金額のおすすめ</h1>

      <div class="kh-s-recom-box">
        <div class="kh-s-recom-item-box" value="30000">
          <div class="kh-s-recom-item">会社同僚</div>
          <div class="kh-s-recom-item2">：3万</div>
        </div>
        <div class="kh-s-recom-item-box" value="50000">
          <div class="kh-s-recom-item">兄弟</div>
          <div class="kh-s-recom-item2">：5万</div>
        </div>
        <div class="kh-s-recom-item-box" value="50000">
          <div class="kh-s-recom-item">甥</div>
          <div class="kh-s-recom-item2">：5万</div>
        </div>
        <div class="kh-s-recom-item-box" value="30000">
          <div class="kh-s-recom-item">友人・いとこ</div>
          <div class="kh-s-recom-item2">：3万</div>
        </div>
      </div>
      <div>一番大切なことはお金ではなく心です。</div>
      <div style="position: relative">
        <div id="kh-input-box" style="font-size: 2rem">
          <input
            class="kh-s-input"
            type="number"
            maxlength="8"
            oninput="numberMaxLength(this)"
            onclick="removeWarn()"
          />円
        </div>
        <span
          id="kh-warn-text"
          style="color: red; position: absolute; bottom: -20px"
          class="kh-none"
          >金額をご入力してください。</span
        >
      </div>
      <div class="kh-s-btn" onclick="goFinanceResult()"></div>
    </div>
  </div>
</html>
