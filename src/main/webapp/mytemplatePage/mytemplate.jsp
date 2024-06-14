<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.enmusubi.mytemplate.TemplateDAO" %>
<%@ page import="com.enmusubi.mytemplate.TemplateDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>テンプレート 管理</title>
<link rel="stylesheet" href="mytemplatePage/mytemplate.css">
<script type="text/javascript" src="mytemplatePage/mytemplate.js"></script>
</head>
<body>
    <%
        // TemplateDAO를 사용하여 템플릿 데이터를 가져옴
        TemplateDAO dao = TemplateDAO.getIdao();
        dao.getTemplateDetails(request);
    %>
    <form action="TemplateC">
        <div class="hw_container"></div>
        <header class="hw_Template_header">
            <a class="hw_logo" href="main.jsp"><img src="mytemplatePage/imgFolder/logo.png"
                alt="logo" class="logo"></a>
            <a class="hw_template_title"><img alt="" src="mytemplatePage/imgFolder/template_title.png"></a>
            <a class="hw_menu" href="main.jsp"><img src="mytemplatePage/imgFolder/menu_btn.png" alt="menu" class="menu"></a>
        </header>
        <main>
            <c:forEach var="template" items="${templates}">
                <div>
                    <div>
                        <img alt="" src="mytemplatePage/imgFolder/content.png">${template.t_preview}
                    </div>
                    <div class="connection_btn">
                        <button type="button" onclick="location.href='TemplateC'">テンプレート</button>
                        <button type="button" onclick="location.href='InvitationController'">アンケート</button>
                    </div>
                </div>
            </c:forEach>
        </main>
    </form>
</body>
</html>
