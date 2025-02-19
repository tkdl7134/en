<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>アンケート管理</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="invitationPage/invitationPage.css">
<script type="text/javascript" src="invitationPage/invitationPage.js"></script>
</head>
<body id="page_top" class="background-image">

<div class="yj-main-section" id="yj-main-s2">

    <div class="yj-main-logo">
        <a href="#" class="mainLogo"><img
            src="main/imgFolder/yj-main-logo.png" alt="섹션2 로고" /></a>
    </div>

    <jsp:include page="${mainNav }" />
</div>
<h1 class="hw_pagetitle">アンケート管理</h1>
<form id="invitationForm" action="InvitationController" method="post">
    <input type="hidden" name="e_no" value="${param.e_no}" />
    <div class="hw_container">
        <main class="hw_invitation_main">
            <div class="hw_card">
                <img alt="hw_cardimg" src="invitationPage/imgFolder/wedding_chapel.jpg">
                <h2 class="hw_card_message">✿いただいたアンケートの回答です。どうぞその気持ちをご確認ください✿</h2>
                <img alt="Line" src="invitationPage/imgFolder/Line.png">
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
                                <span class="hw_invitation_small">名前</span>
                                <span class="hw_invitation_small">ゲスト</span>
                                <span class="hw_invitation_middie">電話番号</span>
                                <span class="hw_invitation_big">メール</span>
                            </div>
                            <c:forEach var="invitation" items="${invitationsYes}">
                                <div class="hw_invitation_content">
                                    <span class="hw_invitation_small">${invitation.m_name}</span>
                                    <span class="hw_invitation_small">${invitation.g_guest_type}</span>
                                    <span class="hw_invitation_middie">${invitation.formattedPhone}</span>
                                    <span class="hw_invitation_big">${invitation.m_email}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="tabYesMale" class="hw_tab_content">
                        <div class="styled-table-wrapper">
                            <div class="hw_invitation_title">
                                <span class="hw_invitation_small">名前</span>
                                <span class="hw_invitation_small">ゲスト</span>
                                <span class="hw_invitation_middie">電話番号</span>
                                <span class="hw_invitation_big">メール</span>
                            </div>
                            <c:forEach var="invitation" items="${invitationsYesMale}">
                                <div class="hw_invitation_content">
                                    <span class="hw_invitation_small">${invitation.m_name}</span>
                                    <span class="hw_invitation_small">${invitation.g_guest_type}</span>
                                    <span class="hw_invitation_middie">${invitation.formattedPhone}</span>
                                    <span class="hw_invitation_big">${invitation.m_email}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="tabYesFemale" class="hw_tab_content">
                        <div class="styled-table-wrapper">
                            <div class="hw_invitation_title">
                                <span class="hw_invitation_small">名前</span>
                                <span class="hw_invitation_small">ゲスト</span>
                                <span class="hw_invitation_middie">電話番号</span>
                                <span class="hw_invitation_big">メール</span>
                            </div>
                            <c:forEach var="invitation" items="${invitationsYesFemale}">
                                <div class="hw_invitation_content">
                                    <span class="hw_invitation_small">${invitation.m_name}</span>
                                    <span class="hw_invitation_small">${invitation.g_guest_type}</span>
                                    <span class="hw_invitation_middie">${invitation.formattedPhone}</span>
                                    <span class="hw_invitation_big">${invitation.m_email}</span>
                                </div>
                            </c:forEach>
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
                            <span class="hw_invitation_small">名前</span>
                            <span class="hw_invitation_middie">同伴人数</span>
                            <span class="hw_invitation_big">アレルギー ・ 要請事項</span>
                        </div>
                        <c:forEach var="invitation" items="${invitationsYes}" varStatus="status">
                        
                        <div class="hw_invitation_content">
									 <span class="hw_invitation_small">${invitation.m_name}</span>
                                <span class="hw_invitation_middie">大人: ${invitation.p_adult} 子供: ${invitation.p_child} 幼児: ${invitation.p_baby}</span>
									<span class="hw_invitation_big"> <c:choose>
											<c:when test="${not empty invitation.allergy}">
                ${invitation.allergy}・${invitation.g_message}
            </c:when>
											<c:otherwise>
                ${invitation.g_message}
            </c:otherwise>
										</c:choose>
									</span>
								</div>
                        
                        
                        
                         
                            
                            
                            
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- 결석 탭 영역 -->
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
                                <span class="hw_invitation_small">名前</span>
                                <span class="hw_invitation_small">ゲスト</span>
                                <span class="hw_invitation_middie">電話番号</span>
                                <span class="hw_invitation_big">メール</span>
                            </div>
                            <c:forEach var="invitation" items="${invitationsNo}">
                                <div class="hw_invitation_content">
                                    <span class="hw_invitation_small">${invitation.m_name}</span>
                                    <span class="hw_invitation_small">${invitation.g_guest_type}</span>
                                    <span class="hw_invitation_middie">${invitation.formattedPhone}</span>
                                    <span class="hw_invitation_big">${invitation.m_email}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="tabNoMale" class="hw_tab_content">
                        <div class="styled-table-wrapper">
                            <div class="hw_invitation_title">
                                <span class="hw_invitation_small">名前</span>
                                <span class="hw_invitation_small">ゲスト</span>
                                <span class="hw_invitation_middie">電話番号</span>
                                <span class="hw_invitation_big">メール</span>
                            </div>
                            <c:forEach var="invitation" items="${invitationsNoMale}">
                                <div class="hw_invitation_content">
                                    <span class="hw_invitation_small">${invitation.m_name}</span>
                                    <span class="hw_invitation_small">${invitation.g_guest_type}</span>
                                    <span class="hw_invitation_middie">${invitation.formattedPhone}</span>
                                    <span class="hw_invitation_big">${invitation.m_email}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="hw_down_img">
                        <div id="tabNoFemale" class="hw_tab_content">
                            <div class="styled-table-wrapper">
                                <div class="hw_invitation_title">
                                    <span class="hw_invitation_small">名前</span>
                                    <span class="hw_invitation_small">ゲスト</span>
                                    <span class="hw_invitation_middie">電話番号</span>
                                    <span class="hw_invitation_big">メール</span>
                                </div>
                                <c:forEach var="invitation" items="${invitationsNoFemale}">
                                    <div class="hw_invitation_content">
                                        <span class="hw_invitation_small">${invitation.m_name}</span>
                                        <span class="hw_invitation_small">${invitation.g_guest_type}</span>
                                        <span class="hw_invitation_middie">${invitation.formattedPhone}</span>
                                        <span class="hw_invitation_big">${invitation.m_email}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#page_top">
                <div class="top_button">
                    <img src="invitationPage/imgFolder/top_button.png">
                </div>
            </a>
        </main>
    </div>
</form>
<!-- 마우스 아이콘 -->
<div class="hw-f-mousemove hw-f-none">
    <img src="invitationPage/imgFolder/back_btn.png" alt="마우스 아이콘">
</div>
<input type="hidden" id="currentPage" value="${currentPage}" />
<div class="hw_bottom"></div>
</body>
</html>
