// Overall
// Full Page Scroll
const sections = document.querySelectorAll(".yj-main-section");
let currentSectionIndex = 0;
let isThrottled = false;

sections.forEach((e) => {
	console.log(e);
	console.log(sections.length);
})

function throttle(callback, time) {
	if (!isThrottled) {
		callback();
		isThrottled = true;
		setTimeout(function() {
			isThrottled = false;
		}, time);
	}
}

function goToNextSection() {
	if (currentSectionIndex < sections.length - 1) {
		currentSectionIndex++;
		sections[currentSectionIndex].scrollIntoView({ behavior: "smooth" });
	}
}

function goToPrevSection() {
	if (currentSectionIndex > 0) {
		currentSectionIndex--;
		sections[currentSectionIndex].scrollIntoView({ behavior: "smooth" });
	}
}

const textElements = document.querySelectorAll('.vertical-text');
let aniTimeout;
let aniTimeouts = [];
let wow;

// 디바운스 함수
function debounce(func, wait) {
	let timeout;
	return function(...args) {
		const context = this;
		clearTimeout(timeout);
		timeout = setTimeout(() => func.apply(context, args), wait);
	};
}

// 휠 이벤트 핸들러
const wheelHandler = (event) => {
	console.log('wheel?')
	if (event.deltaY > 0) {
		// 스크롤 다운
		throttle(() => goToNextSection(), 100); // throttle 함수를 사용하여 이벤트 처리 간격을 조정할 수 있습니다.
	} else {
		// 스크롤 업
		throttle(() => goToPrevSection(), 100);
	}

	if (currentSectionIndex == 1 || currentSectionIndex == 3) {
		console.log('testing : ' + currentSectionIndex);
		aniTimeouts.forEach(timeout => clearTimeout(timeout));
		aniTimeouts = [];
		wows.forEach(interval => clearInterval(interval));
		wows = [];
		textElements[0].innerHTML = "";
		textElements[1].innerHTML = "";
		textElements[2].innerHTML = "";
		textElements[1].style.opacity = 0;
		textElements[2].style.opacity = 0;
		
	}

	if (currentSectionIndex == 1) {
		document.addEventListener("mousemove", mouseMoveHandler);
	} else {
		document.removeEventListener("mousemove", mouseMoveHandler);
	}

	if (currentSectionIndex == 2) {
		let delay = 0;
		textElements.forEach((textElement, index) => {
			aniTimeout = setTimeout(() => {
				textElement.style.opacity = 1; // 배경을 나타나게 함
				setTimeout(() => { // 텍스트 애니메이션 시작을 약간 지연시킴
					textAni(textElement);
				}, 100); // 100ms 지연 후 텍스트 애니메이션 시작
			}, delay);
			aniTimeouts.push(aniTimeout);
			delay += textElement.dataset.text.length * 100 + 200; // 텍스트 길이에 비례한 지연 시간 + 추가 지연 시간
		});
	} else if (currentSectionIndex == 4) {
		document.removeEventListener("mousemove", mouseMoveHandler);
		document.querySelector(".yj-main-s4-flexContainer").style.overflow = "";
	}
};

// 디바운스를 적용한 휠 이벤트 핸들러
const debouncedWheelHandler = debounce(wheelHandler, 100);

// 요소에 휠 이벤트 추가
document.addEventListener('wheel', debouncedWheelHandler);

// ////////// ////////// ////////// ////////// ////////// //////////
// 로고 버튼 클릭 이벤트
document.addEventListener('DOMContentLoaded', (event) => {
	const mainLogo = document.querySelectorAll(".mainLogo");
	const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");
	mainLogo.forEach((logo) => {
		logo.addEventListener('mouseover', (event) => {
			event.preventDefault();
			mouseCursor.classList.add("yj-main-s6-cursor-none");
			logo.style.cursor = "pointer";
		});
		logo.addEventListener('mouseleave', (event) => {
			event.preventDefault();
			mouseCursor.classList.remove("yj-main-s6-cursor-none");
			logo.style.cursor = "none";
		});
		logo.addEventListener('click', (event) => {
			event.preventDefault(); // 기본 동작을 막습니다 (페이지 새로고침 방지)
			window.scrollTo({
				top: 0,
				behavior: 'smooth' // 부드럽게 스크롤됩니다
			});
		});
	})
});

// ////////// ////////// ////////// ////////// ////////// //////////
// 메뉴 버튼 클릭 이벤트
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
	menu.addEventListener('mouseover', (event) => {
		event.preventDefault();
		mouseCursor.classList.add("yj-main-s6-cursor-none");
		menu.style.cursor = "pointer";
	});
	menu.addEventListener('mouseleave', (event) => {
		event.preventDefault();
		mouseCursor.classList.remove("yj-main-s6-cursor-none");
		menu.style.cursor = "none";
	});
});

// Section 2
// mouse cursor (drag)
const s2CardConAll = document.querySelectorAll(".yj-main-section");
const s2Mouseicn = document.querySelector(".yj-main-s2-cursor");

const centerX = window.innerWidth / 2;
const centerY = window.innerHeight / 2;
const radiusX = 560;
const radiusY = 330;
const mouseMoveHandler = (event) => {
	const mouseX = event.clientX;
	const mouseY = event.clientY;
	const dx = mouseX - centerX;
	const dy = mouseY - centerY;


	if ((dx * dx) / (radiusX * radiusX) + (dy * dy) / (radiusY * radiusY) <= 1) {
		s2Mouseicn.querySelector("img").src = "main/imgFolder/yj-main-s2-drag.png";
		s2CardConAll[1].style.cursor = "none";
		s2Mouseicn.classList.remove("yj-main-s2-cursor-none");
		s2Mouseicn.classList.add("yj-main-s2-cursor-block");

		s2Mouseicn.style.left = mouseX + "px";
		s2Mouseicn.style.top = mouseY + "px";
		console.log("in");
	} else {
		s2CardConAll[1].style.cursor = "auto";
		s2Mouseicn.classList.remove("yj-main-s2-cursor-block");
		s2Mouseicn.classList.add("yj-main-s2-cursor-none");
	}
};

// 배경 이미지  슬라이드
function slickStart() {

	$(".yj-main-s2-bg").css(
		"background-image",
		"url('main/imgFolder/yj-main-s2-img1.png')"
	);
	// 슬릭 슬라이더의 beforeChange 이벤트 리스너 등록
	$(".yj-main-s2-list").on(
		"beforeChange",
		function(event, slick, currentSlide, nextSlide) {
			console.log(currentSlide);
			// 각 슬라이드의 배경 이미지 URL을 설정할 배열
			var bgImageUrls = [
				"main/main/imgFolder/yj-main-s2-img1.png",
				"main/main/imgFolder/yj-main-s2-img2.png",
				"main/main/imgFolder/yj-main-s2-img3.png",
				"main/imgFolder/yj-main-s2-img4.png",
				"main/imgFolder/yj-main-s2-img5.png",
				"main/imgFolder/yj-main-s2-img6.png",
				"main/imgFolder/yj-main-s2-img7.png",
				// 추가적으로 필요한 만큼 이미지 URL을 추가할 수 있음
			];
			// 다음 슬라이드의 인덱스를 기준으로 배경 이미지 설정
			var nextBackgroundImage = bgImageUrls[nextSlide];
			console.log(nextBackgroundImage);

			// 배경 이미지 변경
			$(".yj-main-s2-bg").css(
				"background-image",
				"url('" + nextBackgroundImage + "')"
			);
		}
	);
}

// Single Item Slide
$(document).ready(function() {
	$(".yj-main-s2-list")
		.slick({
			// autoplay: true,
			// autoplaySpeed: 2000,
			fade: true,
			infinite: true,
			centerMode: true,
			responsive: [
				{
					breakpoint: 768,
					settings: {
						arrows: false,
						centerMode: true,
						centerPadding: "40px",
						slidesToShow: 3,
					},
				},
				{
					breakpoint: 480,
					settings: {
						arrows: false,
						centerMode: true,
						centerPadding: "40px",
						slidesToShow: 1,
					},
				},
			],
		})
		.on("afterChange", function(event, slick, currentSlide) {
			var currentSlideImage = slick.$slides
				.eq(currentSlide)
				.find("img")
				.attr("src");
			$("#currentSlideImage").attr("src", currentSlideImage);
		});
});

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 3

/*let wow;


function textAni() {
	const text = textElement.dataset.text;
	//  console.log(text);
	clearInterval(wow);
	textElement.textContent = "";

	let i = 0;
	wow = setInterval(() => {
		if (i < text.length) {
			const span = document.createElement("span");
			span.textContent = text[i];
			//    console.log(text[i]);
			i++;
			textElement.appendChild(span);
		} else {
			clearInterval(wow);
		}
	}, 150);
}
*/

let wows = [];
function textAni(textElement) {
	const text = textElement.dataset.text;
	let i = 0;

	wow = setInterval(() => {
		if (i < text.length) {
			const span = document.createElement("span");
			span.textContent = text[i];
			i++;
			textElement.appendChild(span);
		}
	}, 200);
	wows.push(wow);
}

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 4
// 섹션 4의 이미지들(.clickable-image)를 클릭하면 섹션 5로 스크롤
const section4 = document.getElementById("yj-main-s4");
const clickableImages = document.querySelectorAll(".clickable-image");

clickableImages.forEach((image) => {
	image.addEventListener("click", (event) => {
		// console.log(event);
		event.preventDefault();
		throttle(goToNextSection, 2000); // throttle 함수를 사용하여 이벤트 처리 간격을 조정할 수 있습니다.
	});
});

// mouse cursor (click)
const cardConAll = document.querySelectorAll(".yj-main-s4-container");
const mouseicn = document.querySelector(".yj-main-s4-cursor");

cardConAll.forEach((card) => {
	card.addEventListener("mouseenter", function(event) {
		mouseicn.querySelector("img").src = "main/imgFolder/yj-main-s4-click.png";
		card.style.cursor = "none";
		mouseicn.classList.remove("yj-main-s4-cursor-none");
		mouseicn.classList.add("yj-main-s4-cursor-block");
		console.log(123123);
	});

	card.addEventListener("mouseleave", function() {
		mouseicn.classList.remove("yj-main-s4-cursor-block");
		mouseicn.classList.add("yj-main-s4-cursor-none");
	});
});

document.addEventListener("mousemove", (event) => {
	const mouseX = event.clientX;
	const mouseY = event.clientY;
	mouseicn.style.left = mouseX + "px";
	mouseicn.style.top = mouseY + "px";
});

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 5

// mouse cursor (scroll)
const s5CardConAll = document.querySelector(".yj-main-s5-container");
const s5Mouseicn = document.querySelector(".yj-main-s5-cursor");
s5CardConAll.addEventListener("mouseenter", function() {
	console.log("in");
	s5Mouseicn.style.display = "block";
	s5CardConAll.style.cursor = "none";
	// document.removeEventListener("wheel", wheelHandler);
	document.addEventListener("mousemove", s5MouseHandler);
});

s5CardConAll.addEventListener("mouseleave", () => {
	console.log("---out----");
	s5Mouseicn.style.display = "none";
});
//   console.log("out");
//   s5Mouseicn.style.display = "none";
//   document.addEventListener("wheel", wheelHandler);
//   document.removeEventListener("mousemove", s5MouseHandler);
// });

const s5MouseHandler = (event) => {
	const mouseX = event.clientX;
	const mouseY = event.clientY;
	s5Mouseicn.style.left = mouseX + "px";
	s5Mouseicn.style.top = mouseY + "px";
};

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 6
// mouse cursor (scroll)
const s6CardConAll = document.querySelectorAll("#yj-main-s6");
const s6Mouseicn = document.querySelector(".yj-main-s6-cursor");

s6CardConAll.forEach((card) => {
	card.addEventListener("mouseenter", function(event) {
		s6Mouseicn.querySelector("img").src =
			"main/imgFolder/yj-main-default-scroll.png";
		card.style.cursor = "none";
		s6Mouseicn.classList.remove("yj-main-s6-cursor-none");
		s6Mouseicn.classList.add("yj-main-s6-cursor-block");
	});

	card.addEventListener("mouseleave", function() {
		s6Mouseicn.classList.remove("yj-main-s6-cursor-block");
		s6Mouseicn.classList.add("yj-main-s6-cursor-none");
	});
});

document.addEventListener("mousemove", (event) => {
	const mouseX = event.clientX;
	const mouseY = event.clientY;
	s6Mouseicn.style.left = mouseX + "px";
	s6Mouseicn.style.top = mouseY + "px";
});


// ////////// ////////// ////////// ////////// ////////// //////////
// Section 7
  document.getElementById('footer-topBtn').addEventListener('click', function(event) {
    event.preventDefault();
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });