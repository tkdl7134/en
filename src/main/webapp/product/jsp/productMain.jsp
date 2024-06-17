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
    <!-- 로고 / 네비 -->
    <div id="enmusubi-logo"><img src="./img/Logo.png" alt="" /></div>
    <div id="enmusubi-nav">
      <img src="./img/menu_btn_1.png" alt="" />
    </div>
    <!-- 상품소개 page -->
    <div id="je_container-product">
      <div class="je_pageDeco-top">
        <img src="./img/product-combine.png" alt="" />
      </div>
      <div class="je_title-product">
        <div class="je_title-txt">テンプレート一覧</div>
        <div class="je_title-line">
          <img src="./img/page-title-Line.png" alt="" />
        </div>
      </div>
      <div class="je_content-product">
        <div class="je_products">
        
         <c:forEach items="${products }" var="p">
<form action="ProductMakeController">
<div class="je_productBox">
        <div class="je_productBox-details">
          <div class="je_detail-img">
            <img src="product/imgFolder/${p.t_preview }" alt="" />
          </div>
          <div class="je_detail-title">${p.t_name }</div>
          <div class="je_detail-buttons">
            <button class="je_preview-button" data-target="#layer" data-example="${p.t_example }" type="button">
              見本</button
            ><button class="je_make-button" name="templatePK" value="${p.t_pk }">制作</button>
          </div>
        </div>
      </div>
</form>
</c:forEach>
        </div>
      <!-- change -->
      <div class="je_dim-layer">
        <div class="je_dimBg"></div>
        <div id="je_layer" class="je_pop-layer">
          <div class="je_pop-container">
            <div class="je_pop-conts">
              <!-- content //-->
              <div class="je_pop-image">
                <img src="./img/wedding-template.jpg" alt="" />
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
      <!-- change -->
    </div>
  </body>
</html>
