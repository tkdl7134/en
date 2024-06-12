<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="finance/css/fund.css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="finance/js/fund.js" defer></script>

<div class="kh-f-card-container">
	<div class="kh-f-mousemove kh-f-none">
		<img alt="" src="finance/img/dragbtn.png">
	</div>
	<div class="kh-f-card-fake"></div>
	<c:forEach items="${list }" var="l" varStatus="vs" begin="0">
	<input type="hidden" value="${l.e_no }" class="eno">
		<div class="kh-f-card-out">
			<div class="kh-fund-card" value="${l.wl_no }">
				<div style="height:18rem">
					<img style="height:100%" alt="noImg" src="finance/img/${l.wl_product }.png" />
				</div>
				<div>
					<h3>${l.wl_product }</h3>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="kh-f-card-fake"></div>
</div>


<dialog id="modal">
<div class="kh-f-popup">
	<div class="kh-f-popup-in">
		<div class="kh-f-img-box">
			<img alt="noImg" src=""
				style="height: 100%" 
				id="kh-f-img"/>
		</div>
		<div class="kh-f-product-des">
			<h3>
				<span id="kh-f-product"></span>
			</h3>
			<div>
				<span id="kh-f-price"></span><span style="color:#FF7E81">％ 達成</span>
			</div>
		</div>
		<div class="kh-f-des">
			 ✿ ファンディング金額を入力してください ✿
		</div>
		<div style="position: relative;">
			<div style="font-size: 2rem" id="kh-input-box">
				<input class="kh-f-input" type="number" maxlength="8"
					oninput="numberMaxLength(this)" onclick="removeWarn()" />円
					<img alt="" src="finance/img/money.png">
			</div>
			<span id="kh-warn-text"
				style="color: red; position: absolute; bottom: -20px"
				class="kh-none">金額をご入力してください。</span>
		</div>
		<div style="display: flex; justify-content: center;">
			<div class="kh-f-btn"
				onclick="goStatistic(this.getAttribute('value'))" value="">ファンディング</div>
		</div>
	</div>
</div>
</dialog>
</html>
