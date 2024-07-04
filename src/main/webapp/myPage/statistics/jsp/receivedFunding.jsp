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
.hs_mypage-menus {
	display: flex;
	justify-content: center;
	width: 55%;
	font-size: 15pt;
	text-align: center;
	margin-top: 10rem;
}

.hs_btn-container {
	display: block;
}

.hs_btn {
	text-decoration: none;
	color: #696969;
}

.hs_btn:hover {
	text-decoration: none;
	color: #ff2828;;
}

.hs_btn.me {
	color: #ff2828;
}

.yellow_line {
	width: 15rem;
	margin-bottom: 100px;
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
