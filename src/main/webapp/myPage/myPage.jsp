<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.enmusubi.member.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>会員情報</title>

<link rel="stylesheet" type="text/css" href="myPage/mypage.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
.swal2-popup {
	background-color: #FFF5F4 !important; /* 배경색 설정 */
}

.swal2-confirm {
	background-color: #FF4C50 !important; /* 원하는 색상 코드로 변경 */
	color: white !important; /* 텍스트 색상 */
}
</style>
</head>

<body class="hs_body">
	<c:if test="${not empty dto}">

		<div class="hs_background">

			<div class="yj-main-s2-logo">
				<img class="yj-main-s2-logo img" alt=""
					src="loginPage/ImgFolder/Logo.png">
			</div>
			<div class="yj-main-s2-menu">
				<img class="yj-main-s2-menu img" alt=""
					src="loginPage/ImgFolder/default_menu_1.png">
			</div>
			<div class="hs_title">会員情報</div>

			<div class="hs_mypage-menus">
				<div class="hs_btn-container">
					<a href="MemberDetailC" class="hs_btn me">✿ 会員情報 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				<div class="hs_btn-container">
					<a href="#" class="hs_btn ">✿ テンプレート管理 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				<div class="hs_btn-container">
					<a href="#" class="hs_btn ">✿ 心からのお伝え ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				<div class="hs_btn-container">
					<a href="#" class="hs_btn ">✿ 会リスト ✿</a> <img class="yellow_line"
						alt="" src="loginPage/ImgFolder/yellow_line.png">
				</div>
			</div>

			<div class="hs_container">

				<div class="hs_content-title-account">
					<div class="hs_content-title-text">アカウント情報</div>
				</div>


				<div class="hs_container-input">
					<div class="hs_content-input id">
						<div class="hs_content-text id">ID</div>
						<div class="hs_output">${dto.m_id}</div>
					</div>
				</div>

				<div class="hs_content-title-user">
					<div class="hs_content-title-text">ユーザー情報</div>
				</div>

				<div class="hs_container-input">
					<div class="hs_content-input name">
						<div class="hs_content-text name">名前</div>
						<div class="hs_output">${dto.m_name}</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text kana">フリガナ</div>
						<div class="hs_output">${dto.m_name_kana}</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text rome">名前(ローマ字)</div>
						<div class="hs_output">${dto.m_name_rome}</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text gender">性別</div>
						<div class="hs_output">${dto.m_gender}</div>
					</div>

					<fmt:parseDate value="${dto.m_birth}" pattern="yyyy-MM-dd"
						var="parsedDate" />
					<div class="hs_content-input">
						<div class="hs_content-text birth">生年月日</div>
						<fmt:formatDate value="${parsedDate}" pattern="yyyy年 MM月 dd日" />
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text email">メールアドレス</div>
						<div class="hs_output">${dto.m_email}</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text phone">電話番号</div>
						<div class="hs_output">${dto.m_phone}</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text post">郵便番号</div>
						<div class="hs_content-text postmark">〒 ${dto.a_postcode}</div>

					</div>

					<c:set var="addressParts" value="${fn:split(dto.a_address, ', ')}" />
					<div class="hs_content-input">
						<label for="a_prefecture" class="hs_content-text prefecture">都道府県</label>
						<div class="hs_output prefecture">${addressParts[0]}</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text city">住所</div>
						<div class="hs_output">${addressParts[1]}</div>
					</div>

					<div class="hs_content-input">
						<div class="hs_content-text street"></div>
						<div class="hs_output">${addressParts[2]}</div>
					</div>

					<div class="hs_content-input building">
						<div class="hs_content-text building"></div>
						<div class="hs_output">${addressParts[3]}</div>
					</div>

					<div class="btn-box">
						<button type="button" class="btn update" onclick="redirectToUpdate()">会員情報修正</button>
						<form id="deleteForm" action="MemberDeleteC" method="post">
							<button type="button" onclick="confirmDelete()"
								class="btn delete">アカウント削除</button>
						</form>
					</div>
				</div>
			</div>

			<footer class="hs_footer">
				<img alt="" src="regPage/ImgFolder/top_button.png"
					class="top-button">
				<div class="hs_footer-background"></div>
			</footer>
		</div>
	</c:if>

	<script>
	function redirectToUpdate() {
	    window.location.href = "MemberUpdateC";
	}
	
	function confirmDelete() {
        Swal.fire({
            icon: 'warning',
            title: '本当に削除しますか？',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            },
            showCancelButton: true,
            confirmButtonText: '削除',
            cancelButtonText: 'キャンセル'
        }).then((result) => {
            if (result.isConfirmed) {
                // 확인 버튼이 클릭된 경우
                document.getElementById('deleteForm').submit(); // 폼 제출
            } else {
                // 취소 버튼이 클릭된 경우
                // 아무 작업 없음
            }
        });
    }
	
	document.addEventListener("DOMContentLoaded", function() {
	    const topButton = document.querySelector('.top-button');
	    
	    topButton.addEventListener('click', function() {
	        window.scrollTo({
	            top: 0,
	            behavior: 'smooth' // 부드러운 스크롤
	        });
	    });
	});
    </script>
</body>
</html>