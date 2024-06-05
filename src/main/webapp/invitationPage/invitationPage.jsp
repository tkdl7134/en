<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>invitation Page</title>
<link rel="stylesheet" href="invitationPage/invitationPage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<body>
<form action="InvitationController" method="post">
<div class="hw_container">
    <div class="hw_sidebar left">
       <a href="main.jsp"> <img src="logo.png" alt="Logo" class="logo"></a>
        <ul>
            <li><a href="InvitationController">招待管理</a></li>
            <li><a href="#">マイテンプレート</a></li>
            <li><a href="#">情報管理</a></li>
            <li><a href="#">統計</a></li>
        </ul>
    </div>
    <div class="hw_content">
        <h1 class="hw_head">招待管理</h1>
        <hr>
        <div class="envelopes">
            <img alt="" src="invitationPage/imgFolder/envelope.jpg">
            <img alt="" src="invitationPage/imgFolder/envelope.jpg">
            <img alt="" src="invitationPage/imgFolder/envelope.jpg">
            <img alt="" src="invitationPage/imgFolder/envelope.jpg">
        </div>
        <div class="titles">
            <div><a href="javascript:void(0);" onclick="guest()">김정수님 결혼식 식전조사</a></div>
            <div>김정수님 결혼식 식전조사</div>
            <div>김정수님 결혼식 식전조사</div>
            <div>김정수님 결혼식 식전조사</div>
        </div>
    </div>
    <div class="hw_sidebar right">
        <ul>
            <li><a href="#">縁結び</a></li>
            <li><a href="#">サービス</a></li>
            <li><a href="#">FAQ</a></li>
        </ul>
    </div>
</div>
</form>
</body>
</html>
