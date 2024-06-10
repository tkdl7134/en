<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="product/css/productMain.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="product/js/productMain.js"></script>
</head>
<body>
      <div id="container-product">
        <div class="product-page">
          <div class="product-page-title">
            <div class="page-title">テンプレート一覧</div>
            <div class="page-title-line">
              <img src="product/imgFolder/footer.png" alt="" />
            </div>
          </div>
          <div class="product-page-content">
            <div class="page-content">
            <c:forEach items="${products }" var="p">
              <div class="page-content-template">
                <div class="template-img">
                  <img src="${p.t_preview }" alt="" />
                  <div>
                    <div class="template-img-line-red-big"></div>
                    <div class="template-img-line-red-small"></div>
                  </div>
                </div>
                <div class="template-title">${p.t_name }</div>
                <div class="template-button">
                  <button class="preview" data-target="#layer2">見本</button>
                  <button>制作</button>
                </div>
              </div>
             </c:forEach>
            </div>
          </div>
        </div>
      </div>
      
    <!--popUp-->
    <div class="dim-layer">
      <div class="dimBg"></div>
      <div id="layer" class="pop-layer">
        <div class="pop-container">
          <div class="pop-conts">
            <!-- content //-->
            <!-- db에 저장되어있는 template-img READ -->
            <img src="" alt="" />
            <div class="btn-r">
              <a href="#" class="btn-layerClose">close</a>
            </div>
            <!--// content-->
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
