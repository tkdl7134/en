<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"
    /> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.bxslider').bxSlider({
        mode: 'fade',
        captions: true,
        slideWidth: 600 // 슬라이드 너비 설정
    });
});
</script>
</head>
<body>

<div class="bxslider">
  <div><img src="myPage/statistics/imgFolder/ema.png" title="ema 1" /></div>
  <div><img src="myPage/statistics/imgFolder/ema.png" title="ema 2" /></div>
  <div><img src="myPage/statistics/imgFolder/ema.png" title="ema 3" /></div>
</div>
<div><img onclick="location.href='receviedSpecificMoneyC'" src="myPage/statistics/imgFolder/ema.png"/></div>
</body>
</html>