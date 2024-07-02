<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    <link rel="stylesheet" href="product/css/fundingSetting.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="product/js/fundingSetting.js"></script>
    <script src="product/js/fundingSetting_db.js"></script>
    <script src="product/js/fundingSettingChk.js" defer></script>
    <script src="product/js/validChk.js" defer></script>
  </head>
  <body>
    <!-- 펀딩설정 page -->
    <div id="je_container-fundingSet">
      <div class="je_pageDeco-top">
        <img src="product/imgFolder/fundingSet-top.png" alt="" />
      </div>
      <div class="horizontal-container-title">
			<h1 class="hs_heading">ファンディング管理</h1>
		</div>
      <div class="je_content-fundingSet">
        <div class="je_default-funding">

          <!-- update / delete -->
          <c:forEach items="${fundings }" var="f">
          <form class="fundingUpdateForm" >
            <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img je_table-img">
                <img class="je_fundingSetImg" data-product-name="${f.wl_product }" src="product/imgFolder/funding-table.png" alt="" />
              </div>
              <div class="je_detail-title je_table-img">${f.wl_product }</div>
              <div class="je_detail-input">
                <input type="number" name ="wl_up_price" placeholder="${f.wl_price } 円"/>
                <input type="hidden" name ="wl_no" value="${f.wl_no }" />
              </div>
              <div class="je_detail-buttons">
              <div class="je_detail-button"><button type="submit">修正</button></div>
              <div class="je_detail-button"><button onclick="deleteFunding('${f.wl_no }')" type="button" name="wl_no"  value="${f.wl_no })">削除</button></div>
              </div>
            </div>
          </div>
         </form>
         </c:forEach>
         
         <!-- insert -->
          <c:forEach items="${basicNames }" var="b">
         <form class="fundingRegForm">
     <input type="hidden" name="eno" value="${je_eventNo }">
            <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img je_table-img">
                <img class="je_fundingSetImg" data-product-name="${b}" src="product/imgFolder/funding-more.png" alt="" />
              </div>
              <div class="je_detail-title je_table-img">${b }</div>
              <input type="hidden" name="product_name" value="${b }">
              <div class="je_detail-input">
                <input type="number" placeholder="円" name="product_price" id="basic_funding_price"/>
              </div>
              <div class="je_detail-button je_reg-button"><button type="submit">登録</button></div>
            </div>
          </div>
          </form>
         </c:forEach>
         
         <!-- insert -->
         <form class="fundingRegForm">
      <input type="hidden" name="eno" value="${je_eventNo }">
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="product/imgFolder/funding-more.png" alt="" />
              </div>
              <div class="je_detail-inputName">
                <input type="text" placeholder="アイテム" name="product_name" />
              </div>
              <div class="je_detail-input je_input-price">
                <input id="je_new-funding-price" type="number" placeholder="円" name="product_price" />
              </div>
              <div class="je_detail-button"><button type="submit">登録</button></div>
            </div>
          </div>
          </form>
   
        </div>
        
    <!--     <div class="je_addition-funding">
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
        </div> -->
        
      </div>
      <div class="je_top-button">
        <div class="je_top-button-img" id="topBtn" >
          <img src="product/imgFolder/top_button.png" alt="" />
        </div>
      <!--   <div class="je_back-button"><a href="">戻る</a></div> -->
      </div>
      <div class="je_pageDeco-bottom">
        <img src="product/imgFolder/fundingSet-bottom.png" alt="" />
      </div>
    </div>
  </body>
</html>
