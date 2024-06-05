<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초대 관리 페이지</title>
<link rel="stylesheet" href="invitationPage/invitationPage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<body>
<form action="InvitationController" method="post">
<div class="hw_container">
    <div class="hw_sidebar left">
       <a href="main.jsp"> <img src="logo.png" alt="로고" class="logo"></a>
        <ul>
            <li><a href="InvitationController">초대 관리</a></li>
            <li><a href="#">마이 템플릿</a></li>
            <li><a href="#">정보 관리</a></li>
            <li><a href="#">통계</a></li>
        </ul>
    </div>
    <div>
        <h1 class="hw_head">초대 관리</h1>
        <hr>
        </div>
    <div class="hw_content">
        <div class="hw_invitation">
            <img class="hw_img" alt="" src="invitationPage/imgFolder/envelope.jpg">
            <div class="hw_titles" onclick="location.href ='javascript:guest()'" style="cursor:pointer;">김정수님 결혼식</div>
        </div>
        <div class="hw_invitation">
            <img class="hw_img" alt="" src="invitationPage/imgFolder/envelope.jpg">
            <div class="hw_titles" onclick="location.href ='javascript:guest()'" style="cursor:pointer;">김정수님 결혼식</div>
        </div>
        <div class="hw_invitation">
            <img class="hw_img" alt="" src="invitationPage/imgFolder/envelope.jpg">
			<div class="hw_titles" onclick="location.href ='javascript:guest()'" style="cursor:pointer;">김정수님 결혼식</div>        </div>
        <div class="hw_invitation">
            <img class="hw_img" alt="" src="invitationPage/imgFolder/envelope.jpg">
          	<div class="hw_titles" onclick="location.href ='javascript:guest()'" style="cursor:pointer;">김정수님 결혼식</div>
        </div>
    </div>
    <div class="hw_sidebar right">
        <ul>
            <li><a href="#">연결</a></li>
            <li><a href="#">서비스</a></li>
            <li><a href="#">FAQ</a></li>
        </ul>
    </div>
</div>
</form>
</body>
</html>
