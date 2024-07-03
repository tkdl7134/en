<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ファンディングの現状</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="myPage/statistics/css/receivedFund.css" />
<link rel="stylesheet" href="product/index.css" />
<link rel="stylesheet" href="finance/css/fund.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script defer="defer" type="text/javascript"
	src="myPage/statistics/js/receivedFunding.js"></script>
<script defer="defer" type="text/javascript"
	src="product/index.js"></script>
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
.yj-main-menubox{
z-index : 100;
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
		<input id="myParam" type="hidden" value="${param.eno}">
		<div style="margin-top : 2rem;" class="recFund-title">ファンディング の現状</div>
		<div  style="display : flex; margin-top : 8rem;text-align: center;    justify-content: space-evenly;    width: 60rem;" id="toGoTexts">
	<div  onclick="location.href='MemberDetailC'" style="width: 10rem; " class="ToGoTexts">✿ 会員情報 ✿</div>
	<div  onclick="location.href='mytemplateController'"  style="color : #ff2828; 	" class="ToGoTexts">✿テンプレート管理 ✿</div>
	<div  onclick="location.href='MyMeetingC'" style="" class="ToGoTexts">✿ 会リスト ✿</div>
	</div>
	<div style="display: flex; 	 " id="toGoLines">
 <div style="margin-left: 1rem;"><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div style="margin-left: 2rem;"><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div style="    margin-left: 1rem;"><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div>
	</div>
		<div style="margin-top: 6rem; gap : 10rem;" class="kh-f-card-container">
			
			<div class="kh-f-card-fake"></div>
		
		</div>
		</div>
		<div class="kh-f-mousemove kh-f-none">
				<img alt="" src="finance/img/dragbtn.png">
			</div>
	</div>
</body>
</html>
