<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>메인 페이지</title>
</head>
<body>
    <h2>메인 페이지</h2>
 <c:choose>
        <c:when test="${not empty sessionScope.m_name}">
            <p>환영합니다, ${sessionScope.m_name}님!</p>
            <a href="MemberDetailC"> <button>마이페이지</button></a>
            <form action="MemberLogoutC" method="post"> 
                <input type="submit" value="로그아웃">
            </form>
            <a href="main.jsp"><button>메인으로</button></a>
        </c:when>
        <c:otherwise>
            <a href="MemberC"><button>로그인</button></a>
            <a href="MemberRegC"><button>회원가입</button></a>
            <a href="main.jsp"><button>메인으로</button></a>
        </c:otherwise>
    </c:choose>
</body>
</html>
