<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template Management</title>
<link rel="stylesheet" href="mytemplate/mytemplate.css">
<script type="text/javascript" src="mytemplate/js/mytemplate.js"></script>
</head>

<body id="page_top" class="hw_background_image">

    <header class="hw_head">
        <a class="hw_logo" href="main.jsp">
            <img src="mytemplate/imgFolder/logo.png" alt="logo">
        </a>
        <a class="hw_menu" href="main.jsp">
            <img src="mytemplate/imgFolder/menu_btn.png" alt="menu">
        </a>
        <h1 class="hw_page_title">テンプレート 管理</h1>
    </header>

    <form id="templateForm" action="mytemplateController" method="post">
        <div class="hw_container">
            <nav class="hw_menubar">
                <div class="hw_menubar_item">
                    <a class="hw_menubar_menu" href="javascript:void(0);" onclick="navigateToMemberUpdate()">✿ 会員情報 ✿</a>
                    <img class="hw_yellow_line" alt="" src="mytemplate/imgFolder/yellow_line.png">
                </div>
                <div class="hw_menubar_item">
                    <a class="hw_menubar_menu active" href="">✿ テンプレート管理 ✿</a>
                    <img class="hw_yellow_line" alt="" src="mytemplate/imgFolder/yellow_line.png">
                </div>
                <div class="hw_menubar_item">
                    <a class="hw_menubar_menu" href="">✿ 会リスト ✿</a>
                    <img class="hw_yellow_line" alt="" src="mytemplate/imgFolder/yellow_line.png">
                </div>
            </nav>

            <main class="hw_template_main">
                <div class="hw_product-page-content">
                    <div class="hw_page-content">
                        <c:forEach var="template" items="${templates}" varStatus="status">
                            <div class="hw_page-content-template">
                                <div class="hw_template-img">
                                    <img src="mytemplate/imgFolder/${template.w_img1}" alt="" />
                                    <div class="hw_template-button">
                                        <button class="hw_content_btn" type="button" onclick="submitToInvitationC('${template.e_no}')">テンプレート</button>
                                        <button class="hw_content_btn" type="button" onclick="sendToInvitation('${template.e_no}')">アンケート</button>
                                        <button class="hw_content_btn" type="button" onclick="sendENo('${template.e_no}')">通計</button>
                                    </div>
                                </div>
                                <button type="button" class="hw_share_btn" onclick="showPopup('${template.e_no}')">共有</button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="mytemplateController?page=${currentPage - 1}">&lt;</a>
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
                        <a href="mytemplateController?page=${currentPage + 1}">&gt;</a>
                    </c:if>
                </div>

                <input type="hidden" id="currentPage" value="${currentPage}" />

                <div class="hw_downimg">
                    <a href="#page_top">
                        <img src="mytemplate/imgFolder/top_button.png" class="top_button">
                    </a>
                </div>
            </main>
        </div>
    </form>

    <!-- 팝업 창 HTML -->
    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close-btn" onclick="hidePopup()">&times;</span>
            <input type="text" id="popup-url" readonly>
            <button onclick="copyToClipboard()">URL 복사</button>
        </div>
    </div>
    <script type="text/javascript" src="mytemplate/js/mytemplate.js"></script>
</body>
</html>
