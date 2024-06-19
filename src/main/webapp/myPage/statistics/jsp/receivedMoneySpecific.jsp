<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myPage/statistics/css/receivedSpecificMoney.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>

</head>
<body>

<div class="recFundSpec-container">
	<div style="display : flex; margin-top : 8rem;" class="recSpecMoneyTitle">
	<div style="font-size: 30px; font-weight : bold;">ご祝儀</div>
	<div  style="margin-top: 0.3rem; smargin-left: 1rem;font-size: 25px; font-weight : bold;">の現状</div>
	</div>
	<div  style="display : flex; margin-top : 8rem;    width: 80rem;" id="toGoTexts">
	<div style="margin-right: 4rem;width: 10rem;margin-top: 0.3rem; margin-left: 9.5rem;" class="ToGoTexts">✿ 会員情報 ✿</div>
	<div style="margin-left: 0.7rem;	" class="ToGoTexts">✿テンプレート管理 ✿</div>
	<div  onclick="location.href='ReceivedMainC'"  class="ToGoTexts" style="color : #ff2828;margin-left: 4.2rem;">✿ 心からのお伝え ✿</div>
	<div  style="margin-left: 6.1rem;" class="ToGoTexts">✿ 会リスト ✿</div>
	</div>
	<div style="display: flex; " id="toGoLines">
	<div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div><div><img class="yellowLines" alt="" src="myPage/statistics/imgFolder/yellow_line.png"></div>
	</div>


    <div  id="fundSpecProduct-img" style=""><img style="width: 37.5rem;" id="fundSpecPro-img" alt="" src="myPage/statistics/imgFolder/bg_wedding_chapel.jpg"></div>
  	<div class="yj-main-s2-logo"><img class="yj-main-s2-logo img " alt="" src="myPage/statistics/imgFolder/mainbutton.png"></div>
  	<div class="yj-main-s2-menu"><img class="yj-main-s2-menu img " alt="" src="myPage/statistics/imgFolder/navi.png"></div>
    
    
    
    <div style="margin-top : 5rem;" id="fundSpec-leftPrice">✿ いただいたお祝いの気持ちです。どうぞその気持ちをご確認ください ✿</div>
	<div style="margin-top : 5rem;"><img alt="" src="myPage/statistics/imgFolder/lineLong.png"></div>
    <div  style="height : 100rem; max-height : 80rem;" id="fundSpec-dataBoard-container">
        <div id="fundSpec-arrBtn">
            <button class="arrButtons" id="byName">名前順</button>
            <button class="arrButtons" id="byMoney">金額順</button>
            <button class="arrButtons" id="byDate" >日付順</button>
            <input id="SpecMoneyEno" type="hidden" value="${eno }">
        </div>
        <div id="fundSpec-dataBoard">
            <div id="fundSpec-dataBoard-navi">
                <div style="border-right: 1px solid;" class="recSpecMemberInfos">恩人</div>
                <div style="border-right: 1px solid;" class="recSpecMemberInfos">金額</div>
                <div class="recSpecMemberInfos">日付</div>
            </div>
            <c:forEach items="${fund }" var="f" varStatus="vs" begin="0">
                <div class="recSpecMemberInfo" id="recSpecPriceAndDate">
                    <div style="border-right: 1px solid;" class="recSpecMemberInfos">${f.m_name }</div>
                    <div id="MemberInfoPrice${vs.index}" style="border-right: 1px solid;" class="recSpecMemberInfos"> ${f.p_price }</div>
                    <div class="recSpecMemberInfos">${f.p_date }</div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="recSpecReturn-img"><img onclick="GoToTop()" style="width : 12rem;" alt="" src="myPage/statistics/imgFolder/top_button.png"></div>
    <div class="recSpecMoney-bottomCircle"></div>
    
</div>
<script type="text/javascript" src="myPage/statistics/js/receivedSpecificMoney.js"></script>
</body>
</html>
