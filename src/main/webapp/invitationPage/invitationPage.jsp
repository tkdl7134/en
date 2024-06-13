<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초대 관리 페이지</title>
<link rel="stylesheet" href="invitationPage/invitationPage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<body id="page_top">
	<form action="InvitationController" method="post">
		<div class="hw_container">
			<div class="hw_up_img">
				<header class="hw_invitation_header">
					<a href="main.jsp"> <img
						src="invitationPage/imgFolder/logo.png" alt="logo" class="logo"></a>
					<div class="hw_title">
						<h1>アンケート 管理</h1>
					</div>
					<a href="main.jsp"> <img
						src="invitationPage/imgFolder/menu_btn.png" alt="메뉴" class="menu"></a>
				</header>

				<main class="hw_invitation_main">
					<div class="hw_card">
						<img alt="hw_cardimg"
							src="invitationPage/imgFolder/wedding_chapel.png">
						<h2 class="hw_card_message">✿いただいたアンケートの回答です。どうぞその気持ちをご確認ください✿</h2>
					</div>
					<!-- 출석 탭 영역 -->
					<div class="hw_content">
						<div class="hw_tab_header">
							<h3 class="hw_tab_title">出席の方</h3>
							<ul class="tab_bnt">
								<li class="hw_tab__item active"><a href="#tabYes">名前順</a></li>
								<li class="hw_tab__item"><a href="#tabYesMale">新郎側</a></li>
								<li class="hw_tab__item"><a href="#tabYesFemale">新婦側</a></li>
							</ul>
						</div>
						<!-- 탭 내용 영역 -->
						<div class="hw_tab_content-wrapper">
							<div id="tabYes" class="hw_tab_content active">
								<div class="styled-table-wrapper">
									<div class="hw_invitation_title">
										<span class="hw_invitation_small">名前</span> <span
											class="hw_invitation_small">ゲスト</span> <span
											class="hw_invitation_middie">電話番号</span> <span
											class="hw_invitation_big">メール</span>
									</div>
									<c:forEach var="invitation" items="${invitationsYes}">
										<div class="hw_invitation_content">
											<span class="hw_invitation_small">${invitation.m_name}</span>
											<span class="hw_invitation_small">${invitation.g_guest_type}</span>
											<span class="hw_invitation_middie">${invitation.m_phone}</span>
											<span class="hw_invitation_big">${invitation.m_email}</span>
										</div>
									</c:forEach>
								</div>
							</div>
							<div id="tabYesMale" class="hw_tab_content">
								<div class="styled-table-wrapper">
									<div class="hw_invitation_title">
										<span class="hw_invitation_small">名前</span> <span
											class="hw_invitation_small">ゲスト</span> <span
											class="hw_invitation_middie">電話番号</span> <span
											class="hw_invitation_big">メール</span>
									</div>
									<c:forEach var="invitation" items="${invitationsYesMale}">
										<div class="hw_invitation_content">
											<span class="hw_invitation_small">${invitation.m_name}</span>
											<span class="hw_invitation_small">${invitation.g_guest_type}</span>
											<span class="hw_invitation_middie">${invitation.m_phone}</span>
											<span class="hw_invitation_big">${invitation.m_email}</span>
										</div>
									</c:forEach>
								</div>
							</div>
							<div id="tabYesFemale" class="hw_tab_content">
								<div class="styled-table-wrapper">
									<div class="hw_invitation_title">
										<span class="hw_invitation_small">名前</span> <span
											class="hw_invitation_small">ゲスト</span> <span
											class="hw_invitation_middie">電話番号</span> <span
											class="hw_invitation_big">メール</span>
									</div>
									<c:forEach var="invitation" items="${invitationsYesFemale}">
										<div class="hw_invitation_content">
											<span class="hw_invitation_small">${invitation.m_name}</span>
											<span class="hw_invitation_small">${invitation.g_guest_type}</span>
											<span class="hw_invitation_middie">${invitation.m_phone}</span>
											<span class="hw_invitation_big">${invitation.m_email}</span>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
			</div>
			<!-- 출석 특기사항 영역 -->

			<div class="hw_content_detail">
				<div class="hw_tab_header">
					<h3 class="hw_tab_title">出席の方特記事項</h3>
					<button type="button" class="hw_more_button">クリック</button>
				</div>
				<!-- 특기사항 내용 영역 -->
				<div class="hw_detail_wrapper" style="display: none;">
					<div class="styled-table-wrapper">
						<div class="hw_invitation_title">
							<span class="hw_invitation_small">名前</span> <span
								class="hw_invitation_middie">同伴人数</span> <span
								class="hw_invitation_big">アレルギー ・ 要請事項</span>
						</div>
						<c:forEach var="invitation" items="${invitationsYes}"
							varStatus="status">
							<div class="hw_invitation_content">
								<span class="hw_invitation_small">${invitation.m_name}</span> <span
									class="hw_invitation_middie"> 大人:
									${invitation.p_numberof[0]} 子供: ${invitation.p_numberof[1]} 幼児:
									${invitation.p_numberof[2]} </span> <span class="hw_invitation_big">${invitation.allergy}${invitation.g_message}</span>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 결석 탭 영역 -->
			<div class="hw_down_img">
				<div class="hw_content_absent">
					<div class="hw_tab_header">
						<h3 class="hw_tab_title">欠席の方</h3>
						<ul class="tab_bnt">
							<li class="hw_tab__item active"><a href="#tabNo">名前順</a></li>
							<li class="hw_tab__item"><a href="#tabNoMale">新郎側</a></li>
							<li class="hw_tab__item"><a href="#tabNoFemale">新婦側</a></li>
						</ul>
					</div>
					<!-- 탭 내용 영역 -->
					<div class="hw_tab_content-wrapper">
						<div id="tabNo" class="hw_tab_content active">
							<div class="styled-table-wrapper">
								<div class="hw_invitation_title">
									<span class="hw_invitation_small">名前</span> <span
										class="hw_invitation_small">ゲスト</span> <span
										class="hw_invitation_middie">電話番号</span> <span
										class="hw_invitation_big">メール</span>
								</div>
								<c:forEach var="invitation" items="${invitationsNo}">
									<div class="hw_invitation_content">
										<span class="hw_invitation_small">${invitation.m_name}</span>
										<span class="hw_invitation_small">${invitation.g_guest_type}</span>
										<span class="hw_invitation_middie">${invitation.m_phone}</span>
										<span class="hw_invitation_big">${invitation.m_email}</span>
									</div>
								</c:forEach>
							</div>
						</div>
						<div id="tabNoMale" class="hw_tab_content">
							<div class="styled-table-wrapper">
								<div class="hw_invitation_title">
									<span class="hw_invitation_small">名前</span> <span
										class="hw_invitation_small">ゲスト</span> <span
										class="hw_invitation_middie">電話番号</span> <span
										class="hw_invitation_big">メール</span>
								</div>
								<c:forEach var="invitation" items="${invitationsNoMale}">
									<div class="hw_invitation_content">
										<span class="hw_invitation_small">${invitation.m_name}</span>
										<span class="hw_invitation_small">${invitation.g_guest_type}</span>
										<span class="hw_invitation_middie">${invitation.m_phone}</span>
										<span class="hw_invitation_big">${invitation.m_email}</span>
									</div>
								</c:forEach>
							</div>
						</div>
						<div id="tabNoFemale" class="hw_tab_content">
							<div class="styled-table-wrapper">
								<div class="hw_invitation_title">
									<span class="hw_invitation_small">名前</span> <span
										class="hw_invitation_small">ゲスト</span> <span
										class="hw_invitation_middie">電話番号</span> <span
										class="hw_invitation_big">メール</span>
								</div>
								<c:forEach var="invitation" items="${invitationsNoFemale}">
									<div class="hw_invitation_content">
										<span class="hw_invitation_small">${invitation.m_name}</span>
										<span class="hw_invitation_small">${invitation.g_guest_type}</span>
										<span class="hw_invitation_middie">${invitation.m_phone}</span>
										<span class="hw_invitation_big">${invitation.m_email}</span>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<a href="#page_top"><img
					src="invitationPage/imgFolder/top_button.png" class="top_button"></a>
			</div>
			</main>
		</div>
		<!-- 마우스 아이콘 -->
		<div class="hw-f-mousemove hw-f-none">
			<img src="invitationPage/imgFolder/back_btn.png" alt="마우스 아이콘">
		</div>
	</form>
</body>
</html>
