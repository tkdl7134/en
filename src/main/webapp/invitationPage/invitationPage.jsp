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

			<header class="hw_invitation_header">
				<a href="main.jsp"> <img src="invitationPage/imgFolder/logo.png"
					alt="로고" class="logo"></a>
				<div class="hw_title">
					<h1>アンケート 管理</h1>
				</div>
				<a href="main.jsp"> <img
					src="invitationPage/imgFolder/menu_btn.png" alt="로고" class="menu"></a>
			</header>

			<main class="hw_invitation_main">
				<div class="hw_card">
					<img alt="hw_cardimg"
						src="invitationPage/imgFolder/wedding_chapel.png">
					<h2 class="hw_card_message">
						✿いただいたアンケートの回答です。どうぞその気持ちをご確認ください✿</h2>
				</div>
				<!-- 출석 탭 영역 -->
				<div class="hw_content">
					<div class="hw_tab_header">
						<h3 class="hw_tab_title">出席の方</h3>
						<ul class="tab_bnt">
							<li class="hw_tab__item active"><a href="#tab1">名前順</a></li>
							<li class="hw_tab__item"><a href="#tab2">新郎側</a></li>
							<li class="hw_tab__item"><a href="#tab3">新婦側</a></li>
						</ul>
					</div>
					<!-- 탭 내용 영역 -->
					<div class="hw_tab_content-wrapper">
						<div id="tab1" class="hw_tab_content active">
							<table class="styled-table">
								<thead>
									<tr>
										<th>名前</th>
										<th>ゲスト</th>
										<th>電話番号</th>
										<th>メール</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invitation" items="${invitations}">
										<tr>
											<td>${invitation.m_name}</td>
											<td>${invitation.g_guest_type}</td>
											<td>${invitation.m_phone}</td>
											<td>${invitation.m_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tab2" class="hw_tab_content">
							<table class="styled-table">
								<thead>
									<tr>
										<th>名前</th>
										<th>ゲスト</th>
										<th>電話番号</th>
										<th>メール</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invitation" items="${invitations}">
										<tr>
											<td>${invitation.m_name}</td>
											<td>${invitation.g_guest_type}</td>
											<td>${invitation.m_phone}</td>
											<td>${invitation.m_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tab3" class="hw_tab_content">
							<table class="styled-table">
								<thead>
									<tr>
										<th>名前</th>
										<th>ゲスト</th>
										<th>電話番号</th>
										<th>メール</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invitation" items="${invitations}">
										<tr>
											<td>${invitation.m_name}</td>
											<td>${invitation.g_guest_type}</td>
											<td>${invitation.m_phone}</td>
											<td>${invitation.m_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
						<table class="styled-table">
							<thead>
								<tr>
									<th>名前</th>
									<th>同伴人数</th>
									<th>アレルギー ・ 特記事項</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="invitation" items="${invitations}">
									<tr>
										<td>${invitation.m_name}</td>
										<td>${invitation.g_age_type}</td>
										<td>${invitation.allergy}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 결석 탭 영역 -->
				<div class="hw_content_absent">
					<div class="hw_tab_header">
						<h3 class="hw_tab_title">欠席の方</h3>
						<ul class="tab_bnt">
							<li class="hw_tab__item active"><a href="#tab1">名前順</a></li>
							<li class="hw_tab__item"><a href="#tab2">新郎側</a></li>
							<li class="hw_tab__item"><a href="#tab3">新婦側</a></li>
						</ul>
					</div>
					<!-- 탭 내용 영역 -->
					<div class="hw_tab_content-wrapper">
						<div id="tab1" class="hw_tab_content active">
							<table class="styled-table">
								<thead>
									<tr>
										<th>名前</th>
										<th>ゲスト</th>
										<th>電話番号</th>
										<th>メール</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invitation" items="${invitations}">
										<tr>
											<td>${invitation.m_name}</td>
											<td>${invitation.g_guest_type}</td>
											<td>${invitation.m_phone}</td>
											<td>${invitation.m_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tab2" class="hw_tab_content">
							<table class="styled-table">
								<thead>
									<tr>
										<th>名前</th>
										<th>ゲスト</th>
										<th>電話番号</th>
										<th>メール</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invitation" items="${invitations}">
										<tr>
											<td>${invitation.m_name}</td>
											<td>${invitation.g_guest_type}</td>
											<td>${invitation.m_phone}</td>
											<td>${invitation.m_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tab3" class="hw_tab_content">
							<table class="styled-table">
								<thead>
									<tr>
										<th>名前</th>
										<th>ゲスト</th>
										<th>電話番号</th>
										<th>メール</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="invitation" items="${invitations}">
										<tr>
											<td>${invitation.m_name}</td>
											<td>${invitation.g_guest_type}</td>
											<td>${invitation.m_phone}</td>
											<td>${invitation.m_email}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<a href="#page_top"><img
					src="invitationPage/imgFolder/top_button.png" class="top_button"></a>
			</main>

		</div>
	</form>
</body>
</html>
