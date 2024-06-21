<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="product/css/invitationPreview.css">
</head>
<body>
  <!-- 로고 / 네비 -->
    <div id="yj-main-s2-logo">
      <img src="product/imgFolder/Logo.png" alt="" />
    </div>
    <div id="yj-main-s2-menu">
      <img src="product/imgFolder/menu_btn_1.png" alt="" />
    </div>
    
    eventnumber parameter : ${inviteInfo.e_no } <br>
${inviteInfo.weddingDay }
${inviteInfo.w_time }
<img alt="" src="product/imgFolder/${inviteInfo.w_img3 }">
</body>
</html>