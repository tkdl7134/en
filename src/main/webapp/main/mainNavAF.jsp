<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<div class="yj-main-menubox">
	<div class="yj-main-menu">
		<img alt="" src="main/imgFolder/yj-main-menu1.png" />
	</div>
	<div class="yj-main-nav nav-hidden">
		<div class="nav-fakeDiv"></div>
		<div class="nav-info">
			${sessionScope.m_img } ${sessionScope.m_name }様<br>✿ ようこそ ✿
		</div>
		<div class="nav-myPage">
			<a href="MemberC"><h3>マイページ</h3></a>
		</div>
		<div class="nav-myPageList">
			<a href=""><h3>1</h3></a> <a href=""><h3>2</h3></a> <a href=""><h3>3</h3></a>
		</div>
		<div class="nav-invitation">
			<a href="ProductController"><h3>商品紹介</h3></a>
		</div>
		<div class="nav-logout">
			<h3>Logout</h3>
			</a>
		</div>
		<div class="nav-topBtn">
			<a href="#"><img
				src="main/imgFolder/yj-main-topBtn.png" alt="nav-topBtn" /></a>
		</div>
	</div>
</div>

</html>