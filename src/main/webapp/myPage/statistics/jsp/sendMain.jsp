<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template Management</title>
<link rel="stylesheet" href="myPage/statistics/css/sendMain.css">
<script type="text/javascript" src="myPage/statistics/js/sendMain.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    // Smooth scroll to top button
    $('#scrollToTop').on('click', function(e) {
        e.preventDefault();
        $('html, body').animate({scrollTop: $('#page_top').offset().top}, 'slow');
    });
 
    $('.hw_template-img').hover(function() {
        // 현재 호버된 이미지와 가장 가까운 .hw_template-button에 스타일 적용
        $(this).css('opacity', '1');
        $(this).siblings('.hw_template-button').css('opacity', '1');
    }, function() {
        // 마우스가 이미지에서 벗어났을 때 원래 상태로 돌아가도록 추가
        $(this).css('opacity', '');
        $(this).siblings('.hw_template-button').css('opacity', '');
    });
    
    
    
});



</script>
<style type="text/css">

/* 방문한 링크 */
.bottomUi a:visited {
    color: black; /* 클릭 후 방문한 링크의 색상 */
}

/* 클릭될 때 스타일 */
.bottomUi a:active {
    color: black; /* 클릭된 순간의 색상 */
}
.SendMainPages {
width: 1rem;

}
  #background1 {
        background-image: url("myPage/statistics/imgFolder/halfCircle2.png");
        background-position: top center;
        top: 0;
      }
       #background2 {
        background-image: url("myPage/statistics/imgFolder/bottomHalfCircle.png");
        background-position: bottom center;
        bottom: 940px;
      }
 .hw_content_btn{
 
 font-family: 'Noto Serif JP', serif;
    font-size: 17px;
    border: 1px solid black;
    border-radius: 15px;
    background-color: #fff4f4;
    height: 3rem;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
 }
 .hw_template-button{
 width : 22.6rem;
 text-align : center;
 
 }
</style>
</head>
<body id="page_top">

	<a class="hw_logo" href="main.jsp"><img
		src="mytemplate/imgFolder/logo.png" alt="logo"></a>
	<a class="hw_menu" href="main.jsp"><img
		src="mytemplate/imgFolder/menu_btn.png" alt="menu"></a>
	
	<div id="background1">
		<div class="canvas-container">
			<canvas class="canvas" id="canvas1"></canvas>
		</div>
	</div>
	<div style="height : 70rem;" id="canvas-content-container">
		<div style="display: flex; flex-direction: column; justify-content : center;
		align-items: center;" class="canvas-content">
			<!-- 첫 번째 배경 이미지와 두 번째 배경 이미지 사이에 들어갈 컨텐츠 -->
			<div style="position : static; margin-top: 57rem; width: 20rem;text-align : center; font-size : 30px; font-" class="hw_page_title">会リスト</div>
			<form id="templateForm" action="mytemplateController" method="post">
				<canvas id="canvas1"></canvas>

				<nav style="    margin-top: 7rem;
				 margin-bottom : 10rem;" class="hw_menubar">
    <div class="hw_menubar_item">
        <a  href="MemberDetailC" class="hw_menubar_menu" href="">✿ 会員情報 ✿</a> <img
            class="hw_yellow_line" alt=""
            src="invitationPage/imgFolder/yellow_line.png">
    </div>
    <div class="hw_menubar_item">
        <a style="color : #696969;" class="hw_menubar_menu active" href="mytemplateController">✿ テンプレート管理 ✿</a> <img
            style="width: 13rem;"
            class="hw_yellow_line" alt=""
            src="invitationPage/imgFolder/yellow_line.png">
    </div>
    
    <div class="hw_menubar_item">
        <a style="color : #ff2828;"  href='MyMeetingC' class="hw_menubar_menu" href="">✿ 会リスト ✿</a> <img
            class="hw_yellow_line" alt=""
            src="invitationPage/imgFolder/yellow_line.png">
    </div>
</nav>

				<main><div style="    display: flex; flex-direction: column; align-items: center; justify-content: center;" class="hw_invitation_main" class="hw_product-page-content">
						<div style="height : 140rem;" class="hw_page-content">
							<c:forEach var="previews" items="${previews}" varStatus="status">
								<div class="hw_page-content-template">
									<div class="hw_template-img">
										<img src="myPage/statistics/imgFolder/${previews.t_preview}" alt="" />
										<div style="display : flex; flex-direction : column;" class="hw_template-button">
											<div class="hw_content_btn" data-target="#layer2">主催者：${previews.m_name }</div>
											<div class="hw_content_btn" >開催日：${previews.r_time }</div>
											<div class="hw_content_btn" >開催場所：${previews.r_addr}</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="bottomUi" style="align-items: center; display: flex; flex-direction: column;">
					<div class="pagination">
						<c:if test="${currentPage > 1}">
							<a style="text-decoration: none;" class="SendMainPages" href="MyMeetingC?page=${currentPage - 1}">[Prev]</a>
						</c:if>
						<c:forEach begin="1" end="${totalPages}" var="i">
							<c:choose>
								<c:when test="${i == currentPage}">
									<span class="SendMainPages">[${i}]</span>
								</c:when>
								<c:otherwise>
									<a class="SendMainPages" style="text-decoration: none;" href="MyMeetingC?page=${i}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${currentPage < totalPages}">
							<a style="text-decoration: none;" href="MyMeetingC?page=${currentPage + 1}">[Next]</a>
						</c:if>
					</div>
					<input type="hidden" id="currentPage" value="${currentPage}" /> 
					<div id="scrollToTop"><img src="mytemplate/imgFolder/top_button.png" class="top_button"></div>
				</div>
				</main>

			</form>
		</div>
	</div>

	<div id="background2">
		<div class="canvas-container">
			<canvas class="canvas" id="canvas2"></canvas>
		</div>
	</div>

	<div class="hw-f-mousemove hw-f-none">
		<img src="mytemplate/imgFolder/back_btn.png" alt="마우스 아이콘">
	</div>

	<!-- 팝업 창 HTML -->
	<div id="popup" class="popup">
		<div class="popup-content">
			<span class="close-btn" onclick="hidePopup()">&times;</span> <input
				type="text" id="popup-url" readonly>
			<button onclick="copyToClipboard()">URL 복사</button>
		</div>
	</div>
</body>
</html>
