<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アンケート 管理</title>
<link rel="stylesheet" href="invitationPage/invitationPage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<body id="page_top">
	<form action="InvitationController" method="post">
		<div class="hw_container">
			<header class="hw_invitation_header">
				<a class="hw_logo" href="main.jsp"><img
					src="invitationPage/imgFolder/logo.png" alt="logo"></a> <a
					class="hw_pagetitle" href="main.jsp"><img
					src="invitationPage/imgFolder/template_title.png" alt="pagetitle"></a>
				<a class="hw_menu" href="main.jsp"><img
					src="invitationPage/imgFolder/menu_btn.png" alt="메뉴"></a>
			</header>

			<main class="hw_template_main">




				<!-- 출석 탭 영역 -->
				<div class="hw_content"></div>
		</div>

		<a href="#page_top"><img
			src="invitationPage/imgFolder/top_button.png" class="top_button"></a>

		<!-- 마우스 아이콘 -->
		<div class="hw-f-mousemove hw-f-none">
			<img src="invitationPage/imgFolder/back_btn.png" alt="마우스 아이콘">
		</div>
		</main>
	</form>
</body>
</html>
