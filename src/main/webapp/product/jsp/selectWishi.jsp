<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="product/css/selectWishi.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="product/js/selectWishi.js"></script>
</head>
<body>

	<div id="background1">
		<div class="canvas-container">
			<canvas class="canvas" id="canvas1"></canvas>
		</div>
	</div>
	<h1 style="position:absolute;top:70px;left:50%;transform:translateX(-50%)">ウィッシュリスト</h1>
	<div id="canvas-content-container">
		<!-- 첫 번째 배경 이미지와 두 번째 배경 이미지 사이에 들어갈 컨텐츠 -->
		<div class="jw-w-big-container">
			<div class="jw-w-container">
				<div class="jw-w-img-box" onclick="location.href='FundingSettingC'">
					<div class="jw-w-tex">
						<h3>ファンディング</h3>
						<h4>の現状</h4>
					</div>
					<div class="jw-w-ribbon">
						<img alt="noImg"
							src="myPage/statistics/imgFolder/line_funding.png">
					</div>
				</div>
				<div class="jw-w-img-box" onclick="openAmazonModal()">
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
					onclick="openSendModal()">
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


	<dialog id="AmazonModal" class="modal">
	<div class="jw-w-popup" id="amazonpop">
		<div><h2>プレゼント</h2></div>
		<div><h3>Amazon「ほしい物リスト」</h3></div>
		<div><input class="jw-w-popup-input" placeholder="Amazon「ほしい物リスト」のURL" value="${sdto.link }"></div>
		<div><button class="jw-w-popup-btn" onclick="amazonSubmit('${sdto.eno}')"><h4>登録</h4></button></div>
	</div>
	</dialog>
	
	<dialog id="SendModal" class="modal" data-value="${sdto.ef_send}">
	<form id=	"sendModalForm">
	<div class="jw-w-popup" style="background-image: url('product/imgFolder/empty-pop.png')" id="sendpop">
		<div><h2>ご祝儀</h2></div>
		<div><h3>招待客からサイトを通じてご祝儀を受け取られますか?</h3></div>
		<div style="gap:5rem">
			<label><input type="radio" name="jw-w-radio" value="yes">はい</label>
			<label><input type="radio" name="jw-w-radio" value="no">いいえ</label>
			<input name="type" type="hidden" value="send">
			<input name="eno" type="hidden" value="1">
		</div>
		<div><span id="kh-warn-text" style="color:red" class="jw-none">チェクしてください。</span></div>
		<div><button type="button" class="jw-w-popup-btn" onclick="sendSubmit()"><h4>登録</h4></button></div>
	</div>
	</form>
	</dialog>




</body>
</html>