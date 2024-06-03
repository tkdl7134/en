<%@page import="com.enmusubi.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
<link rel="stylesheet" href="reg.css">
</head>
<body>
<%
    MemberDTO memberDto = (MemberDTO) request.getAttribute("memberDto");
    if (memberDto != null) {
%>
    <h1>マイページ</h1>
    <p>ユーザーID: <%= memberDto.getmId() %></p>
    <p>氏名: <%= memberDto.getmName() %></p>
    <p>フリガナ: <%= memberDto.getmNameKana() %></p>
    <p>性別: <%= memberDto.getmGender() %></p>
    <p>郵便番号: <%= memberDto.getmPostalCode() %></p>
    <p>都道府県: <%= memberDto.getmPrefecture() %></p>
    <p>市区町村: <%= memberDto.getmCity() %></p>
    <p>番地: <%= memberDto.getmAddress() %></p>
    <p>ビル・マンション名など: <%= memberDto.getmBuilding() %></p>
    <p>メールアドレス: <%= memberDto.getmEmail() %></p>
    <p>電話番号: <%= memberDto.getmPhone() %></p>
    <p>生年月日: <%= memberDto.getmBirthdate() %></p>
<%
    } else {
%>
    <p>ユーザー情報が見つかりませんでした。</p>
<%
    }
%>
</body>
</html>