<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="myPage/statistics/css/receivedFund.css" />
    <link rel="stylesheet" href="finance/css/fund.css" />
  	<script defer="defer" type="text/javascript" src="myPage/statistics/js/receivedFunding.js"></script>
  	 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  </head>
  <!-- 상품이름이랑 그 상품 이미지 나오는 span태그랑 이미지 태그에 각각 텍스트랑 이미지 소스를 변수화해서 쓸것  -->
  <body>
   
   <div class="recFund-container">
   <div>
   <img id="fundBack-img" alt="" src="myPage/statistics/imgFolder/fundBackground-withoutTitle.png">
   </div>
   <div class="recFund-title">ファンディング の現状</div>
   <div style="position : relative; bottom : 42rem;" class="kh-f-card-container">
	<input type="hidden" id="jlist" value='${jsonList}'>
	<div class="kh-f-mousemove kh-f-none">
		<img alt="" src="finance/img/dragbtn.png">
	</div>
	<div class="kh-f-card-fake"></div>
	<c:forEach items="${list }" var="l" varStatus="vs" begin="0">
		<div class="kh-f-card-out">
			<div onclick="location.href='receivedSpecificFundingC'" class="kh-fund-card" value="${vs.index}">
				<div>
					<img class="fundProduct-img" alt="noImg" src="myPage/statistics/imgFolder/${l.wl_product }.png"  onerror="this.onerror=null; this.src='myPage/statistics/imgFolder/else.png'"/>
				</div>
				<div>
					<h3>${l.wl_product }</h3>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="kh-f-card-fake"></div>
</div>
 </div>  
   
  </body>
</html>
