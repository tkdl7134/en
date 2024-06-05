<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="finance/js/fund.js"></script>
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
			<h2>: 冷蔵庫</h2>
			<div>: 100,000</div>
			<div>: これ必要です</div>
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
	<div class="kh-fake-card"></div>
	<div class="kh-fund-card">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>冷蔵庫</h3>
		</div>
	</div>
	<div class="kh-fund-card">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>冷蔵庫</h3>
		</div>
	</div>
	<div class="kh-fund-card">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>冷蔵庫</h3>
		</div>
	</div>
	<div class="kh-fund-card">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>冷蔵庫</h3>
		</div>
	</div>
	<div class="kh-fund-card">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>冷蔵庫</h3>
		</div>
	</div>
	<div class="kh-fund-card">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>冷蔵庫</h3>
		</div>
	</div>
	<div class="kh-fund-card">
		<div>
			<img alt="noImg" src="finance/img/refrigerator.png" />
		</div>
		<div>
			<h3>冷蔵庫</h3>
		</div>
	</div>
	<div class="kh-fake-card"></div>
</div>
</html>
