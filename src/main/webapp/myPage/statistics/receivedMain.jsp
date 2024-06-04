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
	<div class="recMain-toFund" onclick="location.href='receivedFundingController'">펀딩 현황 확인</div>
	<div class="recMain-toAmazon" onclick="location.href='아마존위시리스트페이지'">선물 현황 확인</div>
	<div class="recMain-toMoney" onclick="location.href='receivedMoneyController'">송금 현황 확인</div>
	 </div>
	</div>
</body>
</html>