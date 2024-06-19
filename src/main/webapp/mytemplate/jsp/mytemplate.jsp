<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template Management</title>
<link rel="stylesheet" href="mytemplate/css/mytemplate.css">
<link rel="stylesheet" href="mytemplate/css/customStyles.css">
<!-- 추가된 CSS 파일 -->
<script type="text/javascript" src="mytemplate/js/mytemplate.js"></script>
</head>
<body id="page_top" class="background-image">
	<form id="templateForm" action="mytemplateController" method="post">
		<canvas id="canvas1"></canvas>
		<div class="hw_container">
			<header class="hw_invitation_header">
				<a class="hw_logo" href="main.jsp"><img
					src="mytemplate/imgFolder/logo.png" alt="logo"></a> <a
					class="hw_menu" href="main.jsp"><img
					src="mytemplate/imgFolder/menu_btn.png" alt="menu"></a>
				<div class="hw_header_title">
					<a class="hw_pagetitle"><img
						src="mytemplate/imgFolder/pagetitle.png" alt="pagetitle"></a>
				</div>
			</header>
			<nav class="hw_menubar">
				<div class="hw_menubar_item">
					<a class="hw_menubar_menu" href="">✿ 会員情報 ✿</a> <img
						class="hw_yellow_line" alt=""
						src="invitationPage/imgFolder/yellow_line.png">
				</div>
				<div class="hw_menubar_item">
					<a class="hw_menubar_menu" href="">✿ テンプレート管理 ✿</a> <img
						class="hw_yellow_line" alt=""
						src="invitationPage/imgFolder/yellow_line.png">
				</div>
				<div class="hw_menubar_item">
					<a class="hw_menubar_menu" href="">✿ 心からのお伝え ✿</a> <img
						class="hw_yellow_line" alt=""
						src="invitationPage/imgFolder/yellow_line.png">
				</div>
				<div class="hw_menubar_item">
					<a class="hw_menubar_menu" href="">✿ 会リスト ✿</a> <img
						class="hw_yellow_line" alt=""
						src="invitationPage/imgFolder/yellow_line.png">
				</div>
			</nav>
			<main class="hw_invitation_main">
				<div class="hw_product-page-content">
					<div class="hw_page-content">
						<c:forEach var="product" items="${products}" varStatus="status">
							<div class="hw_page-content-template">
								<div class="hw_template-img">
									<img src="mytemplate/imgFolder/${product.t_preview}" alt="" />
									<button type="button" class="hw_share_btn"
										onclick="showPopup('${product.t_preview}')">
										<img alt="" src="mytemplate/imgFolder/back btn.png">
									</button>
								</div>
								<div class="hw_template-button">
									<button class="hw_preview" data-target="#layer2">テンプレート</button>
									<button>アンケート</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="pagination">
					<c:if test="${currentPage > 1}">
						<a href="mytemplateController?page=${currentPage - 1}"><</a>
					</c:if>
					<c:forEach begin="1" end="${totalPages}" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span>${i}</span>
							</c:when>
							<c:otherwise>
								<a href="mytemplateController?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage < totalPages}">
						<a href="mytemplateController?page=${currentPage + 1}">></a>
					</c:if>
				</div>
				<a href="#page_top"><img
					src="mytemplate/imgFolder/top_button.png" class="top_button"></a>
			</main>
		</div>
	</form>

	<!-- 팝업 창 HTML -->
	<div id="popup" class="popup">
		<div class="popup-content">
			<span class="close-btn" onclick="hidePopup()">&times;</span> <input
				type="text" id="popup-url" readonly>
			<button onclick="copyToClipboard()">URL 복사</button>
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const currentPage = $
			{
				currentPage
			}
			;
			const bodyElement = document.getElementById('page_top');
			if (currentPage > 1) {
				bodyElement.classList.remove('background-image');
			} else {
				bodyElement.classList.add('background-image');
			}
		});
	</script>
</body>
</html>
