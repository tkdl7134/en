<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="myPage/statistics/css/receivedFund.css" />
  	<script defer="defer" type="text/javascript" src="myPage/statistics/js/receivedFunding.js"></script>
  	 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  </head>
  <!-- 상품이름이랑 그 상품 이미지 나오는 span태그랑 이미지 태그에 각각 텍스트랑 이미지 소스를 변수화해서 쓸것  -->
  <body>
    <div class="recFund-container">
      <div class="recFund-title">펀딩 현황 (임시 이름)</div>
      <div class="recFund-content">
        <div class="recFund-contents" >
          <span id="first-product-name">冷蔵庫</span
          ><img
          	onclick="showInfo()"
            class="fund-products"
            id="fund-product1"
            alt=""
            src="myPage/statistics/imgFolder/fundProduct1.png"
          />
          <img onclick="showInfo()" id="product-type1" alt="" src="myPage/statistics/imgFolder/product-fridge.png">
        </div>
        <div class="recFund-contents"><span id="second-product-name">冷蔵庫</span
          >
          <img 
          onclick="showInfo()"
            class="fund-products"
            id="fund-product2"
            alt=""
            src="myPage/statistics/imgFolder/fundProduct2.png"
          />
          <img onclick="showInfo()" id="product-type2" alt="" src="myPage/statistics/imgFolder/product-fridge.png">
        </div>
        <div class="recFund-contents">
         <span id="third-product-name">冷蔵庫</span>
          <img
          onclick="showInfo()"
            class="fund-products"
            id="fund-product3"
            alt=""
            src="myPage/statistics/imgFolder/fundProduct3.png"
          />
          <img onclick="showInfo()" id="product-type3" alt="" src="myPage/statistics/imgFolder/product-fridge.png">
        </div>
        <div class="recFund-contents">
         <span id="fourth-product-name">冷蔵庫</span>
          <img
          onclick="showInfo()"
            class="fund-products"
            id="fund-product4"
            alt=""
            src="myPage/statistics/imgFolder/fundProduct4.png"
          />
          <img onclick="showInfo()" id="product-type4" alt="" src="myPage/statistics/imgFolder/product-fridge.png">
        </div>
        <div class="recFund-contents">
            <span id="fifth-product-name">冷蔵庫</span>
          <img
          onclick="showInfo()"
            class="fund-products"
            id="fund-product5"
            alt=""
            src="myPage/statistics/imgFolder/fundProduct5.png"
          />
          <img onclick="showInfo()" id="product-type5" alt="" src="myPage/statistics/imgFolder/product-fridge.png">
        </div>
      </div>
      <div id="recFund-info">
      <img id="info-page" alt="" src="myPage/statistics/imgFolder/fundContentReal.png">
     <div style="position: relative; left: 3rem; bottom: 45rem;">
       <form id="dateForm">
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate">
        <br>
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate">
        <br>
        <button type="button" onclick="generateGraph()">Generate Graph</button>
    </form>
    <div class="chart-container">
        <canvas id="dateChart"></canvas>
    </div>
      </div>
      <div id="current-info">현재 @ % 진행 되었고, 남은 목표 금액은 $$$$ Y 입니다.</div>
      <div></div>
      
      
      <div><button id="return-button" onclick="hideInfo()">접기</button></div>
      </div>
    </div>
   
  </body>
</html>
