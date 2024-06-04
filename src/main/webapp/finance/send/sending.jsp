<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
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
      <div style="font-size: 2rem">
        <input
          class="kh-s-input"
          type="number"
          maxlength="8"
          oninput="numberMaxLength(this)"
        />円
      </div>
      <div class="kh-s-btn"></div>
    </div>
  </div>
</html>
