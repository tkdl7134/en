<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="myPage/statistics/css/receivedMoney.css" />
<link rel="stylesheet" href="finance/css/fund.css" />
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
		<div class="jh-half-circle">
		<div style="margin-left : 52rem;" class="recFund-title">ご祝儀の現状</div>
		<div style="margin-top: 17rem; gap : 10rem;" class="kh-f-card-container">
			<div class="kh-f-mousemove kh-f-none">
				<img alt="" src="finance/img/dragbtn.png">
			</div>
			<div class="kh-f-card-fake"></div>
		
		</div>
		</div>
	</div>
</body>
</html>
