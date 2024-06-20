<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="surveyPage/survey.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200;400;700;900&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<div class="survey-container">
		<div class="survey-container-img">
			<img src="surveyPage/imgFolder/surveyBackground-img.png" alt="surveyBackground-img"
					style="width: 100%; height: 100%;
					position: absolute;
					display: flex;
					width: 100%;
					flex-grow: 1;
					flex-direction: column;
					height: 100vh;
					z-index: 1;
					pointer-events: none;
">
		</div>
		<header class="tk_survey_header">
			<div class="top-left">
				<img src="surveyPage/imgFolder/logo.png" alt="logo"
					style="width: 100%; height: 100%; animation: logo-float 2s ease-in-out infinite;
" />
			</div>

			<div class="middle-title">
				<div>出席の方</div>
			</div>

			<div class="top-menu">
				<img src="surveyPage/imgFolder/menu-btn.png" alt="menu-button"
					style="width: 100%; height: 100%" />
			</div>
		</header>

		<main class="tk_survey_main">
			<div class="main-content">
				<div class="main-content-words">
					<div>お手数ではございますが、ご出欠情報のご登録をお願い申し上げます。</div>
					<div style="margin-top: 0.5rem">2024.06.09までにご返信をお願いいたします。</div>
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
									<div class="entry-box-img" data-selccted="yes" onclick="selectAttendance('出席')">
										<div class="texts">
											<div>出席</div>
										</div>
										<img class="lines" alt="" src="surveyPage/imgFolder/yesline.png">
										<input type="hidden" name="attendance" value="出席">
									</div>
									<div class="no-entry-box-img" data-selccted="no" onclick="selectAttendance('欠席')">
										<div class="texts">
											<div>欠席</div>
										</div>
										<img class="lines" alt="" src="surveyPage/imgFolder/noline.png">
										<input type="hidden" name="attendance" value="欠席">
									</div>

								</div>


							</div>

							<div>
								<div class="tg-slide-page">

                					<div class="name-container">
										<fieldset>
											<legend>
												<div>
													<img src="surveyPage/imgFolder/flowersymbol.jpg" alt="flowersymbol"
														style="width: 100%; height: 100%" />
												</div>
												&nbsp&nbsp&nbsp
												<div style="font-size: 2rem;">お名前</div>
											</legend>
									<c:choose>
										<c:when test="${loginType == 'normal' }">
										    <c:set var="members" value="${members }" />
											<label class="kanzi-container">
												<div style="font-size: 1.5rem;">名前</div> 
												<input style="font-size: 1rem;" type="text" placeholder=" - "
												class="name-input" id="name" name="name" required value="${members.m_first_name}" disabled="disabled" /> 
												<input style="font-size: 1.2rem;" type="text" placeholder=" - "
												class="name-input" id="name" name="name" required value="${members.m_last_name}" disabled="disabled" />
											</label><br> <label class="kata-container">
												<div style="font-size: 1.5rem;">カタカナ</div> 
												<input style="font-size: 1rem;" type="text" placeholder=" - "
												class="name-input" id="kataName" name="kata-name" required value="${members.m_first_name_kana}" disabled="disabled" /> 
												<input style="font-size: 1.2rem;" type="text" placeholder=" - "
												class="name-input" id="kataName" name="kata-name" required value="${members.m_last_name_kana}" disabled="disabled" />
											</label><br> <label class="eng-container">
												<div style="font-size: 1.5rem;">ローマ字</div> 
												<input style="font-size: 1rem;" type="text" placeholder=" - "
												class="name-input" id="romaName" name="roma-name" required value="${members.m_last_name_rome}" disabled="disabled" /> 
												<input style="font-size: 1.2rem;" type="text"
												placeholder=" - " class="name-input" id="romaName" name="roma-name"
												required value="${members.m_first_name_rome}" disabled="disabled" />
											</label>
										 </c:when>
										 <c:otherwise>
											<label class="kanzi-container">
												<div style="font-size: 1.5rem;">漢字</div> 
												<input style="font-size: 1rem;" type="text" placeholder="姓"
												class="name-input" id="name" name="name" required value="${members.m_first_name}" /> 
												<input style="font-size: 1.2rem;" type="text" placeholder="名"
												class="name-input" id="name" name="name" required value="${members.m_last_name}" />
											</label><br> <label class="kata-container">
												<div style="font-size: 1.5rem;">カタカナ</div> 
												<input style="font-size: 1rem;" type="text" placeholder="せい"
												class="name-input" id="kataName" name="kata-name" required value="${members.m_first_name_kana}" /> 
												<input style="font-size: 1.2rem;" type="text"  placeholder="めい"
												class="name-input" id="kataName" name="kata-name" required value="${members.m_last_name_kana}" />
											</label><br> <label class="eng-container">
												<div style="font-size: 1.5rem;">ローマ字</div> 
												<input style="font-size: 1rem;" type="text" placeholder="Last Name"
												class="name-input" id="romaName" name="roma-name" required value="${members.m_last_name_rome}"/> 
												<input style="font-size: 1.2rem;" type="text"
												placeholder="First Name" id="romaName" class="name-input" name="roma-name"
												required value="${members.m_first_name_rome}" />
											</label>
										 </c:otherwise>
										</c:choose>									 
										</fieldset>
									</div>

									<div class="couple-container">
										<div>カテゴリー</div>
										<label> <input name="couple" type="checkbox"
											value="groom" /> 新郎側ゲスト
										</label> <label> <input name="couple" type="checkbox"
											value="bride" /> 新婦側ゲスト
										</label>
									</div>
									<div class="relationship-container">
										<div>作成者との関係</div>
										<span> <input name="relation" type="checkbox"
											value="家族" /> 家族
										</span> <span> <input name="relation" type="checkbox"
											value="親友" /> 親友
										</span> <span> <input name="relation" type="checkbox"
											value="職場の同僚" /> 職場の同僚
										</span> <label> <input name="relation" type="checkbox"
											value="その他" /> その他
										</label>
									</div>

								</div>
							</div>

							<div class="tg-slide-second-page">
						
						<c:choose>
							<c:when test="${loginType == 'normal' }">
								<c:set var="members" value="${members}" />
            					<div class="contact-container">
										<div>
											メールアドレス<input style="font-size: 1.2rem;" type="email"
												class="contact-input" id="email" name="email"
												placeholder=" - " required value="${members.m_email}" disabled="disabled" />
										</div>
										<div>
											電話番号 <input style="font-size: 1.2rem;" type="number"
												class="contact-input" id="phonenum" name="phonenum"
												placeholder=" - " required value="${members.m_phone}" disabled="disabled" />
										</div>
								</div>
							</c:when>
							<c:otherwise>
            					<div class="contact-container">
										<div>
											メールアドレス<input style="font-size: 1.2rem;" type="email"
												class="contact-input" id="email" name="email"
												placeholder="enmusubi@gmail.com" required value="${members.m_email}" />
										</div>
										<div>
											電話番号 <input style="font-size: 1.2rem;" type="number"
												class="contact-input" id="phonenum" name="phonenum"
												placeholder="000-0000-0000" required value="${members.m_phone}" />
										</div>
								</div>							
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${loginType == 'normal' }">
								<c:set var="members" value="${members }" />
								<div class="address-container">
									<fieldset>
										<legend>
											<div>
												<img src="surveyPage/imgFolder/homeicon.png" alt="flowersymbol"
													style="width: 100%; height: 100%" />
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
													<input style="font-size: 1.4rem" type="text" id="postal-code"
														name="postal-code" placeholder="123-4567" required value="${members.a_postcode}" disabled="disabled"/>
												</div>
											</div>
											<div class="address-contents-contaoner">
												<div>
													<span for="prefecture">都道府県</span>
												</div>
												<div>
													<select style="font-size: 1.4rem" id="prefecture"
														name="prefecture" required>
														<option value="">選択してください</option>
            												<c:forEach var="prefecture" items="${prefectures}">
																<option value="${prefecture }">	
																<c:if test="${prefecture == members.a_prefecture}">selected</c:if>
																${prefecture }
	           												</c:forEach>
													</select>
												</div>
											</div>
											<div class="address-contents-container">
												<div>
													<span for="city">市区町村</span>
												</div>
												<div>
													<input style="font-size: 1.4rem" type="text" id="city"
														name="city" placeholder="新宿区" required value="${members.a_city }" disabled="disabled" />
												</div>
											</div>

											<div class="address-contents-container">
												<div>
													<span for="address-line1">町域・番地</br>建物名・部屋番号</span>
												</div>
												<div>
													<textarea style="font-size: 1.4rem; width: 20rem;"
														id="address-line1" name="address" placeholder="西新宿2-8-1 新宿ビル 101"
														required disabled="disabled">${members.a_address }</textarea>
												</div>
											</div>
									</fieldset>
									</div>
							</c:when>		
							<c:otherwise>
								<div class="address-container">
									<fieldset>
										<legend>
											<div>
												<img src="surveyPage/imgFolder/homeicon.png" alt="flowersymbol"
													style="width: 100%; height: 100%" />
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
													<input style="font-size: 1.4rem" type="text" id="postal-code"
														name="postal-code" placeholder="123-4567" required value="${members.a_city }"/>
												</div>
											</div>
											<div class="address-contents-contaoner">
												<div>
													<span for="prefecture">都道府県</span>
												</div>
												<div>
													<select style="font-size: 1.4rem" id="prefecture"
														name="address" required>
														<option value="">選択してください</option>
														<c:forEach var="prefecture" items="${prefectures}">
																<option value="${prefecture }">	
																<c:if test="${prefecture == members.a_prefecture}">selected</c:if>
																${prefecture }
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="address-contents-container">
												<div>
													<span for="city">市区町村</span>
												</div>
												<div>
													<input style="font-size: 1.4rem" type="text" id="city"
														name="address" placeholder="新宿区" required value="${members.a_city }"/>
												</div>
											</div>

											<div class="address-contents-container">
												<div>
													<span for="address-line1">町域・番地</br>建物名・部屋番号</span>
												</div>
												<div>
													<textarea style="font-size: 1.4rem; width: 20rem;"
														id="address-line1" name="address" placeholder="西新宿2-8-1 新宿ビル 101"
														required >${members.a_address }</textarea>
												</div>
											</div>
									</fieldset>
									</div>
							</c:otherwise>
						</c:choose>
							</div>
							<div class="tg-slide-third-page">

                					<div class="together-container">
										<div>同伴人数</div>
										<div class="together-people">大人</div>
										<input type="button" onclick='count("plus","adult")' value="+" />
										<input style="width: 2rem; font-size: 1rem;" class="result"
											value="0" id="adult" name="adult" /> <input type="button"
											onclick='count("minus","adult")' value="-" />
										<div value="子供" class="together-people">子供</div>
										<input type="button" onclick='count("plus","child")' value="+" />
										<input style="width: 2rem; font-size: 1rem" class="result"
											value="0" id="child" name="child" /> <input type="button"
											onclick='count("minus","child")' value="-" />
										<div value="幼児" class="together-people">幼児</div>
										<input type="button" onclick='count("plus","baby")' value="+" />
										<input style="width: 2rem; font-size: 1rem;"
											class="result baby" value="0" id="baby" name="baby" /> <input
											type="button" onclick='count("minus","baby")' value="-" />
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
										<label>
    										<input style="font-size: 1.5rem;" type="radio" name="allergy" value="no" checked /> いいえ
										</label>
										<label>
    										<input style="font-size: 1.5rem;" type="radio" name="allergy" value="yes" /> はい
										</label>
										</div>

										<div class="allergy-details" id="allergy-details"
											style="display: none;">
											<label for="allergy-type">アレルギーの種類:</label>&nbsp;&nbsp;&nbsp;&nbsp;
											<textarea class="allergy-type" id="allergy-type" name="allergy-type" placeholder="例：卵, 小麦, 乳製品"></textarea>
										</div>
								</fieldset>
										</div>

								<div class="special-notes-container">
									<div style="line-height: 3rem; font-size: 1.4rem;">
										その他要求事項
										<div><textarea style="font-size: 1.2rem" id="special-notes"
											name="special-notes" placeholder="ご要望、ご質問などございましたらご記入ください。"></textarea>
                    					</div>
									</div>

								</div>

								<div>

									<button type="button" id="submitBtn" class="tg-survey-button" onclick="openModal(true)">
										<span>送信</span>
									</button>

								</div>

							</div> 

            <div>

            <div class="tg-slide-forth-page">

                <div class="reject-notes-container">
									<div style="line-height: 3rem; font-size: 1.5rem;">
										お断り·お祝いメッセージ
										<div><textarea style="font-size: 1.3rem" id="special-notes"
											name="special-notes" placeholder="ご結婚、誠におめでとうございます。 残念ですが.."></textarea>
                    					</div>
									</div>

        						<button type="button" id="submitBtn2" class="tg-survey-button" onclick="openModal(false)">
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
			</div>

			</form>


				</main>

			<footer class="tk_survey_footer"> </footer>
			</div>
			
			<dialog id="tg-modal" class="tg-modal">
   	 <div class="tg-modal-container">
        <div class="tg-modal-img-box" onclick="location.href='SendC'">
            <h2>送金</h2>
            <div class="tg-modal-ribbon"><img alt="noImg" src="myPage/statistics/imgFolder/line_money.png"></div>
        </div>
        <div class="tg-modal-img-box" onclick="location.href='FundC'">
            <h2>ファンディング</h2>
            <div class="tg-modal-ribbon"><img alt="noImg" src="myPage/statistics/imgFolder/line_funding.png"></div>
        </div>
        <div class="tg-modal-img-box" onclick="location.href='https://www.amazon.com/-/ko/ref=nav_logo'">
            <h2>ウィッシュリスト</h2>
            <div class="tg-modal-ribbon"><img alt="noImg" src="myPage/statistics/imgFolder/line_present.png"></div>
        </div>
    </div>
        <a href="ResultC" style="text-decoration: none;"><h3 style="color:#999999">i pay after</h3></a>
    </dialog>
			
</body>

<script>
let logintype = '<%=request.getAttribute("loginType") %>';
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
    
});


$(document).ready(function() {
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

        // function validateForm() {
        //     var Names = document.getElementById("name").value.trim();
        //     var katanames = document.getElementById("kata-name").value.trim();
        //     var romanames = document.getElementById("roma-name").value.trim();
        //     var phonenumber = document.getElementById("phonenum").value.trim();
        //     var emails = document.getElementById("email").value.trim();
        //     var postalcode = document.getElementById("postal-code").value.trim();
        //     var city = document.getElementById("city").value.trim();
        //     var addressline1 = document.getElementById("address-line1").value.trim();

        //     // 필수 입력 필드 체크
        //     if (Names === "" || katanames === "" || romanames === "" ||
        //         phonenumber === "" || emails === "" ||
        //         postalcode === "" || city === "" || addressline1 === "" ) {
                
        //         alert("모든 필드를 입력해주세요.");
        //         return false; // 폼 제출 방지
        //     }

        //     return true; // 모든 필드가 채워져 있을 때 폼 제출 허용
        // }

        // document.getElementById("submitBtn").addEventListener("click", function(event) {
        //     if (!validateForm()) {
        //         event.preventDefault();
        //     } else {
        //         document.getElementById("surveyForm").submit();
        //     }
        // });

function openModal(attemp) {
    const modal = document.getElementById("tg-modal");
    const modalContent = document.querySelector(".tg-modal-container");
    document.querySelector(".tk_survey_main").innerHTML="";
    body = document.querySelector("body");
    body.style.transition= "background-color 0.5s ease";
    body.style.backgroundColor="#ffe0e0";
    modal.showModal();  // <dialog> 요소를 표시하는 표준 메서드
    setTimeout(() => {
        modal.style.opacity = "1";
        modalContent.style.transform = "scale(1)";
        modalContent.style.opacity = "1";
        modalContent.style.animation = "burstIn 0.5s forwards";
    }, 10);
}

function openModal() {
	console.log("1");
    const modal = document.getElementById("tg-modal");
    const modalContent = document.querySelector(".tg-modal-container");
    document.querySelector(".tk_survey_main").style.opacity="0";
    body = document.querySelector("body");
    body.style.transition= "background-color 0.5s eas	e";
    body.style.backgroundColor="#ffe0e0";
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

$(document).ready(function() {
    $("#submitBtn").click(function() {
    	console.log("2");
        event.preventDefault(); // 기본 이벤트 제거
    
        let formArray = $("#surveyForm").serializeArray();
        console.log(formArray);
        $.ajax({
            url: "SurveyC", // 여기에 실제 서블릿 URL을 입력하세요
            type: "POST",
            data: formArray,
            success: function(response) {
                alert("회원 정보가 성공적으로 업데이트 되었습니다.");
                // 추가적인 처리 로직
            },
            error: function(xhr, status, error) {
                alert("회원 정보 업데이트에 실패하였습니다.");
                console.error("에러:", error);
            }
        });
    });
})

    </script>
    
</html>
