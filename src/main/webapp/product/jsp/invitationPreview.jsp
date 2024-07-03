<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>招待状管理</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="product/css/invitationPreview.css">
<script type="text/javascript" src="product/js/invitationPreview.js"></script>
</head>
<body>
    <!-- 초대장 내용 -->
    <div id="je_container-invitionPreview">
      <div class="je_content-invitationPreview">
        <!-- 버튼 -->
    <div class="je_previewBtns">
      <div class="je_previewBtn je_wishlistSet-btn" onclick="location.href='SelectWishiC?eno=${inviteInfo.e_no}'">
        ✿ ウィッシュリスト - 設定 ✿
      </div>
      <div class="je_previewBtn je_delete-btn">
        <a href="InvitationDelC?eno=${inviteInfo.e_no}" onclick="deleteCheck()"> ✿ 招待状 - 削除</a>
      </div>
      <div class="je_previewBtn je_update-btn">
        <a href="InvitationUpdateC?eno=${inviteInfo.e_no}"> ✿ 招待状 - 修正</a>
      </div>
    </div>
        <!-- 초대장 -->
        <div class="je_invitation">
          <img style="width: 90%" src="product/imgFolder/${inviteInfo.t_template }" alt="" />
          <div class="je_invitation-photo1"><img src="product/imgFolder/${inviteInfo.w_img1 }" alt="" /></div>
          <div class="je_photos">
            <div class="je_invitation-photo2"> <img src="product/imgFolder/${inviteInfo.w_img2 }" alt="" /></div>
            <div class="je_invitation-photo3"> <img src="product/imgFolder/${inviteInfo.w_img3 }" alt="" /></div>
          </div>
          <div class="je_invitation-photo4"> <img src="product/imgFolder/${inviteInfo.w_img4 }" alt="" /></div>
          <div style="width: 90%; z-index: 10">
            <div class="je_names">
              <div class="je_groom">${inviteInfo.w_groom }</div>
              <div class="je_bride">${inviteInfo.w_bride }</div>
            </div>
            <div class="je_invitaton-message">
              ${inviteInfo.w_msg_invite }
            </div>
            <div class="je_days">
              <div id="je_weddingDay">${inviteInfo.weddingDay }</div>
              <div id="je_receptionDay">${inviteInfo.weddingDay }</div>
            </div>
            <div class="je_eventTimes">
              <div id="je_mainEvent-time">${inviteInfo.r_weddingTime }</div>
              <div id="je_sideEvent-time">${inviteInfo.r_receptionTime }</div>
            </div>
            <div class="je_assembleTimes">
              <div id="je_mainEvent-gatherTime">${inviteInfo.r_weddingTime_assemble }</div>
              <div id="je_sideEvent-gatherTime">${inviteInfo.r_receptionTime_assemble }</div>
            </div>
            <div class="je_place">
              <div class="je_buildings">
                <div id="je_mainEvent-building">${inviteInfo.r_weddingPlace }</div>
                <div id="je_sideEvent-building">${inviteInfo.r_receptionPlace }</div>
              </div>
              <div class="je_addrs">
                <div class="je_mainEvent-addr">
                 ${inviteInfo.r_weddingAddr }
                </div>
                <div class="je_sideEvent-addr">
                 ${inviteInfo.r_receptionAddr }
                </div>
              </div>
            </div> <!-- 이 줄을 수정 -->
            <div class="je_finish-message">
                 ${inviteInfo.w_msg_bye }
            </div>
          </div>
        </div>
      </div>
    </div>

</body>
</html>