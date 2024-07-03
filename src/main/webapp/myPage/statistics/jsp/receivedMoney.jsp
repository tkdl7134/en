<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ファンディングの現状</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="myPage/statistics/css/receivedMoney.css" />
<link rel="stylesheet" href="finance/css/fund.css" />
<link rel="stylesheet" href="product/index.css" />
<script defer="defer" type="text/javascript"
	src="product/index.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script defer="defer" type="text/javascript"
	src="myPage/statistics/js/receivedMoney.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
/* 클리핑 컨테이너의 CSS */
.clip-container {
	overflow: hidden;
	position: relative;
	bottom: 42rem;
	width: 67rem;
	left: 15rem;
}
</style>
</head>
<body>
	<div class="recFund-container">
<div class="yj-main-logo">
			<a href="#" class="mainLogo"><img
				src="main/imgFolder/yj-main-logo.png" alt="섹션2 로고" /></a>
	</div>
	<jsp:include page="${mainNav }" />
	
	<jsp:include page="${settingPage }"></jsp:include>
		<div class="jh-half-circle">
		
		
		
		<div style="margin-left : 52rem; margin-top : 2rem; display : flex;" class="recFund-title">
		<div style="font-size: 30px; font-weight : bold;">ご祝儀</div>
		<div style="font-size: 25px; font-weight : bold;margin-left: 1rem; margin-top: 0.3rem;">の現状</div>
		</div>
		<div  style=" display : flex; margin-top : 8rem;    margin-left: 37rem;  ;" id="toGoTexts">
	<div  onclick="location.href='MemberDetailC'" style="color : #696969;font-weight : bold; margin-right: 4rem;width: 10rem;margin-top: 0.3rem; " class="ToGoTexts">✿ 会員情報 ✿</div>
	<div onclick="location.href='mytemplateController'" style="color : #ff2828;font-weight : bold;margin-left: 0.7rem;	" class="ToGoTexts">✿テンプレート管理 ✿</div>
	<div  onclick="location.href='MyMeetingC'"  style="color : #696969; font-weight : bold; margin-left: 5.6rem;" class="ToGoTexts">✿ 会リスト ✿</div>
	</div>
	<div style="display: flex;     margin-left: 32.5rem;" id="toGoLines">
	<div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div>
	</div>
		<div style="height : 43rem; gap : 10rem;" class="kh-f-card-container">
			
			<div class="kh-f-card-fake"></div>
		
		</div>
		</div>
		<div class="kh-f-mousemove kh-f-none">
				<img alt="" src="finance/img/dragbtn.png">
			</div>
	</div>
</body>
</html>
