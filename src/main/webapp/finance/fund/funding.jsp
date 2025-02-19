<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="finance/css/fund.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="finance/js/fund.js" defer></script>

<div class="kh-f-card-container">
	<div class="kh-f-mousemove kh-f-none">
		<img alt="" src="finance/img/dragbtn.png">
	</div>
	<div class="kh-f-card-fake"></div>
	<!-- <div class="kh-f-card-out">
		<input type="hidden" class="cardInfos">
		<div class="kh-fund-card">
			<div style="height: 18rem">
				<img style="height: 100%" alt="noImg" src="finance/img/机.png" />
			</div>
			<div>
				<h3></h3>
			</div>
		</div>
	</div> -->
</div>


<dialog id="modal" class="modal">
<div class="kh-f-popup">
	<div class="kh-f-popup-in">
		<div class="kh-f-img-box">
			<img alt="noImg" style="height: 100%" id="kh-f-img"  src="" onerror="this.onerror=null; this.src='finance/img/プレゼント.png';"/>
		</div>
		<div class="kh-f-product-des">
			<h3>
				<span id="kh-f-product"></span>
			</h3>
			<div>
				<span id="kh-f-price"></span><span style="color: #FF7E81">％
					達成</span>
			</div>
		</div>
		<div class="kh-f-des">✿ ファンディング金額を入力してください ✿</div>
		<div style="position: relative;">
			<div style="font-size: 2rem" id="kh-input-box">
				<input class="kh-f-input" type="text" maxlength="8"
					oninput="numberMaxLength(this)" onclick="removeWarn()" />円 <img
					alt="" src="finance/img/money.png">
			</div>
			<span id="kh-warn-text"
				style="color: red; position: absolute; bottom: -20px"
				class="kh-none">金額をご入力してください。</span>
		</div>
		<div style="display: flex; justify-content: center;">
			<div class="kh-f-btn"
				onclick="goStatistic(this.getAttribute('value'))" value="">ファンディング
			</div>
		</div>
	</div>
</div>
</dialog>

<dialog id="statisticModal" class="modal">
<div class="kh-f-statistic-pop">
	<div class="kh-f-statistic-pop-in">
		<div class="kh-f-statistic-title">
			<div>
				<img alt="" src="finance/img/crown.png">
			</div>
			<h1>ファンディングランキング</h1>
			<div>
				<img alt="" src="finance/img/crown.png">
			</div>
		</div>
		<div class="kh-f-statistic-conCon">
			<!-- <div class="kh-f-statistic-content">
				<div class="kh-f-statistic-name">
					<div class="kh-f-none"><span>私の選択</span><img alt="noImg" src="finance/img/flash.png"> </div>
					<h1>${element.wl_product}</h1>
				</div>
				<div class="kh-f-statistic-bar">
					<div>
						<div class="kh-f-statistic-abled-bar"><div><img alt="noImg" src="finance/img/menubtn.png"></div></div>
					</div>
				</div>
				<div class="kh-f-statistic-percent" data-value="${element.percent}">
					<img class="kh-f-none" alt="noImg" src="finance/img/threehearts.png">
					<h1><span>0</span>％ 達成</h1>
				</div>
			</div> -->
		</div>
		<div class="kh-f-statistic-timer">
			<img alt="" src=""> <span><span id="finalCount"
				style="color: #C82626">10</span>秒後に画面が移動します。</span>

		</div>
	</div>
</div>
</dialog>
</html>
