<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>メインページ</title>
    <!-- CSSファイルのリンク -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>ようこそ、メインページへ！</h1>
        <nav>
            <ul>
                <li><a href="main.jsp">ホーム</a></li>
                <li><a href="loginPage/login.jsp">ログイン</a></li>
                <li><a href="regPage/reg.jsp">ユーザー登録</a></li>
            </ul>
        </nav>
    </header>
    
    <footer>
        <p>&copy; 2024 メインページ. All Rights Reserved.</p>
    </footer>
</body>
</html>