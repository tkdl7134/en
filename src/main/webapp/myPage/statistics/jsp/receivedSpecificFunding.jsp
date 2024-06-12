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
	<div>${list.wl.product }</div>
	<div>現在第${rank }位！ ✿目標金額まで後${leftPrice }％です✿</div>
	<div>統計を確認したい場合は、日付を入力してください</div>
	<div>
	<input type="date">
	<span>~</span>
	<input type="date">
	</div>
	
	<div>
	<div>
	<button>金額順</button>	
	<button>日付順</button>	
	</div>
	<div>恩人|金額|日付</div>
	<c:forEach items="${member }" var="m" begin="0">
	<div> ${m.m_name }</div>
	</c:forEach>	
	<c:forEach items="${fund }" var="f" varStatus="vs" begin="0">
	<div> 
	${f.p_price }
	${f.p_date }
	</div>
	</c:forEach>
	</div>
	<div><img alt="" src="myPage/statistics/imgFolder/top_button.png"></div>
	
	</div>
	



</body>
</html>