<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ファンディング現状</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="myPage/statistics/css/receivedSpecificMoney.css" />
<link rel="stylesheet" href="product/index.css" />
<script defer="defer" type="text/javascript"
	src="product/index.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
 <style>
      body {
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        background-color : #FFF5F4;
       
      }
      #background1,
      #background2 {
        width: 100%;
        height: 100vh;
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #FFF5F4;
      }
      #background1 {
       /*  background-image: url("myPage/statistics/imgFolder/halfCircle2.png"),url("myPage/statistics/imgFolder/bottomHalfCircle.png");
        background-position: top center , bottom center; */
        top: 0;
       /*   background-image: url("myPage/statistics/imgFolder/bottomHalfCircle.png");
        background-position: bottom center; */
      }
      #background2 {
        background-image: url("myPage/statistics/imgFolder/bottomHalfCircle.png");
        background-position: bottom center;
        bottom: 940px;
        margin-top : 10%;
      }
      #canvas-content-container {
        z-index: 2; /* 컨텐츠가 캔 버스 위에 오도록 설정 */
        position: relative;
        display: flex;
        background-color: #FFF5F4;
            background-image: url("myPage/statistics/imgFolder/halfCircle2.png"),url("myPage/statistics/imgFolder/bottomHalfCircle.png");
        background-position: top center , bottom center;
      background-repeat: no-repeat;
      justify-content : center;
      height : 175rem;
      }
      .canvas-container {
        display: none;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 1; /* 캔버스가 배경 이미지 위에 오도록 설정 */
           
      }
      .canvas {
        display: none;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none; /* 마우스 이벤트를 캔버스에만 허용하도록 설정 */
      }
      .canvas-content {
        top: -90vh;
        left: 50%;
            display: flex;
    flex-direction: column;
    align-items: center;
     
      }
          .hs_mypage-menus {
	display: flex;
	justify-content: center;
	width: 55%;
	font-size: 15pt;
	text-align: center;
	margin-top: 10rem;
}

.hs_btn-container {
	display: block;
}

.hs_btn {
	text-decoration: none;
	color: #696969;
}

.hs_btn:hover {
	text-decoration: none;
	color: #ff2828;
}

.hs_btn.me {
	color: #ff2828;
}

.yellow_line {
	width: 15rem;
	margin-bottom: 100px;
}
.MoneyImg {
border-radius : 45px;
overflow : hidden;
border : 1px
}
.yj-main-menubox{
z-index : 100;
}
    </style>


</head>
<body>

<%-- <div id="background1">
      <div class="canvas-container">
        <canvas class="canvas" id="canvas1"></canvas>
      </div>
    </div> --%>
        <div class="yj-main-logo">
			<a href="#" class="mainLogo"><img
				src="main/imgFolder/yj-main-logo.png" alt="섹션2 로고" /></a>
	</div>
	<jsp:include page="${mainNav }" />
	
	<jsp:include page="${settingPage }"></jsp:include>
    <div id="canvas-content-container">
      <div class="canvas-content">
        <!-- 첫 번째 배경 이미지와 두 번째 배경 이미지 사이에 들어갈 컨텐츠 -->
	<div style="display : flex; margin-top : 7rem; " class="recSpecMoneyTitle">
	<div style="font-size: 30px; font-weight : bold;">ご祝儀</div>
	<div  style="margin-top: 0.3rem; smargin-left: 1rem;font-size: 25px; font-weight : bold;">の現状</div>
	</div>
		<div class="hs_mypage-menus">
				<div class="hs_btn-container">
					<a href="MemberDetailC" class="hs_btn">✿ 会員情報 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				<div class="hs_btn-container">
					<a href="mytemplateController" class="hs_btn me">✿ テンプレート管理 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				
				<div class="hs_btn-container">
					<a href="MyMeetingC" class="hs_btn ">✿ 会リスト ✿</a> <img class="yellow_line"
						alt="" src="loginPage/ImgFolder/yellow_line.png">
				</div>
			</div>
			<div class="MoneyImg"><img alt="" src="myPage/statistics/imgFolder/bg_wedding_chapel.jpg"></div>
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
    
</div>
</div>
  <%--   <div id="background2">
      <div class="canvas-container">
        <canvas class="canvas" id="canvas2"></canvas>
      </div>
    </div>
 --%>

<script type="text/javascript" src="myPage/statistics/js/receivedSpecificMoney.js"></script>
</body>
<script>
      document.addEventListener("DOMContentLoaded", function () {
        const canContainer = document.getElementById(
          "canvas-content-container"
        );
        const canContent = document.querySelector(".canvas-content");
        console.log(canContainer);
        console.log(canContent);

        let canConH = window.getComputedStyle(canContent).height;
        console.log(canConH);
          // 문자열에서 'px'를 제거하고 숫자로 변환
          let canConHNum = parseFloat(canConH);
          console.log(canConHNum);

          // 계산 수행
          let calcRes = canConHNum - 1450;
          console.log(calcRes);

          // 결과 적용
          canContainer.style.height = calcRes + "px";
          console.log(canContainer.style.height);
        if (canConH > 1300) {
        }
        // 첫 번째 배경 이미지와 관련된 요소들
        let background1 = document.getElementById("background1");
        let canvas1 = document.getElementById("canvas1");
        let ctx1 = canvas1.getContext("2d");
        let img1 = new Image();
        img1.src = "myPage/statistics/imgFolder/halfCircle2.png"; // 첫 번째 배경 이미지 경로 설정

        // 두 번째 배경 이미지와 관련된 요소들
        let background2 = document.getElementById("background2");
        let canvas2 = document.getElementById("canvas2");
        let ctx2 = canvas2.getContext("2d");
        let img2 = new Image();
        img2.src = "myPage/statistics/imgFolder/bottomHalfCircle.png"; // 두 번째 배경 이미지 경로 설정

        // 캔버스 초기화 함수
        function initCanvas(canvas, ctx, imageSrc) {
          let img = new Image();
          img.src = imageSrc;
          img.onload = function () {
            canvas.width = img.width;
            canvas.height = img.height;
            ctx.drawImage(img, 0, 0);
          };
        }

        // 첫 번째 배경 이미지 캔버스 초기화
        initCanvas(canvas1, ctx1, img1.src);

        // 두 번째 배경 이미지 캔버스 초기화
        initCanvas(canvas2, ctx2, img2.src);

        // 마우스 이벤트 처리 함수
        function handleMouseMove(event, ctx, canvas) {
          let rect = canvas.getBoundingClientRect();
          let x = event.clientX - rect.left;
          let y = event.clientY - rect.top;
          let pixel = ctx.getImageData(x, y, 1, 1).data;

          // 픽셀의 알파 값이 0이 아니면(투명하지 않으면) 이벤트 처리
          if (pixel[3] !== 0) {
            console.log("Mouse event on non-transparent area");
            // 필요한 이벤트 처리 작성
            
            background1.style.cursor = 'url("myPage/statistics/imgFolder/backbtn.png"), auto';
            background2.style.cursor = 'url("myPage/statistics/imgFolder/backbtn.png"), auto';
          }
        }

        // 첫 번째 배경 이미지의 마우스 이벤트 리스너 추가
        background1.addEventListener("mousemove", function (event) {
          handleMouseMove(event, ctx1, canvas1);
        });

        // 두 번째 배경 이미지의 마우스 이벤트 리스너 추가
        background2.addEventListener("mousemove", function (event) {
          handleMouseMove(event, ctx2, canvas2);
        });
        background1.addEventListener("click", function () {
            location.href = 'ReceivedMainC?eno='+${eno};
        });

        background2.addEventListener("click", function () {
            location.href = 'ReceivedMainC?eno='${eno};
        });
      });
    </script>
</html>
