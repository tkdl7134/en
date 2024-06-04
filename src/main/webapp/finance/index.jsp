<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="finance/css/index.css" />
    <link rel="stylesheet" href="finance/css/send.css" />
    <script src="finance/js/index.js" defer></script>
    <script src="finance/js/send.js" defer></script>
    <title>縁結び</title>
  </head>
  <body>
    <div class="kh-f-whole-container">
      <div class="kh-f-container">
        <div class="kh-f-content">
          <div class="kh-f-left-fade"></div>
          <div class="kh-head"><h1>${title }</h1></div>
          <jsp:include page="${page}"></jsp:include>
          <div class="kh-f-right-fade"></div>
        </div>
      </div>
      <aside class="kh-aside">
        <div style="width: 100%">
          <img src="finance/img/furin.png" alt="noImg" class="kh-furin" />
        </div>
      </aside>
    </div>
  </body>
</html>
