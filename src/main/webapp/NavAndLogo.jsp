<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.yj-main-s2-menu {
	width: 80px;
	height: 80px;
	transition: opacity 0.5s ease;
}

.yj-main-s2-menu img {
	width: 100%;
	height: 100%;
	position: relative;
	z-index: 4;
}

.yj-main-s2-logo {
	z-index: 4;
	width: 150px;
	height: 150px;
	position: absolute;
	top: 3rem;
	left: 4rem;
}

.yj-main-s2-logo img {
	width: 100%;
	height: 100%;
	animation: logo-float 2s ease-in-out infinite;
}
@keyframes logo-float { 0%, 
100% {
	transform: translate(0, 0%);
}
	50%{
	transform:translate(0,5%);}
}
.fakeDiv {
	height: 150px;
}

.onon {
	display: flex;
}

.nonnon {
	display: none;
}

.navi {
	transform: translateY(-30px);
	background-image: url(img/NAVI.png);
	background-size: cover;
	width: 175px;
	height: 670px;
	flex-direction: column;
	align-items: center;
}
</style>
</head>
<body>
	<div class="yj-main-s2-logo">
		<img alt="" src="img/logo.png">
	</div>
	<div
		style="position: absolute; top: 3rem; right: 4rem; display: flex; flex-direction: column; align-items: center;width:175px">
		<div class="yj-main-s2-menu">
			<img alt="" src="img/default_menu.png">
		</div>
		<div class="navi nonnon">
			<div class="fakeDiv"></div>
			<div>
				<h2>메인</h2>
			</div>
			<div>
				<h2>마이페이지</h2>
			</div>
			<div>
				<h2>템플릿</h2>
			</div>
			<div>
				<h2>로그아웃</h2>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	const logo = document.querySelector(".yj-main-s2-menu>img");
	const navi = document.querySelector(".navi")
	logo.addEventListener("click", function() {
		if(navi.classList.contains("nonnon")){
			this.src = "img/yj-main-default-menu2.png";
			navi.classList.remove("nonnon");
			navi.classList.add("onon");
		}
		else{
			this.src = "img/default_menu.png";
			navi.classList.remove("onon");
			navi.classList.add("nonnon");
		}
	});
</script>
</html>