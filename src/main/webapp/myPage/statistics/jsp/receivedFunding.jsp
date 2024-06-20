<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="myPage/statistics/css/receivedFund.css" />
<link rel="stylesheet" href="finance/css/fund.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script defer="defer" type="text/javascript"
	src="myPage/statistics/js/receivedFunding.js"></script>
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
		<div class="yj-main-s2-logo"><img class="yj-main-s2-logo img " alt="" src="myPage/statistics/imgFolder/mainbutton.png"></div>
		<div class="yj-main-s2-menu"><img alt="yj-main-s2-menu img " src="myPage/statistics/imgFolder/navi.png"></div>
		<div class="jh-half-circle">
		<div class="recFund-title">ファンディング の現状</div>
		<div  style="display : flex; margin-top : 10rem;  margin-left : 15rem;  width: 80rem;" id="toGoTexts">
	<div style="margin-right: 6rem;width: 10rem;margin-top: 0.3rem; margin-left: 9.5rem;" class="ToGoTexts">✿ 会員情報 ✿</div>
	<div style="margin-left: 0.7rem;	" class="ToGoTexts">✿テンプレート管理 ✿</div>
	<div onclick="location.href='ReceivedMainC'"   class="ToGoTexts" style="color : #ff2828;margin-left: 4.2rem;">✿ 心からのお伝え ✿</div>
	<div  style="margin-left: 5rem;" class="ToGoTexts">✿ 会リスト ✿</div>
	</div>
	<div style="display: flex; margin-left: 21rem; " id="toGoLines">
	<div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div>
	</div>
		<div style="margin-top: 8rem; gap : 10rem;" class="kh-f-card-container">
			
			<div class="kh-f-card-fake"></div>
		
		</div>
		</div>
		<div class="kh-f-mousemove kh-f-none">
				<img alt="" src="finance/img/dragbtn.png">
			</div>
	</div>
</body>
</html>
