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
<div>
 <div class="recMain-toFund" onclick="location.href='receivedFundingController'">
	<div>펀딩 현황 확인</div>
	<div><img alt="a" src="myPage/statistics/imgFolder/fundingImg.png"></div>
 </div>
	<div class="recMain-toAmazon" onclick="location.href='아마존위시리스트페이지'">
	<div>선물 현황 확인</div>
	<div><img alt="b" src="myPage/statistics/imgFolder/presentImg.png"></div>
	</div>
	<div class="recMain-toMoney" onclick="location.href='receivedMoneyController'">
	<div>송금 현황 확인</div>
	<div><img alt="c" src="myPage/statistics/imgFolder/moneyImg.png"></div>
	</div>
	 </div>
	</div>
</body>
</html>