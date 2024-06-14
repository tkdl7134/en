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
<div id="je_container-product">
      <div class="je_page-deco">
      <img src="product/imgFolder/product-combine.png" alt="" />
    </div>
      <div class="je_product-page">
      <div class="je_product-page-title">
        <div class="je_page-title">テンプレート一覧</div>
        <div class="je_page-title-line">
          <img src="product/imgFolder/pageTop_line.png" alt="" />
        </div>
        </div>
        <div class="je_product-page-content">
            <div class="je_page-content">
   <c:forEach items="${products }" var="p">
   <form action="ProductMakeController">
              <div class="je_page-content-template">
                <div class="je_template-img">
                  <img src="${p.t_preview }" alt="" />
                  <div>
                    <div class="je_template-img-line-red-big"></div>
                    <div class="je_template-img-line-red-small"></div>
                  </div>
                </div>
                <div class="je_template-title">${p.t_name }</div>
                <div class="je_template-button">
                  <button class="je_preview" data-target="#layer2" data-example="${p.t_example }" type="button">見本</button>
                  <button name="templatePK" value="${p.t_pk }">制作</button>
                </div>
              </div>
    </form>
    </c:forEach>
<!-- 	<div style="height: 100rem"></div> -->
            </div>
          </div>
        </div>
    <!--popUp-->
          <div class="je_dim-layer">
        <div class="je_dimBg"></div>
        <div id="je_layer" class="je_pop-layer">
          <div class="je_pop-container">
            <div class="je_pop-conts">
              <!-- content //-->
              <div class="je_pop-image">
                <img src="${p.t_example }" alt="" />
              </div>
              <!-- db에 저장되어있는 template-img READ -->
              <img src="" alt="" />
              <div class="je_btn-r">
                <a href="#" class="je_btn-layerClose">close</a>
              </div>
            </div>
          </div>
        </div>
      </div>
</div>

  </body>
</html>
