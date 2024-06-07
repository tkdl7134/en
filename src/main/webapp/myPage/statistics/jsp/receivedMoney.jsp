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
	  $('.bxslider').bxSlider();
	});
$	(function(){
    $('.bxslider').bxSlider({
      mode: 'fade',
      captions: true,
      slideWidth: 600
    });
  });
  </script>
</head>
<body>

<div class="bxslider">
  <div><img src="/assets/coffee1-7325690f507d48962d312be15d9d8929be4a5ff04d184d5ed0a96c1b27940260.jpg" title="Coffee 1" /></div>
  <div><img src="/assets/coffee2-8bb17517b21cc5b38f3ea7d14cfc4b4c82cc51b99e82bfc3a6d02688ab6c5988.jpg" title="Coffee 2" /></div>
  <div><img src="/assets/coffee3-02c76c3b922183d7c5144e6856065ad68834ddc7ab5367481a225c516a308cb8.jpg" title="Coffee 3" /></div>
</div>




</body>
</html>