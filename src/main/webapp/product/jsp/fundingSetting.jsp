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
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./funding.css" />
    <script src="./funding.js"></script>
  </head>
  <body>
    <!-- 로고 / 네비 -->
    <div id="enmusubi-logo"><img src="./img/Logo.png" alt="" /></div>
    <div id="enmusubi-nav">
      <img src="./img/menu_btn_1.png" alt="" />
    </div>
    <!-- 펀딩설정 page -->
    <div id="je_container-fundingSet">
      <div class="je_pageDeco-top">
        <img src="./img/fundingSet-top.png" alt="" />
      </div>
      <div class="je_title-fundingSet">ファンディング 管理</div>
      <div class="je_content-fundingSet">
        <div class="je_default-funding">
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-sofa.png" alt="" />
              </div>
              <div class="je_detail-title">ソファー</div>
              <div class="je_detail-input">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-refrigerator.png" alt="" />
              </div>
              <div class="je_detail-title">冷蔵庫</div>
              <div class="je_detail-input">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-washing.png" alt="" />
              </div>
              <div class="je_detail-title">洗濯機</div>
              <div class="je_detail-input">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-televison.png" alt="" />
              </div>
              <div class="je_detail-title">テレビジョン</div>
              <div class="je_detail-input">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-desk.png" alt="" />
              </div>
              <div class="je_detail-title">机</div>
              <div class="je_detail-input">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-bed.png" alt="" />
              </div>
              <div class="je_detail-title">ベット</div>
              <div class="je_detail-input">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-table.png" alt="" />
              </div>
              <div class="je_detail-title">テーブル</div>
              <div class="je_detail-input">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="./img/funding-more.png" alt="" />
              </div>
              <div class="je_detail-inputName">
                <input type="text" placeholder="アイテム" />
              </div>
              <div class="je_detail-input je_input-price">
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
        </div>
        <div class="je_addition-funding">
          <div id="je_copyBox" class="je_fundingBox">
            <div class="je_copyBox-default je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_copyDefault-button">
                <button id="je_copyButton" onclick="copyDiv(this)">+</button>
              </div>
              <div id="je_copyDefault-txt">追加</div>
            </div>
          </div>
        </div>
      </div>
      <div class="je_top-button">
        <div class="je_top-button-img">
          <img src="./img/top_button.png" alt="" />
        </div>
        <div class="je_back-button"><a href="">戻る</a></div>
      </div>
      <div class="je_pageDeco-bottom">
        <img src="./img/fundingSet-under.png" alt="" />
      </div>
    </div>
  </body>
</html>
