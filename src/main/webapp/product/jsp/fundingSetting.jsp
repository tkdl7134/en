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
  </head>
  <body>
   <!-- 로고 / 네비 -->
	<div id="yj-main-s2-logo">
	  <img src="product/imgFolder/Logo.png" alt="" />
	</div>
	<div id="yj-main-s2-menu">
	  <img src="product/imgFolder/menu_btn_1.png" alt="" />
	</div>
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
     <%-- 
       <form id="funding_sofa" action="">
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="product/imgFolder/funding-sofa.png" alt="" />
              </div>
              <div class="je_detail-title" id="wl_name" value="ソファー">ソファー</div>
              <div class="je_detail-input">
                ${fundings[0].wl_price }
                <input id="wl_price" name="wl_price " type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button id="eno" value="${fundings[0].e_no}">登録</button></div>
            </div>
          </div>
       </form> 
         
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="product/imgFolder/funding-refrigerator.png" alt="" />
              </div>
              <div class="je_detail-title">冷蔵庫</div>
              <div class="je_detail-input">
              ${fundings[1].wl_price }
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img  je_washing-img">
                <img src="product/imgFolder/funding-washing.png" alt="" />
              </div>
              <div class="je_detail-title">洗濯機</div>
              <div class="je_detail-input">
              ${fundings[2].wl_price }
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img je_tv-img">
                <img src="product/imgFolder/funding-televison.png" alt="" />
              </div>
              <div class="je_detail-title">テレビジョン</div>
              <div class="je_detail-input">
              ${fundings[3].wl_price }
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
                <img src="product/imgFolder/funding-desk.png" alt="" />
              </div>
              <div class="je_detail-title">机</div>
              <div class="je_detail-input">
              ${fundings[4].wl_price }
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img je_bed-img">
                <img src="product/imgFolder/funding-bed.png" alt="" />
              </div>
              <div class="je_detail-title">ベット</div>
              <div class="je_detail-input">
              ${fundings[5].wl_price }
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div>
          
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img je_table-img">
                <img src="product/imgFolder/funding-table.png" alt="" />
              </div>
              <div class="je_detail-title je_table-img">テーブル</div>
              <div class="je_detail-input">
              ${fundings[6].wl_price }
                <input type="text" placeholder="円" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
            </div>
          </div> --%>

          <!-- update / delete -->
          <c:forEach items="${fundings }" var="f">
          <form class="fundingUpdateForm">
            <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img je_table-img">
                <img src="product/imgFolder/funding-table.png" alt="" />
              </div>
              <div class="je_detail-title je_table-img">${f.wl_product }</div>
              <div class="je_detail-input">
                <input type="text" name ="wl_up_price" placeholder="${f.wl_price } 円" />
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
         <form class="fundignRegForm">
            <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img je_table-img">
                <img src="product/imgFolder/funding-table.png" alt="" />
              </div>
              <div class="je_detail-title je_table-img">${b }</div>
              <input type="hidden" name="product_name" value="${b }">
              <div class="je_detail-input">
                <input type="text" placeholder="円" name="product_price"/>
              </div>
              <div class="je_detail-button je_reg-button"><button type="submit">登録</button></div>
            </div>
          </div>
          </form>
         </c:forEach>
         
         <!-- insert -->
         <form class="fundignRegForm">
          <div class="je_fundingBox">
            <div class="je_fundingBox-details">
              <div class="je_fundingBox-redlineL"></div>
              <div class="je_fundingBox-redlineS"></div>
              <div class="je_detail-img">
                <img src="product/imgFolder/funding-more.png" alt="" />
              </div>
              <div class="je_detail-inputName">
                <input type="text" placeholder="アイテム" name="product_name"/>
              </div>
              <div class="je_detail-input je_input-price">
                <input type="text" placeholder="円" name="product_price" />
              </div>
              <div class="je_detail-button"><button>登録</button></div>
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
