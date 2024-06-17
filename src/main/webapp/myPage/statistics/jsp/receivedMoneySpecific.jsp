<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myPage/statistics/css/receivedSpecificFund.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>

</head>
<body>

<div class="recFundSpec-container">
    <div id="fundSpecProduct-img"><img id="fundSpecPro-img" alt="" src="myPage/statistics/imgFolder/${product }.png"></div>
    <div id="fundSpecProduct-name">${product }</div>
    <div id="fundSpecProduct-rank">現在第${rank }位！ </div>
    <div id="fundSpec-leftPrice">✿目標金額まで後${leftPrice }％です✿</div>
		<div id="fundSpec-lineShort" ><img alt="" src="myPage/statistics/imgFolder/lineShort.png"></div>
		<div id="fundSpec-chartAlert">統計を確認したい場合は、日付を入力してください</div>

    <div id="fundSpec-inputDate">
        <form id="dateForm" >
            <input id="startDate" name="startDate" value="${lastWeekDate }" type="date">
            <span style="font-size: 2.5rem; margin-left: 1rem; margin-right: 1rem;">~</span>
            <input id="endDate"  name="endDate"  value="${todayDate }" type="date">
            <input  id="submit" type="submit" value="確認する">
            <input type="hidden" name="product" value="${product }">
            <input id="fundSpecWlno" type="hidden" name="wlno" value="${wlno }">
            <input id="fundSpecEno" type="hidden" name="eno" value="${eno }">
        </form>
    </div>
    <canvas style="margin-top: 3rem;" id="priceChart" width="400" height="400"></canvas>
	<div style="margin-top : 5rem;"><img alt="" src="myPage/statistics/imgFolder/lineLong.png"></div>
    <div id="fundSpec-dataBoard-container">
        <div id="fundSpec-arrBtn">
            <button class="arrButtons" id="byMoney">金額順</button>
            <button class="arrButtons" id="byDate" >日付順</button>
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
</div>
<script type="text/javascript" src="myPage/statistics/js/receivedSpecificFund.js"></script>
</body>
</html>
