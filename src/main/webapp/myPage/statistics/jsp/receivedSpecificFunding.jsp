<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="myPage/statistics/css/receivedSpecificFund.css" />
</head>
<body>

	<div class="recFundSpec-container">
	<img id="fundSpecBack-img" alt="" src="myPage/statistics/imgFolder/fundSpecificBack.png">
	<div><img id="fundSpecPro-img" alt="" src="myPage/statistics/imgFolder/${product }.png"></div>
	<div id="fundSpecProduct-name">${product }</div>
	<div id="fundSpecProduct-rank">現在第${rank }位！ </div>
	<div id="fundSpec-leftPrice">✿目標金額まで後${leftPrice }％です✿</div>
	<div id="fundSpec-chartAlert">統計を確認したい場合は、日付を入力してください</div>
	<div id="fundSpec-inputDate">
	<input type="date">
	<span>~</span>
	<input type="date">
	</div>
	<div id="fundSpec-dataBoard-container">
	<div id="fundSpec-arrBtn">
	<button>金額順</button>	
	<button>日付順</button>	
	</div>
	<div id="fundSpec-dataBoard">
	<div id="fundSpec-dataBoard-navi">
	
	<div>恩人</div>
	<div>金額</div>
	<div>日付</div>
	
	</div>
	<c:forEach items="${fund }" var="f" varStatus="vs" begin="0">
	<div class="recSpecMemberInfo" id="recSpecPriceAndDate"> 
	<div style="margin-left: -2rem; ">${f.m_name }</div>
	<div style="margin-left: 4rem;"> ${f.p_price }円</div>
	<div style="margin-right: -4rem;">${f.p_date }</div>
	</div>
	</c:forEach>
	</div>
	</div>
	<div class="recSpecReturn-img"><img style="width : 20rem;" alt="" src="myPage/statistics/imgFolder/top_button.png"></div>
	
	</div>
	



</body>
</html>