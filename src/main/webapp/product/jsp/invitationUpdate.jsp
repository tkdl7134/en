<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet"/>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<link rel="stylesheet" href="product/css/productMake.css" />
<link rel="stylesheet" href="product/css/picker.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="product/js/productMake.js"></script>
<script type="text/javascript">
window.onload = function() {
	printInfo();
	printName();
	
}
</script>
</head>
<body>
<!-- 로고 / 네비 -->
	<div id="yj-main-s2-logo">
	  <img src="product/imgFolder/Logo.png" alt="" />
	</div>
	<div id="yj-main-s2-menu">
	  <img src="product/imgFolder/menu_btn_1.png" alt="" />
	</div>
    <!-- 템플릿 제작 page -->
    <div id="je_container-productMake">
      <div class="je_pageDeco-top">
        <img src="product/imgFolder/product-up.png" alt="" />
      </div>
      <!-- title -->
      <div class="je_title-productMake">
        <div class="je_title-txt">テンプレート 制作</div>
        <div class="je_title-line">
          <img src="product/imgFolder/page_title.png" alt="" />
        </div>
      </div>
      <!-- content -->
      <div class="je_content-productMake">
        <!-- output -->
        <div class="je_template-output je_template-container">
          <div class="je_content-title">プレビュー</div>
          <div class="je_content-boxes je_content-template">
            <div class="je_template">
              <img
                style="width: 90%"
                class="je_template-background"
                src="product/imgFolder/${invitationAll.t_template }"
                alt=""
              />
              <div style="width: 100%">
                <div id="je_photoPre1">
                   <img alt="" src="product/imgFolder/${invitationAll.w_img1 }">
                </div>
                <div class="je_kanji-groom">
                  <div id="je_groom-kanjiL"></div>
                  &ensp;
                  <div id="je_groom-kanjiF"></div>
                </div>
                <div class="je_kanji-bride">
                  <div id="je_bride-kanjiL"></div>
                  &ensp;
                  <div id="je_bride-kanjiF"></div>
                </div>
                <div id="je_invite-message"></div>

                <div class="je_photos">
                  <div id="je_photoPre2">
                  	<img alt="" src="product/imgFolder/${invitationAll.w_img2 }">
                  </div>
                  <div id="je_photoPre3">
                  	<img alt="" src="product/imgFolder/${invitationAll.w_img3 }">
                  </div>
                </div>
                <!-- 시간.날짜 -->
                <div class="je_days">
	                <div id="je_weddingDay">${invitationAll.weddingDay }</div>
	                <div id="je_receptionDay">${invitationAll.weddingDay }</div>
                </div>

                <div class="je_eventTime">
                  <div id="je_mainEvent-time">${invitationAll.r_weddingTime }</div>
                  <div id="je_sideEvent-time">${invitationAll.r_receptionTime }</div>
                </div>
                <div class="je_assemleTime">
                  <div id="je_mainEvent-gatherTime">集合 ${invitationAll.r_weddingTime_assemble }</div>
                  <div id="je_sideEvent-gatherTime">集合 ${invitationAll.r_receptionTime_assemble }</div>
                </div>
                <div class="je_place">
                  <div class="je_mainPlace">
                    <div id="je_mainEvent-building"></div>
                    <div id="je_mainEvent-addr"></div>
                  </div>
                  <div class="je_sidePlace">
                    <div id="je_sideEvent-building"></div>
                    <div id="je_sideEvent-addr"></div>
                  </div>
                </div>
                <div id="je_photoPre4">
                <img alt="" src="product/imgFolder/${invitationAll.w_img4 }">
                </div>
                <div id="je_finish-message"></div>
              </div>
            </div>
          </div>
        </div>
        <!-- input -->
        <form action="InvitationUpdateC" method="post" enctype="multipart/form-data">
          <div class="je_template-input je_template-container">
            <div class="je_content-title">作成欄</div>
            <div class="je_content-boxes">
              <!-- box - 신랑신부 -->
              <div class="je_content-box">
                <div class="je_box-title"> 情報
                  <div class="je_box-bottom-line">
                    <img src="product/imgFolder/line_box-title.png" alt="" />
                  </div>
                </div>
                <div class="je_box-content">
                  <div class="je_host-info">
                    <div class="je_info-title"> 新郎 側
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">漢字</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="new_groomL" id="je_g-kanji1" value="${invitationAll.w_groomL }"
                           type="text" placeholder="姓" oninput="printName()"/>
                          <input name="new_groomF" id="je_g-kanji2" value="${invitationAll.w_groomF }"
                          type="text" placeholder="名" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">カタカナ</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="new_groomKanaL" id="je_g-kana1" value="${invitationAll.w_groom_kanaL }"
                          type="text" placeholder="せい" onkeyup="printName()"/>
                          <input name="new_groomKanaF" id="je_g-kana2" value="${invitationAll.w_groom_kanaF }"
                           type="text" placeholder="めい" onkeyup="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">ローマ字</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="new_groomRomaL" id="je_g-roma1" value="${invitationAll.w_groom_engL }" 
                           type="text" placeholder="Last Name" onkeyup="printName()"/>
                          <input name="new_groomRomaF" id="je_g-roma2" value="${invitationAll.w_groom_engF }"
                          type="text" placeholder="First Name" onkeyup="printName()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="je_host-info">
                    <div class="je_info-title">新婦 側
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">漢字</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="new_brideL" id="je_b-kanji1"  value="${invitationAll.w_brideL }"
                           type="text" placeholder="姓" oninput="printName()"/>
                          <input name="new_brideF"  id="je_b-kanji2"  value="${invitationAll.w_brideF }"
                          type="text" placeholder="名" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">カタカナ</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="new_brideKanaL" id="je_b-kana1" value="${invitationAll.w_bride_kanaL }"
                          type="text" placeholder="せい" oninput="printName()"/>
                          <input name="new_brideKanaF"  id="je_b-kana2" value="${invitationAll.w_bride_kanaF }"
                          type="text" placeholder="めい" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">ローマ字</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="new_brideRomaL" id="je_b-roma1" value="${invitationAll.w_bride_engL }"
                          type="text" placeholder="Last Name" oninput="printName()"/>
                          <input name="new_brideRomaF"  id="je_b-roma2" value="${invitationAll.w_bride_engF }"
                          type="text" placeholder="First Name" oninput="printName()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- box 식 날짜  -->
              <div class="je_content-box">
                <div class="je_box-title">日程情報
                  <div class="je_box-bottom-line">
                    <img src="product/imgFolder/line_box-title.png" alt="" />
                  </div>
                </div>
                <div class="je_box-title2">式の日程</div>
                <div class="je_box-calendar">
                  <input name="new_weddingDay" id="specialDate"
                    type="text" value="${invitationAll.weddingDay }" autocomplete="off" readonly
                    oninput="printInput()"/>
                </div>
                <div class="je_box-content">
                  <div class="je_host-info">
                    <div class="je_info-title">挙式
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">時間</div>
                        <div class="je_inputbox-input je_time_input">
                          <input name="new_marriageTime" id="timepickerM" class="timepicker"
                             type="text" value="${invitationAll.r_weddingTime }" name="event_time" readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">集合</div>
                        <div class="je_inputbox-input je_time_input">
                          <input name="new_marriageTime_a"  id="timepickerMa"  class="timepicker"
                            type="text" value="${invitationAll.r_weddingTime_assemble }" readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">建物名</div>
                        <div class="je_inputbox-input je_building-input">
                          <input name="new_marriage_place" id="je_main-building" value="${invitationAll.r_weddingPlace }"
                          type="text" oninput="printInfo()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">住所</div>
                        <div class="je_inputbox-input je_address-input">
                          <input name="new_marriage_addr" id="je_main-addr" value="${invitationAll.r_weddingAddr }" 
                          type="text" oninput="printInfo()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="je_host-info">
                    <div class="je_info-title">披露宴
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">時間</div>
                        <div class="je_inputbox-input je_time_input">
                          <input name="new_receptionTime" id="timepicker-r" class="timepicker"
                            type="text" value="${invitationAll.r_receptionTime }" autocomplete="off"readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">集合</div>
                        <div class="je_inputbox-input je_time_input">
                          <input name="new_receptionTime_a" id="timepicker-ra"  class="timepicker"
                           type="text" value="${invitationAll.r_receptionTime_assemble }" autocomplete="off"  readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">建物名</div>
                        <div class="je_inputbox-input je_building-input">
                          <input name="new_reception_place" id="je_side-building" value="${invitationAll.r_receptionPlace }"
                          type="text" oninput="printInfo()" />
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">住所</div>
                        <div class="je_inputbox-input je_address-input">
                          <input name="new_reception_addr" id="je_side-addr"  value="${invitationAll.r_receptionAddr }"
                          	type="text" oninput="printInfo()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- box - 메세지 및 사진 -->
              <div class="je_content-box">
                <div class="je_box-title">添付情報
                  <div class="je_box-bottom-line">
                    <img src="product/imgFolder/line_box-title.png" alt="" />
                  </div>
                </div>
                <!-- 메세지 설정 -->
                <div class="je_box-title2">メッセージ 添付</div>
                <div class="je_box-content">
                  <div class="je_host-info">
                    <div class="je_info-title">招待文句
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox">
                        <div class="je_inputbox-title">内容</div>
                        <div class="je_inputbox-input">
                          <textarea name="new_helloMessage" rows="6" cols="40" id="je_invite-m"
                            oninput="printInfo()">${invitationAll.w_message_invite }</textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="je_host-info">
                    <div class="je_info-title">仕上げの文句
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox">
                        <div class="je_inputbox-title">内容</div>
                        <div class="je_inputbox-input">
                          <textarea name="new_byeMessage" id="je_finish-m" rows="10" 
                          oninput="printInfo()">${invitationAll.w_message_bye }</textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 사진 첨부 -->
                <div class="je_box-title2">写真 添付</div>
                <div div class="je_box-content">
                  <div class="je_host-info je_photo-info">
                    <div class="je_info-content je_photo-content">
                      <div class="je_photo-inputbox">
                        <div class="je_inputbox-input">
                          <div id="je_photobox1" class="je_photobox">
                            <input type="file" name="new_photo1" id="je_photoInput1" 
                             onchange="readURL(this);"/>
                             <input name="oldPhoto1" value="${invitationAll.w_img1 }" type="hidden">
                            <div id="je_photoOut1">
                            	<img alt="" src="product/imgFolder/${invitationAll.w_img1 }">
                            </div>
                            <span>写真１</span>
                          </div>
                          <div id="je_photobox2" class="je_photobox">
                            <input type="file" name="new_photo2" id="je_photoInput2" 
                             onchange="readURL(this);"/>
                             <input name="oldPhoto2" value="${invitationAll.w_img2 }" type="hidden">
                            <div id="je_photoOut2">
                            	<img alt="" src="product/imgFolder/${invitationAll.w_img2 }">
                            </div>
                            <span>写真２</span>
                          </div>
                          <div id="je_photobox3" class="je_photobox">
                            <input type="file" name="new_photo3" id="je_photoInput3" 
                             onchange="readURL(this);"/>
                             <input name="oldPhoto3" value="${invitationAll.w_img3 }" type="hidden">
                            <div id="je_photoOut3">
                            	<img alt="" src="product/imgFolder/${invitationAll.w_img3 }">
                            </div>
                            <span>写真３</span>
                          </div>
                          <div id="je_photobox4" class="je_photobox">
                            <input type="file" name="new_photo4" id="je_photoInput4" 
                             onchange="readURL(this);"/>
                             <input name="oldPhoto4" value="${invitationAll.w_img4 }" type="hidden">
                            <div id="je_photoOut4">
                            	<img alt="" src="product/imgFolder/${invitationAll.w_img4 }">
                            </div>
                            <span>写真4</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="je_finish-button"><button name="eno" value="${invitationAll.e_no }">修 正</button></div>
            </div>
          </div>
        </form>
      </div>
    </div>
     <div class="je_pageDeco-bottom">
      <img src="product/imgFolder/product-down.png" alt="" />
    </div>
<!--     <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> -->
	<script src="product/js/datepicker.js"></script>
    <script src="product/js/productMakeFile.js"></script>
  </body>
</html>

