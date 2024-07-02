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
<link rel="stylesheet" type="text/css" href="main/main.css">
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
	background-color: #FFF5F4 !important;
	/* 배경색 설정 */
}

.swal2-confirm {
	background-color: #FF4C50 !important;
	/* 원하는 색상 코드로 변경 */
	color: white !important;
	/* 텍스트 색상 */
}

body {
	-webkit-user-select: none;
	/* Chrome, Safari */
	-moz-user-select: none;
	/* Firefox */
	-ms-user-select: none;
	/* Internet Explorer/Edge */
	user-select: none;
	/* 표준 */
}

.yj-main-logo {
    z-index: 4;
    width: 130px;
    height: 130px;
    position: fixed;
    top: 4rem;
    left: 5rem;
}

.yj-main-menubox {
    position: fixed;
    top: 6rem;
    right: 5rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 175px;
}

</style>
</head>

<body class="hs_body">
	<c:if test="${not empty dto}">

		<div class="hs_background">

			<div class="yj-main-logo">
			<a href="MainC" class="mainLogo"><img
				src="main/imgFolder/yj-main-logo.png" alt="섹션2 로고" /></a>
		</div>
		
		<jsp:include page="${mainNav }" />
		
			<h1 class="hs_title">会員情報</h1>

			<div class="hs_mypage-menus">
				<div class="hs_btn-container">
					<a href="MemberDetailC" class="hs_btn me">✿ 会員情報 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				<div class="hs_btn-container">
					<a href="mytemplateController" class="hs_btn ">✿ テンプレート管理 ✿</a> <img
						class="yellow_line" alt=""
						src="loginPage/ImgFolder/yellow_line.png">
				</div>
				
				<div class="hs_btn-container">
					<a href="MyMeetingC" class="hs_btn ">✿ 会リスト ✿</a> <img class="yellow_line"
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
						<div class="hs_output" id="display_id">${dto.m_id}</div>
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

					<c:set var="addressParts" value="${fn:split(dto.a_address, ' ')}" />
					<div class="hs_content-input">
						<label for="a_prefecture" class="hs_content-text prefecture">都道府県</label>
						<div class="hs_output prefecture" id="displayPrefecture">${addressParts[0]}</div>
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
						<button type="button" class="btn update"
							onclick="redirectToUpdate()">会員情報修正</button>
						<form id="deleteForm" action="MemberDeleteC" method="post">
							<button type="button" onclick="confirmDelete()"
								class="btn delete">アカウント削除</button>
						</form>
					</div>
				</div>
			</div>

			<div class="hs_footer">
				<img alt="" src="regPage/ImgFolder/top_button.png"
					class="top-button">
				<div class="hs_footer-background"></div>
			</div>
		</div>
	</c:if>

	<script>
	const menus = document.querySelectorAll(".yj-main-menu");

	menus.forEach((menu) => {
		const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");
		const navi = menu.parentElement.querySelector(".yj-main-nav");
		menu.addEventListener("click", function() {
			console.log(menu);
			console.log(navi);
			const menuBtn = menu.querySelector("img");
			if (navi.classList.contains("nav-hidden")) {
				menuBtn.src = "main/imgFolder/yj-main-menu2.png";
				navi.classList.remove("nav-hidden");
				navi.classList.add("nav-show");
			} else {
				menuBtn.src = "main/imgFolder/yj-main-menu1.png";
				navi.classList.remove("nav-show");
				navi.classList.add("nav-hidden");
			}
		});
	});
	
	 document.addEventListener("DOMContentLoaded", function () {
	        var sessionAddress = "${addressParts[0]}";
	        var prefectureName = "";

	        switch (sessionAddress) {
	            case "1":
	                prefectureName = "北海道";
	                break;
	            case "2":
	                prefectureName = "青森県";
	                break;
	            case "3":
	                prefectureName = "岩手県";
	                break;
	            case "4":
	                prefectureName = "宮城県";
	                break;
	            case "5":
	                prefectureName = "秋田県";
	                break;
	            case "6":
	                prefectureName = "山形県";
	                break;
	            case "7":
	                prefectureName = "福島県";
	                break;
	            case "8":
	                prefectureName = "茨城県";
	                break;
	            case "9":
	                prefectureName = "栃木県";
	                break;
	            case "10":
	                prefectureName = "群馬県";
	                break;
	            case "11":
	                prefectureName = "埼玉県";
	                break;
	            case "12":
	                prefectureName = "千葉県";
	                break;
	            case "13":
	                prefectureName = "東京都";
	                break;
	            case "14":
	                prefectureName = "神奈川県";
	                break;
	            case "15":
	                prefectureName = "新潟県";
	                break;
	            case "16":
	                prefectureName = "富山県";
	                break;
	            case "17":
	                prefectureName = "石川県";
	                break;
	            case "18":
	                prefectureName = "福井県";
	                break;
	            case "19":
	                prefectureName = "山梨県";
	                break;
	            case "20":
	                prefectureName = "長野県";
	                break;
	            case "21":
	                prefectureName = "岐阜県";
	                break;
	            case "22":
	                prefectureName = "静岡県";
	                break;
	            case "23":
	                prefectureName = "愛知県";
	                break;
	            case "24":
	                prefectureName = "三重県";
	                break;
	            case "25":
	                prefectureName = "滋賀県";
	                break;
	            case "26":
	                prefectureName = "京都府";
	                break;
	            case "27":
	                prefectureName = "大阪府";
	                break;
	            case "28":
	                prefectureName = "兵庫県";
	                break;
	            case "29":
	                prefectureName = "奈良県";
	                break;
	            case "30":
	                prefectureName = "和歌山県";
	                break;
	            case "31":
	                prefectureName = "鳥取県";
	                break;
	            case "32":
	                prefectureName = "島根県";
	                break;
	            case "33":
	                prefectureName = "岡山県";
	                break;
	            case "34":
	                prefectureName = "広島県";
	                break;
	            case "35":
	                prefectureName = "山口県";
	                break;
	            case "36":
	                prefectureName = "徳島県";
	                break;
	            case "37":
	                prefectureName = "香川県";
	                break;
	            case "38":
	                prefectureName = "愛媛県";
	                break;
	            case "39":
	                prefectureName = "高知県";
	                break;
	            case "40":
	                prefectureName = "福岡県";
	                break;
	            case "41":
	                prefectureName = "佐賀県";
	                break;
	            case "42":
	                prefectureName = "長崎県";
	                break;
	            case "43":
	                prefectureName = "熊本県";
	                break;
	            case "44":
	                prefectureName = "大分県";
	                break;
	            case "45":
	                prefectureName = "宮崎県";
	                break;
	            case "46":
	                prefectureName = "鹿児島県";
	                break;
	            case "47":
	                prefectureName = "沖縄県";
	                break;
	            case "48":
	                prefectureName = "海外";
	                break;
	            default:
	                prefectureName = "選択してください";
	        }

	        // 結果を表示する
	        document.getElementById("displayPrefecture").textContent = prefectureName;
	    });
	
	
							document.addEventListener("DOMContentLoaded", function () {
								var sessionId = "${dto.m_id}";
								if (sessionId.startsWith("LINE_")) {
									sessionId = "LINE_USER";
								}
								document.getElementById("display_id").textContent = sessionId;
							});

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

							document.addEventListener("DOMContentLoaded", function () {
								const topButton = document.querySelector('.top-button');

								topButton.addEventListener('click', function () {
									window.scrollTo({
										top: 0,
										behavior: 'smooth' // 부드러운 스크롤
									});
								});
							});

						</script>
</body>

</html>