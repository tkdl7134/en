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
		<div class="yj-main-s2-logo" ><img class="yj-main-s2-logo img " alt="" src="myPage/statistics/imgFolder/mainbutton.png"></div>
		<div class="yj-main-s2-menu"><img class="yj-main-s2-menu img " alt="" src="myPage/statistics/imgFolder/navi.png"></div>
	<div id="recMain-title">心からのお伝え</div>
	<div id="recMain-header"><img id="header-img" alt="" src="myPage/statistics/imgFolder/footer.png"></div>
	<div  style="display : flex; margin-top : 8rem; " id="toGoTexts">
	<div onclick="location.href='MemberDetailC'" style="margin-right: 4rem;width: 10rem;margin-top: 0.3rem; " class="ToGoTexts">✿ 会員情報 ✿</div>
	<div onclick="location.href='mytemplateController'" style="color : #ff2828;margin-left: 0.7rem;	" class="ToGoTexts">✿テンプレート管理 ✿</div>
	<div  onclick="location.href='MyMeetingC'" style="margin-left: 7rem;" class="ToGoTexts">✿ 会リスト ✿</div>
	</div>
	<div style="display: flex; " id="toGoLines">
	<div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div>
	</div>
	<div id="recMain-content">
		<div onclick="location.href='receivedFundingController?eno=${eno}'" class="box-img">
		<div class="texts">
		<div class="objective">フンディンぐ</div>
		<div class="genjyou">の現状</div>
		</div>
		<img class="lines" alt="" src="myPage/statistics/imgFolder/line_funding.png">
		</div>
		<div onclick="location.href='${amazon}'" class="box-img">
		<div class="texts">
		<div style="margin-left: 4rem;" class="objective">プレゼント</div>
		<div class="genjyou">の現状</div>
		</div>
		<img class="lines"  alt="" src="myPage/statistics/imgFolder/line_present.png">
		</div>
		<div onclick="location.href='receivedMoneyController?eno=1'" class="box-img">
		<div class="texts">
		<div style="margin-left: 3.5rem;" class="objective">ご祝儀</div>
		<div style="" class="genjyou">の現状</div>
		</div>
		<img class="lines"  alt="" src="myPage/statistics/imgFolder/line_money.png">
		</div>
	
	</div>
	
	
	</div>

</body>
</html>