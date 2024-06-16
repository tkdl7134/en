// Overall
// Full Page Scroll
const sections = document.querySelectorAll(".yj-main-section");
let currentSectionIndex = 0;
let isThrottled = false;

function throttle(callback, time) {
  if (!isThrottled) {
    callback();
    isThrottled = true;
    setTimeout(function () {
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

document.addEventListener("wheel", function (event) {
  if (event.deltaY > 0) {
    // 스크롤 다운
    throttle(goToNextSection, 1000); // throttle 함수를 사용하여 이벤트 처리 간격을 조정할 수 있습니다.
  } else {
    // 스크롤 업
    throttle(goToPrevSection, 1000);
  }
});

// Section 2
// 메뉴 버튼 클릭 이벤트
const menuBtn = document.getElementById("yj-main-s2-menuBtn");
const menuBtn1 = "imgFolder/yj-main-default-menu1.png";
const menuBtn2 = "imgFolder/yj-main-default-menu2.png";

// 메뉴 이미지 클릭 이벤트 리스너 등록
menuBtn.addEventListener("click", function () {
  // 현재 이미지 src 확인
  const currentSrc = this.querySelector("img").src;

  // 이미지 변경
  if (currentSrc.includes(menuBtn1)) {
    this.querySelector("img").src = menuBtn2;
  } else {
    this.querySelector("img").src = menuBtn1;
  }
});

// Section 2
// 배경 이미지  슬라이드
function slickStart() {
  $(".yj-main-s2-bg").css(
    "background-image",
    "url('imgFolder/yj-main-s2-img1.png')"
  );
  // 슬릭 슬라이더의 beforeChange 이벤트 리스너 등록
  $(".yj-main-s2-list").on(
    "beforeChange",
    function (event, slick, currentSlide, nextSlide) {
      console.log(currentSlide);
      // 각 슬라이드의 배경 이미지 URL을 설정할 배열
      var bgImageUrls = [
        "imgFolder/yj-main-s2-img1.png",
        "imgFolder/yj-main-s2-img2.png",
        "imgFolder/yj-main-s2-img3.png",
        "imgFolder/yj-main-s2-img4.png",
        "imgFolder/yj-main-s2-img5.png",
        "imgFolder/yj-main-s2-img6.png",
        "imgFolder/yj-main-s2-img7.png",
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

// Section 2
// Single Item Slide
$(document).ready(function () {
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
    .on("afterChange", function (event, slick, currentSlide) {
      var currentSlideImage = slick.$slides
        .eq(currentSlide)
        .find("img")
        .attr("src");
      $("#currentSlideImage").attr("src", currentSlideImage);
    });
});
