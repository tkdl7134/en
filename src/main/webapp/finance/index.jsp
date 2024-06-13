<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="finance/css/index.css" />
    <script src="finance/js/index.js" defer></script>
    
    <title>縁結び</title>
  </head>
  <body style="overflow: hidden">
    <div class="kh-f-whole-container">
    	<div class="kh-upper-line"><img alt="upperLine" src="finance/img/upperline.png" class="kh-line-img"> </div>
    	<div class="kh-lower-line"><img alt="lowerLine" src="finance/img/lowerline.png" class="kh-line-img"> </div>
      <div class="kh-f-container">
      	<div class="kh-head">
      		<div style="max-width:150px"><img alt="" src="finance/img/logo.png" style="width:100%"> </div>
      		<div><img alt="" src="finance/img/menubtn.png" style="width:100%"> </div>
      	</div>
        <div class="kh-f-content">
          <jsp:include page="${page}"></jsp:include>
        </div>
      </div>
    </div>
  </body>
</html>
