<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ファンディングの現状</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="myPage/statistics/css/receivedMain.css">
<script type="text/javascript" src="myPage/statistics/js/receivedMain.js"></script>
</head>
<body>

	<div class="recMain-container"> 
	<div class="yj-main-logo">
			<a href="#" class="mainLogo"><img
				src="main/imgFolder/yj-main-logo.png" alt="섹션2 로고" /></a>
	</div>
	<jsp:include page="${mainNav }" />
	
	<jsp:include page="${settingPage }"></jsp:include>
	<div id="recMain-title">心からのお伝え</div>
	<div class="hs_mypage-menus">
				<div class="hs_btn-container">
					<a href="MemberDetailC" class="hs_btn">✿ 会員情報 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				<div class="hs_btn-container">
					<a href="mytemplateController" class="hs_btn me">✿ テンプレート管理 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				
				<div class="hs_btn-container">
					<a href="MyMeetingC" class="hs_btn ">✿ 会リスト ✿</a> <img class="yellow_line"
						alt="" src="loginPage/ImgFolder/yellow_line.png">
				</div>
			</div>
	<div id="recMain-content">
		<div onclick="location.href='receivedFundingController?eno=${eno}'" class="box-img">
		<div class="texts">
		<div class="objective">ファンディング</div>
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
		<div onclick="location.href='receivedMoneyController?eno=${eno}'" class="box-img">
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