<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/furin.css" />
    <script src="js/index.js" defer></script>
    <title>縁結び</title>
  </head>
  <body>
    <div class="kh-f-whole-container">
      <div class="kh-f-popup">
        <div class="kh-f-product-box">
          <div class="kh-f-img-box">
            <img alt="" src="img/refrigerator.png" style="width: 100%" />
          </div>
          <div class="kh-f-product-des">
            <h2>商品</h2>
            <div>金額</div>
            <div>コメント</div>
          </div>
          <div class="kh-f-product-des">
            <h2>:　冷蔵庫</h2>
            <div>:　100,000</div>
            <div>:　これ必要です</div>
          </div>
        </div>
        <div class="kh-f-des">
          ファンディングする金額を<br />入力してください。
        </div>
        <div style="font-size: 2rem">
          <input
            class="kh-f-input"
            type="number"
            maxlength="8"
            oninput="numberMaxLength(this)"
          />円
        </div>
        <div class="kh-f-btn">
        </div>
      </div>

      <div class="kh-f-container">
        <div class="kh-f-content">
          <div class="kh-f-left-fade"></div>
          <div class="kh-head"><h1>ファンディング</h1></div>
          <div class="kh-f-card-container">
            <div class="kh-fake-card"></div>
            <div class="kh-fund-card">
              <div><img alt="noImg" src="img/refrigerator.png" /></div>
              <div><h3>冷蔵庫</h3></div>
            </div>
            <div class="kh-fund-card">
              <div><img alt="noImg" src="img/refrigerator.png" /></div>
              <div><h3>冷蔵庫</h3></div>
            </div>
            <div class="kh-fund-card">
              <div><img alt="noImg" src="img/refrigerator.png" /></div>
              <div><h3>冷蔵庫</h3></div>
            </div>
            <div class="kh-fund-card">
              <div><img alt="noImg" src="img/refrigerator.png" /></div>
              <div><h3>冷蔵庫</h3></div>
            </div>
            <div class="kh-fund-card">
              <div><img alt="noImg" src="img/refrigerator.png" /></div>
              <div><h3>冷蔵庫</h3></div>
            </div>
            <div class="kh-fund-card">
              <div><img alt="noImg" src="img/refrigerator.png" /></div>
              <div><h3>冷蔵庫</h3></div>
            </div>
            <div class="kh-fund-card">
              <div><img alt="noImg" src="img/refrigerator.png" /></div>
              <div><h3>冷蔵庫</h3></div>
            </div>
            <div class="kh-fake-card"></div>
          </div>
          <div class="kh-f-right-fade"></div>
        </div>
      </div>
      <aside class="kh-aside">
        <div style="width: 100%">
          <img src="img/furin.png" alt="noImg" class="kh-furin" />
        </div>
      </aside>
    </div>
  </body>
</html>
