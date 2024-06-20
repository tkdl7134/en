<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="product/css/selectWishi.css">
<script type="text/javascript" src="product/js/selectWishi.js"></script>
</head>
<body>

	<div id="background1">
		<div class="canvas-container">
			<canvas class="canvas" id="canvas1"></canvas>
		</div>
	</div>
	<div id="canvas-content-container">
		<!-- 첫 번째 배경 이미지와 두 번째 배경 이미지 사이에 들어갈 컨텐츠 -->
		<div class="jw-w-big-container">
			<div class="jw-w-container">
				<div class="jw-w-img-box" onclick="location.href='SendC'">
					<div class="jw-w-tex">
						<h3>ファンディング</h3>
						<h4>の現状</h4>
					</div>
					<div class="jw-w-ribbon">
						<img alt="noImg"
							src="myPage/statistics/imgFolder/line_funding.png">
					</div>
				</div>
				<div class="jw-w-img-box" onclick="location.href='FundC'">
					<div class="jw-w-tex">
						<h3>プレゼント</h3>
						<h4>の現状</h4>
					</div>
					<div class="jw-w-ribbon">
						<img alt="noImg"
							src="myPage/statistics/imgFolder/line_present.png">
					</div>
				</div>
				<div class="jw-w-img-box"
					onclick="location.href='https://www.amazon.com/-/ko/ref=nav_logo'">
					<div class="jw-w-tex">
						<h3>ご祝儀</h3>
						<h4>の現状</h4>
					</div>
					<div class="jw-w-ribbon">
						<img alt="noImg" src="myPage/statistics/imgFolder/line_money.png">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>