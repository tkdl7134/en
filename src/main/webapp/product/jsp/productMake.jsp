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
                src="product/imgFolder/make-template.png"
                alt=""
              />
              <div style="width: 100%">
                <div id="je_photoPre1"></div>
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
                  <div id="je_photoPre2"></div>
                  <div id="je_photoPre3"></div>
                </div>
                <!-- 시간.날짜 -->
                <div id="je_weddingDay"></div>

                <div class="je_eventTime">
                  <div id="je_mainEvent-time"></div>
                  <div id="je_sideEvent-time"></div>
                </div>
                <div class="je_assemleTime">
                  <div id="je_mainEvent-gatherTime"></div>
                  <div id="je_sideEvent-gatherTime"></div>
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
                <div id="je_photoPre4"></div>
                <div id="je_finish-message"></div>
              </div>
            </div>
          </div>
        </div>
        <!-- input -->
        <form action="InvitationC">
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
                          <input name="groomKanjiL" id="je_g-kanji1" 
                           type="text" placeholder="姓" oninput="printName()"/>
                          <input name="groomKanjiF" id="je_g-kanji2"
                          type="text" placeholder="名" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">カタカナ</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="groomKananL" id="je_g-kana1" 
                          type="text" placeholder="せい" onkeyup="printName()"/>
                          <input name="groomKanaF" id="je_g-kana2"
                           type="text" placeholder="めい" onkeyup="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">ローマ字</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="groomRomaL" id="je_g-roma1" 
                           type="text" placeholder="Last Name" onkeyup="printName()"/>
                          <input name="groomRomaF" id="je_g-roma2"
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
                          <input name="brideKanjiL" id="je_b-kanji1"
                           type="text" placeholder="姓" oninput="printName()"/>
                          <input name="brideKanjiF"  id="je_b-kanji2"
                          type="text" placeholder="名" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">カタカナ</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="brideKanaL" id="je_b-kana1"
                          type="text" placeholder="せい" oninput="printName()"/>
                          <input name="brideKanaF"  id="je_b-kana2"
                          type="text" placeholder="めい" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">ローマ字</div>
                        <div class="je_inputbox-input je_inputBox-name">
                          <input name="brideRomaL" id="je_b-roma1"
                          type="text" placeholder="Last Name" oninput="printName()"/>
                          <input name="brideRomaF"  id="je_b-roma2"
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
                  <input name="weddingDay" id="specialDate"
                    type="text" placeholder="日付を選んでください" autocomplete="off" readonly
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
                          <input name="marriageTime" id="timepickerM" class="timepicker"
                             type="text" placeholder="時間選択"name="event_time" readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">集合</div>
                        <div class="je_inputbox-input je_time_input">
                          <input name="marriageTime_a"  id="timepickerMa"  class="timepicker"
                            type="text" placeholder="時間選択" readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">建物名</div>
                        <div class="je_inputbox-input je_building-input">
                          <input name="marriage_place" id="je_main-building" 
                          type="text" oninput="printInfo()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">住所</div>
                        <div class="je_inputbox-input je_address-input">
                          <input name="marriage_addr" id="je_main-addr"  
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
                          <input name="receptionTime" id="timepicker-r" class="timepicker"
                            type="text" placeholder="時間選択" autocomplete="off"readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">集合</div>
                        <div class="je_inputbox-input je_time_input">
                          <input name="receptionTime_a" id="timepicker-ra"  class="timepicker"
                           type="text" placeholder="時間選択" autocomplete="off"  readonly/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">建物名</div>
                        <div class="je_inputbox-input je_building-input">
                          <input name="reception_place" id="je_side-building" 
                          type="text" oninput="printInfo()" />
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">住所</div>
                        <div class="je_inputbox-input je_address-input">
                          <input name="reception_addr"id="je_side-addr" 
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
                          <textarea name="helloMessage" rows="10" id="je_invite-m"
                            oninput="printInfo()"></textarea>
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
                          <textarea name="byeMessage" id="je_finish-m" rows="10" 
                          oninput="printInfo()"></textarea>
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
                            <input type="file" name="photo1" id="je_photoInput1" onchange="readURL(this);"/>
                            <div id="je_photoOut1"></div>
                            <span>写真１</span>
                          </div>
                          <div id="je_photobox2" class="je_photobox">
                            <input type="file" name="photo2" id="je_photoInput2" onchange="readURL(this);"/>
                            <div id="je_photoOut2"></div>
                            <span>写真２</span>
                          </div>
                          <div id="je_photobox3" class="je_photobox">
                            <input type="file" name="photo3" id="je_photoInput3" onchange="readURL(this);"/>
                            <div id="je_photoOut3"></div>
                            <span>写真３</span>
                          </div>
                          <div id="je_photobox4" class="je_photobox">
                            <input
                              type="file" name="photo4" id="je_photoInput4" onchange="readURL(this);"/>
                            <div id="je_photoOut4"></div>
                            <span>写真4</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="je_finish-button"><button name="templatePK" value="78">作成完了</button></div>
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

