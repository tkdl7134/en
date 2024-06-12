<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초대 관리 페이지</title>
<link rel="stylesheet" href="mytemplatePage/mytemplatePage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 300px;
            margin: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .card h2 {
            margin-top: 0;
        }
        .card p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>이름</h2>
        <p>게스트</p>
        <p>전화번호: 010-1234-5678</p>
        <p>이메일: example@example.com</p>
    </div>
    <div class="card">
        <h2>이름</h2>
        <p>게스트</p>
        <p>전화번호: 010-8765-4321</p>
        <p>이메일: example2@example.com</p>
    </div>
    <!-- 더 많은 카드를 여기에 추가하세요 -->
</body>
</html>