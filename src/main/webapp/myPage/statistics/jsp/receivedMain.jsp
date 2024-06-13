<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myPage/statistics/css/receivedMain.css">
<script type="text/javascript" src="myPage/statistics/js/receivedMain.js"></script>
</head>
<body>
	<div class="recMain-container">
	  <div class="recMain-title">받은것 확인 (임시 이름)</div>
<div class="recMain-toPages">
 <div class="recMain-toFund" onclick="location.href='receivedFundingController'">
	<div class="recMain-subtitle">펀딩 현황 확인</div>
	<div><img class="recMainImgs" alt="a" src="myPage/statistics/imgFolder/fundingImg.png"></div>
 </div>
<div class="recMain-toAmazon" onclick="window.open('https://www.amazon.com/hz/wishlist/intro', '_blank')">	<div class="recMain-subtitle">선물 현황 확인</div>
	<div><img class="recMainImgs" alt="b" src="myPage/statistics/imgFolder/presentImg.png"></div>
	</div>
	<div class="recMain-toMoney" onclick="location.href='receivedMoneyController'">
	<div class="recMain-subtitle">송금 현황 확인</div>
	<div><img class="recMainImgs" alt="c" src="myPage/statistics/imgFolder/moneyImg.png"></div>
	</div>
</div>
	</div>
</body>
</html>