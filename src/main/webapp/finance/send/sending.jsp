<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="kh-f-popup" style="display:flex">
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
	<div style="font-size: 2rem">
		<input class="kh-f-input" type="number" maxlength="8"
			oninput="numberMaxLength(this)" />円
	</div>
	<div class="kh-f-btn"></div>
</div>
</body>
</html>