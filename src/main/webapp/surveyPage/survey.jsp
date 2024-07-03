<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>設問調査</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="surveyPage/survey.css" />
<link rel="stylesheet" href="surveyPage/surveyCheckBox.css" />
<link rel="stylesheet" href="surveyPage/surveySelect.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200;400;700;900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<div class="survey-container">
		<div class="survey-container-img">
			<img src="surveyPage/imgFolder/surveyBackground-img.png"
				alt="surveyBackground-img"
				style="width: 100%; height: 100%; position: absolute; display: flex; width: 100%; flex-grow: 1; flex-direction: column; height: 100vh; z-index: 1; pointer-events: none;">
		</div>
		<header class="tk_survey_header">
			<div class="middle-title">
				<div>出席の方</div>
			</div>
			
		</header>

		<main class="tk_survey_main">
			<div class="main-content">
				<div class="main-content-words">
					<div>お手数ではございますが、ご出欠情報のご登録をお願い申し上げます。</div>
					<c:choose>
						<c:when test="${minus40Days == '日付 未定'}">
							<div style="margin-top: 0.5rem; font-weight: bold">結婚式の日付はまだ未確定です。</div>
						</c:when>
						<c:otherwise>
							<div style="margin-top: 0.5rem; font-weight: bold">${minus40Days}までにご返信をお願いいたします。</div>
						</c:otherwise>
					</c:choose>
					<div>
						<img src="surveyPage/imgFolder/pointline.png" alt="menu-button"
							style="width: 100%; height: 100%" />
					</div>
				</div>

				<form action="SurveyC" method="post" id="surveyForm">
					<div class="tg-include-btu-page">
						<div class="slider-navigation">
							<button type="button" class="prev-slide"><</button>
						</div>
						<div class="survey-input">
							<div>
								<div class="recMain-container">
									<div class="entry-box-img" data-selccted="yes">
										<div class="texts">
											<div>出席</div>
										</div>
										<img class="lines" alt=""
											src="surveyPage/imgFolder/yesline.png"> <input
											type="hidden" name="attendance" value="出席">
									</div>
									<div class="no-entry-box-img" data-selccted="no">
										<div class="texts">
											<div>欠席</div>
										</div>
										<img class="lines" alt=""
											src="surveyPage/imgFolder/noline.png"> <input
											type="hidden" name="attendance" value="欠席">
									</div>
								</div>
							</div>
							<div>
								<div class="tg-slide-page" id="slide-0">
									<div class="name-container">
										<fieldset>
											<legend>
												<div>
													<img src="surveyPage/imgFolder/flowersymbol.jpg"
														alt="flowersymbol" style="width: 100%; height: 100%" />
												</div>
												&nbsp&nbsp&nbsp
												<div style="font-size: 2rem;">お名前</div>
											</legend>
											<c:choose>
												<c:when test="${loginType == 'normal' }">
													<c:set var="members" value="${members }" />
													<label class="kanzi-container">
														<div style="font-size: 1.5rem;">名前</div> <input
														style="font-size: 1.2rem;" type="text"
														placeholder="First Name" class="name-input" id="name"
														name="name" required value="${members.m_first_name}"
														disabled="disabled" /> <input style="font-size: 1.2rem;"
														type="text" placeholder="Last Name" class="name-input"
														id="name" name="name" required
														value="${members.m_last_name}" disabled="disabled" />
													</label>
													<br>
													<label class="kata-container">
														<div style="font-size: 1.5rem;">フリガナ</div> <input
														style="font-size: 1.2rem;" type="text"
														placeholder="First Name" class="name-input" id="kataName"
														name="kata-name" required
														value="${members.m_first_name_kana}" disabled="disabled" />
														<input style="font-size: 1.2rem;" type="text"
														placeholder="Last Name" class="name-input" id="kataName"
														name="kata-name" required
														value="${members.m_last_name_kana}" disabled="disabled" />
													</label>
													<br>
													<label class="eng-container">
														<div style="font-size: 1.5rem;">ローマ字</div> <input
														style="font-size: 1.2rem;" type="text"
														placeholder="Last Name" class="name-input" id="romaName"
														name="roma-name" required
														value="${members.m_first_name_rome}" disabled="disabled" />
														<input style="font-size: 1.2rem;" type="text"
														placeholder="First Name" class="name-input" id="romaName"
														name="roma-name" required disabled="disabled"
														value="${members.m_last_name_rome}" />
													</label>
													<c:if test="${not empty members.m_first_name}">
														<div class="emergency-words" style="margin-top: 0.5rem">
															✿ 情報の修正が必要な場合は、マイページにてお願いします</div>
													</c:if>
												</c:when>
												<c:otherwise>
													<label class="kanzi-container">
														<div style="font-size: 1.5rem;">名前</div> <input
														style="font-size: 1.2rem;" type="text" placeholder="姓"
														class="name-input" id="name" name="name" required
														value="${members.m_first_name}"
														<c:if test="${members.m_first_name != 'no'}">disabled="disabled"</c:if> />
														<input style="font-size: 1.2rem;" type="text"
														placeholder="名" class="name-input" id="name" name="name"
														required value="${members.m_last_name}"
														<c:if test="${members.m_last_name != 'data'}">disabled="disabled"</c:if> />
													</label>
													<br>
													<label class="kata-container">
														<div style="font-size: 1.5rem;">フリガナ</div> <input
														style="font-size: 1.2rem;" type="text" placeholder="せい"
														class="name-input" id="kataName" name="kata-name" required
														value="${members.m_first_name_kana}"
														<c:if test="${members.m_first_name_kana != 'no'}">disabled="disabled"</c:if> />
														<input style="font-size: 1.2rem;" type="text"
														placeholder="めい" class="name-input" id="kataName"
														name="kata-name" required
														value="${members.m_last_name_kana}"
														<c:if test="${members.m_last_name_kana != 'data'}">disabled="disabled"</c:if> />
													</label>
													<br>
													<label class="eng-container">
														<div style="font-size: 1.5rem;">ローマ字</div> <input
														style="font-size: 1.2rem;" type="text"
														placeholder="Last Name" class="name-input" id="romaName"
														name="roma-name" required
														value="${members.m_last_name_rome}"
														<c:if test="${members.m_last_name_rome != 'data'}">disabled="disabled"</c:if> />
														<input style="font-size: 1.2rem;" type="text"
														placeholder="First Name" id="romaName" class="name-input"
														name="roma-name" required
														value="${members.m_first_name_rome}"
														<c:if test="${members.m_first_name_rome != 'no'}">disabled="disabled"</c:if> />
													</label>
													</br>
													<c:if test="${not empty members.m_first_name}">
														<div class="emergency-words" style="margin-top: 0.5rem">
															✿ 情報の修正が必要な場合は、マイページにてお願いします</div>
													</c:if>
												</c:otherwise>
											</c:choose>
										</fieldset>
									</div>

									<div class="couple-container">
										<div>カテゴリー</div>
										<span> <input name="couple" type="checkbox"
											id="groomCheckbox" value="新郎" /><label for="groomCheckbox"
											class="cb1"></label> 新郎側ゲスト
										</span> <span> <input name="couple" type="checkbox"
											id="brideCheckbox" value="新婦" /><label for="brideCheckbox"
											class="cb1"></label> 新婦側ゲスト
										</span>
									</div>
									<div class="relationship-container">
										<div>作成者との関係</div>
										<span> <input name="relation" type="checkbox"
											value="家族" id="familyCheckbox" /> <label
											for="familyCheckbox" class="cb1"></label> 家族
										</span> <span> <input name="relation" type="checkbox"
											value="親友" id="friendCheckbox" /> <label for="friendCheckbox"
											class="cb1"></label>親友
										</span> <span> <input name="relation" type="checkbox"
											value="職場の同僚" id="colleaguesCheckbox" /> <label
											for="colleaguesCheckbox" class="cb1"></label>職場の同僚
										</span> <span><input name="relation" type="checkbox"
											value="その他" id="othersCheckbox" /> <label
											for="othersCheckbox" class="cb1"></label>その他 </span>
									</div>
								</div>
							</div>

							<div class="tg-slide-second-page" id="slide-1">

								<c:choose>
									<c:when test="${loginType == 'normal' }">
										<c:set var="members" value="${members}" />
										<div class="contact-container">
											<div>
												メールアドレス<input style="font-size: 1.2rem;" type="email"
													class="contact-input" id="email" name="email"
													placeholder="enmusubi@gmail.com" required
													disabled="disabled" value="${members.m_email}" />
											</div>
											<div>
												電話番号 <input style="font-size: 1.2rem;" type="text"
													class="contact-input" id="phonenum" name="phonenum"
													placeholder="000-0000-0000" required disabled="disabled"
													value="${members.m_phone}" />
											</div>
										</div>
										<c:if test="${not empty members.m_first_name}">
											<div class="emergency-words">✿
												情報の修正が必要な場合は、マイページにてお願いします</div>
										</c:if>
									</c:when>
									<c:otherwise>
										<div class="contact-container">
											<div>
												メールアドレス<input style="font-size: 1.2rem;" type="email"
													class="contact-input" id="email" name="email"
													placeholder="enmusubi@gmail.com" required
													value="${members.m_email}"
													<c:if test="${members.m_email != 'no data'}">disabled="disabled"</c:if> />
											</div>
											<div>
												電話番号 <input style="font-size: 1.2rem;" type=""text""
													class="contact-input" id="phonenum" name="phonenum"
													placeholder="000-0000-0000" required
													value="${members.m_phone}"
													<c:if test="${not empty members.m_phone}">disabled="disabled"</c:if> />
											</div>
										</div>
										<c:if test="${not empty members.m_first_name}">
											<div class="emergency-words">✿
												情報の修正が必要な場合は、マイページにてお願いします</div>
										</c:if>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${loginType == 'normal' }">
										<c:set var="members" value="${members }" />
										<div class="address-container">
											<fieldset>
												<legend>
													<div>
														<img src="surveyPage/imgFolder/homeicon.png"
															alt="flowersymbol" style="width: 100%; height: 100%" />
													</div>
													&nbsp&nbsp&nbsp
													<div style="font-size: 2rem;">住所入力フォーム</div>
												</legend>
												<div class="address-contents-container">
													<div>
														<div>
															<span for="postal-code">郵便番号</span>
														</div>
														<div>
															<input style="font-size: 1.4rem" type="text"
																id="postal-code" name="postal-code"
																placeholder="123-4567" required
																value="${members.a_postcode}" disabled="disabled" />
														</div>
													</div>
													<div class="address-contents-contaoner">
														<div>
															<span for="prefecture">都道府県</span>
														</div>
														<div>
															<input style="font-size: 1.4rem" id="prefecture"
																name="prefecture" required
																value="${members.a_prefecture}" disabled="disabled">
														</div>
													</div>
													<div class="address-contents-container">
														<div>
															<span for="city">市区町村</span>
														</div>
														<div>
															<input style="font-size: 1.4rem" type="text" id="city"
																name="city" placeholder="新宿区" required
																value="${members.a_city }" disabled="disabled" />
														</div>
													</div>

													<div class="address-contents-container">
														<div>
															<span for="address-line1">町域・番地</br>建物名・部屋番号
															</span>
														</div>
														<div>
															<textarea style="font-size: 1.4rem;" id="address-line1"
																name="address" placeholder="西新宿2-8-1 新宿ビル 101" required
																disabled="disabled">${members.a_address }</textarea>
														</div>
													</div>
													<c:if test="${not empty members.a_address}">
														<div class="emergency-words">✿
															情報の修正が必要な場合は、マイページにてお願いします</div>
													</c:if>
											</fieldset>
										</div>
									</c:when>
									<c:otherwise>
										<div class="address-container">
											<fieldset>
												<legend>
													<div>
														<img src="surveyPage/imgFolder/homeicon.png"
															alt="flowersymbol" style="width: 100%; height: 100%" />
													</div>
													&nbsp&nbsp&nbsp
													<div style="font-size: 2rem;">住所入力フォーム</div>
												</legend>
												<div class="address-contents-container">
													<div>
														<div>
															<span for="postal-code">郵便番号</span>
														</div>
														<div>
															<input style="font-size: 1.4rem" type="text"
																id="postal-code" name="postal-code"
																placeholder="123-4567" required
																value="${members.a_postcode }"
																<c:if test="${not empty members.a_postcode}">disabled="disabled"</c:if> />
														</div>
													</div>
													<div class="address-contents-container">
														<div>
															<span for="prefecture">都道府県</span>
														</div>
														<div>
															<label class="styled-select"> <select
																style="font-size: 1.4rem" id="prefecture" name="address"
																class="pl" required
																<c:if test="${not empty members.a_prefecture}">disabled="disabled"</c:if>>
																	<c:if test="${empty members.a_prefecture}">
																		<option value="">都道府県を選択してください</option>
																	</c:if>
																	<c:forEach var="prefecture" items="${prefectures}">
																		<option value="${prefecture }">
																			<c:if test="${prefecture == members.a_prefecture}">selected</c:if>
																			${prefecture }
																	</c:forEach>
															</select>
															</label>
														</div>
													</div>
													<div class="address-contents-container">
														<div>
															<span for="city">市区町村</span>
														</div>
														<div>
															<input style="font-size: 1.4rem" type="text" id="city"
																name="address" placeholder="新宿区" required
																value="${members.a_city }"
																<c:if test="${not empty members.a_city}">disabled="disabled"</c:if> />
														</div>
													</div>

													<div class="address-contents-container">
														<div>
															<span for="address-line1">町域・番地 </br> 建物名・部屋番号
															</span>
														</div>
														<div>
															<textarea style="font-size: 1.4rem;" id="address-line1"
																name="address" placeholder="西新宿2-8-1 新宿ビル 101" required
																<c:if test="${not empty members.a_address}">disabled="disabled"</c:if>>${members.a_address }</textarea>
														</div>
													</div>
													<c:if test="${not empty members.a_address}">
														<div class="emergency-words">✿
															情報の修正が必要な場合は、マイページにてお願いします</div>
													</c:if>
											</fieldset>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="tg-slide-third-page" id="slide-2">

								<div class="together-container">
									<div>同伴人数</div>
									<div class="together-people">大人</div>
									<input type="button" class="togeter-button"
										onclick='count("plus","adult")' value="+" /> <input
										style="width: 2rem; font-size: 1.2rem;" class="result"
										value="0" id="adult" name="adult" /> <input type="button"
										class="togeter-button" onclick='count("minus","adult")'
										value="-" />
									<div value="子供" class="together-people">子供</div>
									<input type="button" class="togeter-button"
										onclick='count("plus","child")' value="+" /> <input
										style="width: 2rem; font-size: 1.2rem" class="result"
										value="0" id="child" name="child" /> <input type="button"
										class="togeter-button" onclick='count("minus","child")'
										value="-" />
									<div value="幼児" class="together-people">幼児</div>
									<input type="button" class="togeter-button"
										onclick='count("plus","baby")' value="+" /> <input
										style="width: 2rem; font-size: 1.2rem;" class="result"
										value="0" id="baby" name="baby" /> <input type="button"
										class="togeter-button" onclick='count("minus","baby")'
										value="-" />
								</div>

								<div class="allergy-container">
									<fieldset>
										<legend>
											<div style="width: 3.8rem; height: 1.8rem;">
												<img style="width: 100%; height: 100%"
													src="surveyPage/imgFolder/foodicon.png" alt="アレルギーマーク" />
											</div>
											<div>アレルギーについて</div>
										</legend>

										<div class="allergy-question">
											<span style="font-size: 1.5rem;" for="allergy">アレルギーはありますか？</span>
											<span style="font-size: 1.5rem;"> <input
												type="checkbox" name="allergy" value="no"
												id="allergyCheckbox" /> <label for="allergyCheckbox"
												class="cb2"></label> いいえ
											</span> <span style="font-size: 1.5rem;"> <input
												type="checkbox" name="allergy" value="yes"
												id="allergyCheckbox2" /> <label for="allergyCheckbox2"
												class="cb2"></label> はい
											</span>
										</div>

										<div class="allergy-details" id="allergy-details"
											style="display: none;">
											<label for="allergy-type">アレルギーの種類:</label>&nbsp;&nbsp;&nbsp;&nbsp;
											<textarea class="allergy-type" id="allergy-type"
												name="allergy-type" placeholder="例：卵, 小麦, 乳製品"></textarea>
										</div>
									</fieldset>
								</div>

								<div class="special-notes-container">
									<div style="line-height: 3rem; font-size: 1.4rem;">
										その他要求事項
										<div>
											<textarea style="font-size: 1.2rem" id="special-notes"
												name="special-notes" placeholder="ご要望、ご質問などございましたらご記入ください。"></textarea>
										</div>
									</div>

								</div>

								<div>

									<button type="button" id="submitBtn" class="tg-survey-button"
										onclick="handleFormSubmit()">
										<span>送信</span>
									</button>

								</div>

							</div>

							<div>

								<div class="tg-slide-forth-page" id="slide-3">

									<div class="reject-notes-container">
										<div style="line-height: 3rem; font-size: 1.5rem;">
											お断り·お祝いメッセージ
											<div>
												<textarea style="font-size: 1.3rem" id="special-notes"
													name="special-notes"
													placeholder="ご結婚、誠におめでとうございます。 残念ですが.."></textarea>
											</div>
										</div>

										<button type="button" id="submitBtn"  class="tg-survey-button"
											onclick="handleFormSubmitWithoutAllergy()">
											<span>送信</span>
										</button>

									</div>

								</div>

							</div>

						</div>

						<div class="slider-navigation">
							<button type="button" class="next-slide">></button>
						</div>
					</div>
				</form>
			</div>


		</main>

		<footer class="tk_survey_footer"> </footer>
	</div>

	<dialog id="tg-modal" class="tg-modal">
	<div class="tg-modal-container">
		<div class="tg-modal-img-box" onclick="location.href='SendC'">
			<h2>送金</h2>
			<div class="tg-modal-ribbon">
				<img alt="noImg" src="myPage/statistics/imgFolder/line_money.png">
			</div>
		</div>
		<div class="tg-modal-img-box" onclick="location.href='FundC'">
			<h2>ファンディング</h2>
			<div class="tg-modal-ribbon">
				<img alt="noImg" src="myPage/statistics/imgFolder/line_funding.png">
			</div>
		</div>
		<div class="tg-modal-img-box"
			onclick="location.href='https://www.amazon.com/-/ko/ref=nav_logo'">
			<h2>ウィッシュリスト</h2>
			<div class="tg-modal-ribbon">
				<img alt="noImg" src="myPage/statistics/imgFolder/line_present.png">
			</div>
		</div>
	</div>
	<a href="ResultC" style="text-decoration: none;"><h3
			style="color: #999999">i pay after</h3></a> </dialog>

</body>

<script>
let logintype = '<%=request.getAttribute("loginType")%>';
console.log(logintype);

//slick 시작 함수
let $slider;
	function slickSlide() {
	var selected = false;
		$slider = $(".survey-input").slick({
    	infinite: false,
    	slidesToShow: 1,
    	slidesToScroll: 1,
    	adaptiveHeight: false,
    	prevArrow: null,
    	nextArrow: null,
		draggable: false,  // 마우스로 드래그 금지
     	swipe: false,      // 터치 스와이프 금지
     	touchMove: false  // 터치 무브 금지
		}).on('init', function (event, slick) {
		console.log('왼쪽 버튼 삭제')
         // 초기에 왼쪽 버튼 숨기기
        $(".prev-slide").hide();
	})

	// 슬라이드 초기화 시 필터링 로직 추가
    $slider.on('init', function (event, slick) {
        if (!selected) {
             $('.next-slide').prop('disabled', true); // '다음' 버튼 비활성화
        }
    });

     // 슬라이드 변경 시 필터링 상태 유지
    $slider.on('beforeChange', function (event, slick, currentSlide, nextSlide) {
        if (currentSlide === 0 && !selected) {
            alert('出席または欠席を選択してください。');
             return false; // 슬라이드 변경을 막습니다.
        }
    });

 // 슬라이드 변경 후 상태 확인
	$slider.on('afterChange', function (event, slick, currentSlide) {
     // 슬라이드 초기화 상태에서 버튼 상태를 다시 설정
		if (currentSlide === 0 && !selected) {
        $('.next-slide').prop('disabled', true);
    } else {
        $('.next-slide').prop('disabled', false);
    }

    if (currentSlide === 0) {
        $(".prev-slide").hide();
	} else {
        $(".prev-slide").show();
    }

    if (currentSlide === slick.slideCount - 1) {
        $(".next-slide").hide();
    } else {
        $(".next-slide").show();
    }
 });

     // 선택 버튼 클릭 시 '다음' 버튼 활성화
    $('.entry-box-img, .no-entry-box-img').on('click', function () {
        selected = true;
         $('.next-slide').prop('disabled', false); // '다음' 버튼 활성화
    });

     // 이전 버튼 클릭 핸들러
    $('.prev-slide').on('click', function () {
        $slider.slick('slickPrev');
    });

     // 다음 버튼 클릭 핸들러
    $('.next-slide').on('click', function () {
        if (!selected && $slider.slick('slickCurrentSlide') === 0) {
            alert('出席または欠席を選択してください。');
            return false;
        }
        $slider.slick('slickNext');
    });
}

$(document).ready(function () {
    slickSlide();

    $(".entry-box-img").on("click", function () {
        $(".survey-input").slick('slickUnfilter');
        $(".survey-input").slick('slickFilter', function (index) {
             return index < 4; // 0, 1, 2, 3 => 슬라이드 1, 2, 3, 4
        });
    });

    $(".no-entry-box-img").on("click", function () {
        $(".survey-input").slick('slickUnfilter');
        $(".survey-input").slick('slickFilter', function (index) {
             return index === 0 || index === 1 || index === 2 || index === 4; // 0, 1, 2, 3 => 슬라이드 1, 2, 3, 4
        });
    });
    

 var $activeBox = null; // 활성화된 상자를 추적할 변수

 // 상자를 클릭했을 때 active 클래스를 관리합니다.
$('.entry-box-img, .no-entry-box-img').on('click', function(event) {
     event.stopPropagation(); // 이벤트 전파를 멈춥니다.
    
    var $clickedBox = $(this);

     // 클릭된 상자가 이미 활성화 상태인지 확인합니다.
    if (!$clickedBox.hasClass('active')) {
         // 현재 활성화된 상자와 다른 모든 상자에서 active 클래스를 제거합니다.
        $('.entry-box-img.active, .no-entry-box-img.active').removeClass('active');
        $('.entry-box-img.selected, .no-entry-box-img.selected').removeClass('selected');

         // 클릭된 상자에 active 클래스를 추가합니다.
        $clickedBox.addClass('active');
        $clickedBox.addClass('selected');

         // 활성화된 상자를 추적합니다.
        $activeBox = $clickedBox;
    }

     
});



$(document).on('click', function(event) {
    if ($activeBox !== null && !$activeBox.is(event.target) && $activeBox.has(event.target).length === 0) {

    }
});
});

	function count(type, inputId) {
	const resultElement = document.getElementById(inputId);

		let number = parseInt(resultElement.value);

		if (type === "plus") {
	number += 1;
	} else if (type === "minus") {
if (number > 0) {
number -= 1;
}
	}

// 결과 출력
resultElement.value = number;
}

const coupleCheckboxes = document.querySelectorAll('input[name="couple"]');

coupleCheckboxes.forEach(checkbox => {
checkbox.addEventListener('change',function() {
    if (this.checked) {
        coupleCheckboxes.forEach(otherCheckbox => {
        if (otherCheckbox !== this) {
            otherCheckbox.checked = false;
        }
        });      
    }
});
});

    const relationshipCheckboxes = document.querySelectorAll('input[name="relation"]');

relationshipCheckboxes.forEach(checkbox => {
checkbox.addEventListener('change',function() {
    if (this.checked) {
        relationshipCheckboxes.forEach(otherCheckbox => {
        if (otherCheckbox !== this) {
            otherCheckbox.checked = false;
        }
        });      
    }
});
});

 // 알레르기 셀렉트 박스 변경 이벤트 처리
const allergyCheckboxes = document.querySelectorAll('input[name="allergy"]');
const allergyDetails = document.getElementById("allergy-details");

allergyCheckboxes.forEach(checkbox => {
checkbox.addEventListener('change', function() {
if (this.checked) {
    allergyCheckboxes.forEach(otherCheckbox => {
    if(otherCheckbox !== this) {
        otherCheckbox.checked = false;
    }
    });

    if (this.value === 'yes') {
       allergyDetails.style.display = 'block'; // "はい" 체크 시 세부 정보 표시
    } else {
       allergyDetails.style.display = 'none';  // 체크 해제 시 세부 정보 숨김
    }         
    }
    });
});


function openModal() {
    console.log("activatge");
        const modal = document.getElementById("tg-modal");
        const modalContent = document.querySelector(".tg-modal-container");
        document.querySelector(".tk_survey_main").style.opacity = "0";
        const body = document.querySelector("body");
        body.style.transition = "background-color 0.5s ease";
        body.style.backgroundColor = "#ffe0e0";
        ajaxThing();
        modal.showModal();  // <dialog> 요소를 표시하는 표준 메서드
        setTimeout(() => {
            modal.style.opacity = "1";
            modalContent.style.transform = "scale(1)";
            modalContent.style.opacity = "1";
            modalContent.style.animation = "burstIn 0.5s forwards";
        }, 10);
}

function openModalWithoutAllergy() {
    console.log("activatge");
        const modal = document.getElementById("tg-modal");
        const modalContent = document.querySelector(".tg-modal-container");
        document.querySelector(".tk_survey_main").style.opacity = "0";
        const body = document.querySelector("body");
        body.style.transition = "background-color 0.5s ease";
        body.style.backgroundColor = "#ffe0e0";
        ajaxThing();
        modal.showModal();  // <dialog> 요소를 표시하는 표준 메서드
        setTimeout(() => {
            modal.style.opacity = "1";
            modalContent.style.transform = "scale(1)";
            modalContent.style.opacity = "1";
            modalContent.style.animation = "burstIn 0.5s forwards";
        }, 10);
}

	let formArray = $("#surveyForm").serializeArray();
	console.log(formArray);
function ajaxThing(){
	let formArray = $("#surveyForm").serializeArray();
	console.log(formArray);
	$.ajax({
	    url: "SurveyC", // 여기에 실제 서블릿 URL을 입력하세요
	    type: "POST",
	    data: formArray,
	    success: function(response) {
	        alert("会員情報が正常に更新されました。");
	        // 추가적인 처리 로직
	    },
	    error: function(xhr, status, error) {
	        alert("회원 정보 업데이트에 실패하였습니다.");
	        console.error("에러:", error);
	    }
	});
}


function handleFormSubmit() {
    let invalidField = null;
    let slideIndex = 0; // slideIndex 변수 선언

    if (document.getElementById('name').value.trim() === '') {
        invalidField = document.getElementById('name');
        Swal.fire({
            icon: 'warning',
            title: '名前を入力します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 1);
        	  }, 200); // 100ms 지연
        });
    } else if (document.getElementById('kataName').value.trim() === '') {
        invalidField = document.getElementById('kataName');
        Swal.fire({
            icon: 'warning',
            title: 'フリガナを入力します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 1);
        	  }, 200); // 100ms 지연
        });
    }  else if (document.getElementById('romaName').value.trim() === '') {
        invalidField = document.getElementById('romaName');
        Swal.fire({
            icon: 'warning',
            title: 'ローマ字の名前を入力します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 1);
        	  }, 200); // 100ms 지연
        });
    }  else if (!document.getElementById('groomCheckbox').checked && !document.getElementById('brideCheckbox').checked) {
        invalidField = document.getElementById('groomCheckbox');
        Swal.fire({
            icon: 'warning',
            title: '新郎または新婦を選択します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 1);
        	  }, 200); // 100ms 지연
        });
    }  else if (!document.getElementById('familyCheckbox').checked && !document.getElementById('friendCheckbox').checked && 
            !document.getElementById('colleaguesCheckbox').checked && !document.getElementById('othersCheckbox').checked) {
        invalidField = document.getElementById('familyCheckbox');
        Swal.fire({
            icon: 'warning',
            title: '作成者との関係を選択します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 1);
        	  }, 200); // 100ms 지연
        });
    }  else if (document.getElementById('email').value.trim() === '') {
		invalidField = document.getElementById('email');  		
        Swal.fire({
            icon: 'warning',
            title: 'メールを入力します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 2);
        	  }, 200); // 100ms 지연
        });
        
        $('.survey-input').slick('slickGoTo', 2);
    }  else if (document.getElementById('phonenum').value.trim() === '') {
        invalidField = document.getElementById('phonenum');
        Swal.fire({
            icon: 'warning',
            title: 'メールを入力します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 2);
        	  }, 200); // 100ms 지연
        });
            } else if (document.getElementById('postal-code').value.trim() === '' && 
            document.getElementById('prefecture').value.trim() === '' && 
            document.getElementById('city').value.trim() === '' && 
            document.getElementById('address').value.trim() === '') {
        invalidField = document.getElementById('postal-code');
        Swal.fire({
            icon: 'warning',
            title: '住所を入力します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        }).then(()=> {
        	 setTimeout(() => {
       			 $('.survey-input').slick('slickGoTo', 2);
        	  }, 200); // 100ms 지연
        });
        $('.survey-input').slick('slickGoTo', 3);
    } else if (document.getElementById('adult').value.trim() === '0' && 
            document.getElementById('child').value.trim() === '0' && 
            document.getElementById('baby').value.trim() === '0') {
        Swal.fire({
            icon: 'warning',
            title: '同伴人数を入力します。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        });
        invalidField = document.getElementById('adult');
        $('.survey-input').slick('slickGoTo', 3);
    } else if (!document.getElementById('allergyCheckbox').checked && 
            !document.getElementById('allergyCheckbox2').checked && 
            document.getElementById('allergy-type').value.trim() === '') {
        Swal.fire({
            icon: 'warning',
            title: 'アレルギーの種類を入力してください。',
            customClass: {
                popup: 'swal2-popup',
                confirmButton: 'swal2-confirm'
            }
        });
        invalidField = document.getElementById('allergy-type');
        $('.survey-input').slick('slickGoTo', 3); // 4번째 슬라이드로 이동
    }

    if (!invalidField) {
    openModal();
    }
    	
}

function handleFormSubmitWithoutAllergy() {
	     let invalidField = null;
	     let slideIndex = 0; // slideIndex 변수 선언

	     if (document.getElementById('name').value.trim() === '') {
	         invalidField = document.getElementById('name');
	         Swal.fire({
	             icon: 'warning',
	             title: '名前を入力します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 1);
	         	  }, 200); // 100ms 지연
	         });
	     } else if (document.getElementById('kataName').value.trim() === '') {
	         invalidField = document.getElementById('kataName');
	         Swal.fire({
	             icon: 'warning',
	             title: 'フリガナを入力します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 1);
	         	  }, 200); // 100ms 지연
	         });
	     }  else if (document.getElementById('romaName').value.trim() === '') {
	         invalidField = document.getElementById('romaName');
	         Swal.fire({
	             icon: 'warning',
	             title: 'ローマ字の名前を入力します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 1);
	         	  }, 200); // 100ms 지연
	         });
	     }  else if (!document.getElementById('groomCheckbox').checked && !document.getElementById('brideCheckbox').checked) {
	         invalidField = document.getElementById('groomCheckbox');
	         Swal.fire({
	             icon: 'warning',
	             title: '新郎または新婦を選択します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 1);
	         	  }, 200); // 100ms 지연
	         });
	     }  else if (!document.getElementById('familyCheckbox').checked && !document.getElementById('friendCheckbox').checked && 
	             !document.getElementById('colleaguesCheckbox').checked && !document.getElementById('othersCheckbox').checked) {
	         invalidField = document.getElementById('familyCheckbox');
	         Swal.fire({
	             icon: 'warning',
	             title: '作成者との関係を選択します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 1);
	         	  }, 200); // 100ms 지연
	         });
	     }  else if (document.getElementById('email').value.trim() === '') {
	 		invalidField = document.getElementById('email');  		
	         Swal.fire({
	             icon: 'warning',
	             title: 'メールを入力します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 2);
	         	  }, 200); // 100ms 지연
	         });
	         
	         $('.survey-input').slick('slickGoTo', 2);
	     }  else if (document.getElementById('phonenum').value.trim() === '') {
	         invalidField = document.getElementById('phonenum');
	         Swal.fire({
	             icon: 'warning',
	             title: 'メールを入力します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 2);
	         	  }, 200); // 100ms 지연
	         });
	             } else if (document.getElementById('postal-code').value.trim() === '' && 
	             document.getElementById('prefecture').value.trim() === '' && 
	             document.getElementById('city').value.trim() === '' && 
	             document.getElementById('address').value.trim() === '') {
	         invalidField = document.getElementById('postal-code');
	         Swal.fire({
	             icon: 'warning',
	             title: '住所を入力します。',
	             customClass: {
	                 popup: 'swal2-popup',
	                 confirmButton: 'swal2-confirm'
	             }
	         }).then(()=> {
	         	 setTimeout(() => {
	        			 $('.survey-input').slick('slickGoTo', 2);
	         	  }, 200); // 100ms 지연
	         });
	         $('.survey-input').slick('slickGoTo', 3);
	     } 
  
	     if (!invalidField) {
	    	 openModalWithoutAllergy();
	    	    }
	    	    	
	    	}

document.getElementById('prefecture').addEventListener('change', function() {
    const firstOption = this.querySelector('option[value=""]');
    if (firstOption) {
        firstOption.remove();
    }
});


    </script>

</html>
