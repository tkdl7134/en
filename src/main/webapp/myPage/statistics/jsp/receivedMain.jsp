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
		<div class="spaces" ><img id="mainbutton" alt="" src="myPage/statistics/imgFolder/mainbutton.png"></div>
		<div class="spaces"><img id="navi" alt="" src="myPage/statistics/imgFolder/navi.png"></div>
	<div id="recMain-title">心からのお伝え</div>
	<div id="recMain-header"><img id="header-img" alt="" src="myPage/statistics/imgFolder/footer.png"></div>
	<div id="recMain-content">
		<div onclick="location.href='receivedFundingController'" class="box-img">
		<img class="boxes" alt="" src="myPage/statistics/imgFolder/opt_pink.png">
		<div class="texts">
		<div class="objective">フンディンぐ</div>
		<div class="genjyou">の現状</div>
		</div>
		<img class="lines" alt="" src="myPage/statistics/imgFolder/line_funding.png">
		</div>
		<div onclick="goToAmazon()" class="box-img">
		<img class="boxes" alt="" src="myPage/statistics/imgFolder/opt_yellow.png">
		<div class="texts">
		<div style="margin-left: 1.3rem;" class="objective">プレゼント</div>
		<div class="genjyou">の現状</div>
		</div>
		<img class="lines"  alt="" src="myPage/statistics/imgFolder/line_present.png">
		</div>
		<div onclick="location.href='receivedMoneyController'" class="box-img">
		<img class="boxes" alt="" src="myPage/statistics/imgFolder/opt_red_line.png">
		<div class="texts">
		<div style="margin-left: 2rem;" class="objective">ご祝儀</div>
		<div style="margin-left: 2rem;" class="genjyou">の現状</div>
		</div>
		<img class="lines"  alt="" src="myPage/statistics/imgFolder/line_money.png">
		</div>
	
	</div>
	
	
	</div>
	
</body>
</html>