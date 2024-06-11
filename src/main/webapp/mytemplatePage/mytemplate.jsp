<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초대 관리 페이지</title>
<link rel="stylesheet" href="invitationPage/invitationPage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<body id="page_top">
<form action="InvitationController" method="post">
<div class="hw_container">
   <header class="hw_header">
			<a href="main.jsp"><img src="invitationPage/imgFolder/logo.png"alt="로고" class="logo"></a>
			<div class="hw_title">
				<h1>관리페이지</h1>
			</div>
			<input >

			<a href="main.jsp"> <img
				src="invitationPage/imgFolder/menu_btn.png" alt="로고" class="menu"></a>
		</header>
</div>
<main class="hw_main">
	<div class="hw_content">
		<img alt="" src="invitationPage/imgFolde/${invitations.w_img }">
	</div>
	
	
	<a href="#page_top"> <img src="invitationPage/imgFolder/top_button.png" class="top_button"></a>
</main>
</form>







</body>
</html>