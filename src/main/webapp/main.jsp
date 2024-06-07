<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인 페이지</title>
</head>
<body>
    <h2>메인 페이지</h2>

<<<<<<< HEAD
	<%
	// 사용자 ID를 세션에서 가져오기
	String userID = null;

	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>

	<!-- 네비게이션 바 설정 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="main.jsp">JSP掲示板ウェブサイト</a>
			<div class="d-flex">
				<a class="nav-link me-3" href="main.jsp">メイン</a> <a class="nav-link"
					href="bbs.jsp">掲示板</a>
			</div>
			<!-- 로그인 상태에 따라 다른 드롭다운 메뉴 표시 -->
			<%
			if (userID == null) {
			%>
			<div class="ms-auto">
				<a class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> アクセス </a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuLink">
					<!-- 로그인 및 회원가입 링크 포함된 드롭다운 메뉴 -->
					<li><a class="dropdown-item" href="loginPage/loginPage.jsp">ログイン</a></li>
					<li><a class="dropdown-item" href="regPage/regPage.jsp">ユーザー登録</a></li>
				</ul>
			</div>
			<%
			} else {
			%>
			<div class="ms-auto">
				<a class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> ユーザー管理 </a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuLink">
					<!-- 로그아웃 링크 포함된 드롭다운 메뉴 -->
					<li><a class="dropdown-item" href="logoutAction.jsp">ログアウト</a></li>
				</ul>
			</div>

			<%
			}
			%>
		</div>
	</nav>

	<%-- メインコンテンツ --%>
	<div style="max-width: 1024px; margin: 0 auto;">
		<div class="container p-5 bg-light rounded-3 mt-5 mb-5">
			<h1>サイト紹介</h1>
			<p>
 			</p>
			<p>
				<a href="https://github.com/chs4649/JSP-Board.git"
					class="btn btn-primary" role="button">詳しく</a>
			</p>
		</div>
		<%-- 写真帳 --%>
		<div class="container mb-5">
			<div class="slider">
				<div>
					<img src="https://cdn.pixabay.com/photo/2024/05/20/17/33/sky-8775846_960_720.png">
				</div>
				<div>
					<img src="https://cdn.pixabay.com/photo/2023/09/02/03/15/water-8228076_1280.jpg">
				</div>
				<div>
					<img src="https://cdn.pixabay.com/photo/2024/05/15/12/31/lake-8763490_1280.jpg">
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap JS 링크 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
=======
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
>>>>>>> 87c6864a34ba4da16044bda5e95607c995e8d4a2
</body>
</html>
