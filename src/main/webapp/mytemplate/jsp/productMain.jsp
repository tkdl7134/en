<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アンケート 管理</title>
<link rel="stylesheet" href="mytemplate/css/productMain.css">
<script type="text/javascript" src="mytemplate/js/productMain.js"></script>
</head>
<body id="page_top" class="background-image">
    <form action="ProductController" method="post">
        <canvas id="canvas1"></canvas>
        <div class="hw_container">
            <header class="hw_invitation_header">
                <a class="hw_logo" href="main.jsp"><img
                    src="invitationPage/imgFolder/logo.png" alt="logo"></a> <a
                    class="hw_menu" href="main.jsp"><img
                    src="invitationPage/imgFolder/menu_btn.png" alt="메뉴"></a>
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
                <div class="je_product-page-content">
                        <c:forEach var="product" items="${products}" varStatus="status">
                        ${product }
                    <div class="je_page-content">
                            <div class="je_page-content-template">
                                <div class="je_template-img">
                                <img src="mytemplate/imgFolder/${product.t_preview }" alt="" />
                                    <div>
                                        <div class="je_template-img-line-red-big"></div>
                                        <div class="je_template-img-line-red-small"></div>
                                    </div>
                                </div>
                                <div class="je_template-title">${product.t_title}</div>
                                <div class="je_template-button">
                                    <button class="je_preview" data-target="#layer2">見本</button>
                                    <button>制作</button>
                                </div>
                            </div>
                                </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="mytemplateController?page=${currentPage - 1}">&laquo; Previous</a>
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
                        <a href="mytemplateController?page=${currentPage + 1}">Next &raquo;</a>
                    </c:if>
                </div>
            </main>
        </div>
    </form>
</body>
</html>
