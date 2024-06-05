<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인 페이지</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>메인 페이지</h2>

    <%
        String m_name = (String) session.getAttribute("m_name");
        if (m_name != null) {
            // 로그인된 경우
    %>
            <p>환영합니다, <%= m_name %>님!</p>
            <a href="MemberDetailC"> <button>마이페이지</button></a>
            <form action="MemberLogoutC" method="post"> 
                <input type="submit" value="로그아웃">
            </form>
            <a href="main.jsp"><button>메인으로</button></a>
    <%
        } else {
            // 로그인되지 않은 경우
    %>
            <a href="MemberC"><button>로그인</button></a>
            <a href="MemberRegC"><button>회원가입</button></a>
            <a href="main.jsp"><button>메인으로</button></a>
    <%
        }
    %>
</body>
</html>
