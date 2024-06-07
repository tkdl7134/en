<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="finance/js/fund.js" defer></script>
<div class="kh-f-popup">
	<div class="kh-f-product-box">
		<div class="kh-f-img-box">
			<img alt="noImg" src="finance/img/refrigerator.png"
				style="width: 100%" />
		</div>
		<div class="kh-f-product-des">
			<h2>商品</h2>
			<div>金額</div>
			<div>コメント</div>
		</div>
		<div class="kh-f-product-des">
			<h2><span  id="kh-f-product">冷蔵庫</span></h2>
			<div><span id="kh-f-price">100,000</span></div>
			<div><span id="kh-f-comment">これ必要です</span></div>
		</div>
	</div>
	<div class="kh-f-des">
		ファンディングする金額を<br />入力してください。
	</div>
	<div style="position:relative;">
		<div style="font-size: 2rem" id="kh-input-box">
			<input class="kh-f-input" type="number" maxlength="8"
				oninput="numberMaxLength(this)" onclick="removeWarn()" />円
		</div>
		<span id="kh-warn-text"
			style="color: red; position: absolute; bottom: -20px" class="kh-none">金額をご入力してください。</span>
	</div>
	<div class="kh-f-btn" onclick="goStatistic()"></div>
</div>

<div class="kh-f-card-container">
	<input type="hidden" id="jlist" value='${jsonList}'>
	<div class="kh-fake-card"></div>
	
	<c:forEach items="${list }" var="l" varStatus="vs" begin="0">
	<div class="kh-fund-card" value="${vs.index}">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>${l.wl_product }</h3>
		</div>
	</div>
	</c:forEach>
	<div class="kh-fake-card"></div>
</div>
</html>
