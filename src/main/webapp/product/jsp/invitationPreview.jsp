<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="product/css/invitationPreview.css">
</head>
<body>
  <!-- 로고 / 네비 -->
    <div id="yj-main-s2-logo">
      <img src="product/imgFolder/Logo.png" alt="" />
    </div>
    <div id="yj-main-s2-menu">
       <!-- 초대장 내용 -->
    <div id="je_container-invitionPreview">
      <div class="je_content-invitationPreview">
        <!-- 버튼 -->
        <div class="je_wishlistSet-btn">위시리스트 설정</div>
        <!-- 초대장 -->
        <div class="je_invitation">
          <img style="width: 90%" src="${inviteInfo.t_template}" alt="" />
          <div class="je_invitation-photo1"><img alt="" src="${inviteInfo.w_img1"></div>
          <div class="je_photos">
            <div class="je_invitation-photo2"><img alt="" src="${inviteInfo.w_img2"></div>
            <div class="je_invitation-photo3"><img alt="" src="${inviteInfo.w_img3"></div>
          </div>
          <div class="je_invitation-photo4"></div>
          <div style="width: 90%; z-index: 10">
            <div class="je_names">
              <div class="je_groom">大野　智</div>
              <div class="je_bride">신부 이름</div>
            </div>
            <div class="je_invitaton-message">
              皆様にはご清祥のこととお慶び申し上げます<br />
              佐藤家の新しい第一歩にお励ましないただきたく<br />
              ぜひご出席くださいますようご案内申し上げます
            </div>
            <div class="je_days">
              <div id="je_weddingDay">2024.06.21 토</div>
              <div id="je_receptionDay">2024.06.21 토</div>
            </div>
            <div class="je_eventTimes">
              <div id="je_mainEvent-time">10:00</div>
              <div id="je_sideEvent-time">10:00</div>
            </div>
            <div class="je_assembleTimes">
              <div id="je_mainEvent-gatherTime">집회 10:10</div>
              <div id="je_sideEvent-gatherTime">집회 10:10</div>
            </div>
            <div class="je_place">
              <div class="je_buildings">
                <div id="je_mainEvent-building">솔데스크</div>
                <div id="je_sideEvent-building">솔데스크</div>
              </div>
              <div class="je_addrs">
                <div class="je_mainEvent-addr">
                  東京都 渋谷区 代々木神園町1-1
                </div>
                <div class="je_sideEvent-addr">
                  東京都 渋谷区 代々木神園町1-1
                </div>
              </div>
            </div>
            <div class="je_finish-message">
              皆様の祝福に包まれて<br />
              挙式の日を迎えられることに心から感謝いたします <br />
              いたらぬところが多いふたりですが<br />
              今後とも変わらずお付き合いくださいますよう<br />
              よろしくお願いいたします
            </div>
          </div>
        </div>
      </div>
    </div>
<img alt="" src="product/imgFolder/${inviteInfo.w_img3 }">
</body>
</html>
<%-- ${inviteInfo.w_time } --%>