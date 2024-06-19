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

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 2
// 메뉴 버튼 클릭 이벤트
const s2menuBtn = document.getElementById("yj-main-s2-menuBtn");
const s2menuBtn1 = "imgFolder/yj-main-default-menu1.png";
const s2menuBtn2 = "imgFolder/yj-main-default-menu2.png";

// 메뉴 이미지 클릭 이벤트 리스너 등록
s2menuBtn.addEventListener("click", function () {
  // 현재 이미지 src 확인
  const currentSrc = this.querySelector("img").src;

  // 이미지 변경
  if (currentSrc.includes(s2menuBtn1)) {
    this.querySelector("img").src = s2menuBtn2;
  } else {
    this.querySelector("img").src = s2menuBtn1;
  }
});

// mouse cursor (drag)
const s2CardConAll = document.querySelectorAll(".yj-main-s2-section");
const s2Mouseicn = document.querySelector(".yj-main-s2-cursor");

s2CardConAll.forEach((card) => {
  card.addEventListener("mouseenter", function (event) {
    s2Mouseicn.querySelector("img").src = "imgFolder/yj-main-s2-drag.png";
    card.style.cursor = "none";
    s2Mouseicn.classList.remove("yj-main-s2-cursor-none");
    s2Mouseicn.classList.add("yj-main-s2-cursor-block");
  });

  card.addEventListener("mouseleave", function () {
    s2Mouseicn.classList.remove("yj-main-s2-cursor-block");
    s2Mouseicn.classList.add("yj-main-s2-cursor-none");
  });
});

document.addEventListener("mousemove", (event) => {
  const mouseX = event.clientX;
  const mouseY = event.clientY;
  s2Mouseicn.style.left = mouseX + "px";
  s2Mouseicn.style.top = mouseY + "px";
});

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

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 3
// 메뉴 버튼 클릭 이벤트
const s3menuBtn = document.getElementById("yj-main-s3-menuBtn");
const s3menuBtn1 = "imgFolder/yj-main-default-menu1.png";
const s3menuBtn2 = "imgFolder/yj-main-default-menu2.png";

// 메뉴 이미지 클릭 이벤트 리스너 등록
s3menuBtn.addEventListener("click", function () {
  // 현재 이미지 src 확인
  const currentSrc = this.querySelector("img").src;

  // 이미지 변경
  if (currentSrc.includes(s3menuBtn1)) {
    this.querySelector("img").src = s3menuBtn2;
  } else {
    this.querySelector("img").src = s3menuBtn1;
  }
});

// 체크체크테스트
// document.addEventListener("DOMContentLoaded", () => {
//   const textElement = document.getElementById("verticalText");
//   const text = textElement.textContent;
//   textElement.textContent = "";

//   for (let i = 0; i < text.length; i++) {
//     const span = document.createElement("span");
//     span.textContent = text[i];
//     span.style.display = "inline-block";
//     span.style.transform = "translateY(-100%)";
//     span.style.opacity = "0";
//     span.style.transition = `transform 0.5s ease, opacity 0.5s ease`;
//     span.style.transitionDelay = `${i * 0.1}s`;
//     textElement.appendChild(span);
//   }

//   setTimeout(() => {
//     const spans = textElement.querySelectorAll("span");
//     spans.forEach((span) => {
//       span.style.transform = "translateY(0)";
//       span.style.opacity = "1";
//     });
//   }, 100);
// });

// document.addEventListener("DOMContentLoaded", () => {
//   const textElement = document.getElementById("verticalText1");
//   const text = textElement.textContent;
//   textElement.textContent = "";

//   for (let i = 0; i < text.length; i++) {
//     const span = document.createElement("span");
//     span.textContent = text[i];
//     textElement.appendChild(span);
//     if (i < text.length - 1) {
//       textElement.appendChild(document.createElement("br"));
//     }
//   }
// });
// document.addEventListener("DOMContentLoaded", () => {
//   const textElement = document.getElementById("verticalText2");
//   const text = textElement.textContent;
//   textElement.textContent = "";

//   for (let i = 0; i < text.length; i++) {
//     const span = document.createElement("span");
//     span.textContent = text[i];
//     textElement.appendChild(span);
//     if (i < text.length - 1) {
//       textElement.appendChild(document.createElement("br"));
//     }
//   }
// });

// 이 때 스타일은 잘 적용되나 애니는 적용 x
// document.addEventListener("DOMContentLoaded", () => {
//   const textElement = document.getElementById("verticalText");
//   const text = textElement.textContent;
//   textElement.textContent = "";

//   for (let i = 0; i < text.length; i++) {
//     const span = document.createElement("span");
//     span.textContent = text[i];
//     textElement.appendChild(span);
//   }
// });

document.addEventListener("DOMContentLoaded", () => {
  const textElement = document.getElementById("verticalText");
  const text = textElement.textContent;
  textElement.textContent = "";

  for (let i = 0; i < text.length; i++) {
    const span = document.createElement("span");
    span.textContent = text[i];
    span.style.display = "inline-block";
    span.style.transform = "translateY(-100%)";
    span.style.opacity = "0";
    span.style.animation = `slideDown 0.5s ease forwards`;
    span.style.animationDelay = `${i * 0.1}s`;
    textElement.appendChild(span);
  }
});

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 4
// 메뉴 버튼 클릭 이벤트
const s4menuBtn = document.getElementById("yj-main-s4-menuBtn");
const s4menuBtn1 = "imgFolder/yj-main-default-menu1.png";
const s4menuBtn2 = "imgFolder/yj-main-default-menu2.png";

// 메뉴 이미지 클릭 이벤트 리스너 등록
s4menuBtn.addEventListener("click", function () {
  // 현재 이미지 src 확인
  const currentSrc = this.querySelector("img").src;

  // 이미지 변경
  if (currentSrc.includes(s4menuBtn1)) {
    this.querySelector("img").src = s4menuBtn2;
  } else {
    this.querySelector("img").src = s4menuBtn1;
  }
});

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
  card.addEventListener("mouseenter", function (event) {
    mouseicn.querySelector("img").src = "imgFolder/yj-main-s4-click.png";
    card.style.cursor = "none";
    mouseicn.classList.remove("yj-main-s4-cursor-none");
    mouseicn.classList.add("yj-main-s4-cursor-block");
  });

  card.addEventListener("mouseleave", function () {
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
const s5CardConAll = document.querySelectorAll(".yj-main-s5-bigCon");
const s5Mouseicn = document.querySelector(".yj-main-s5-cursor");

s5CardConAll.forEach((card) => {
  card.addEventListener("mouseenter", function (event) {
    s5Mouseicn.querySelector("img").src = "imgFolder/yj-main-s5-scroll.png";
    card.style.cursor = "none";
    s5Mouseicn.classList.remove("yj-main-s5-cursor-none");
    s5Mouseicn.classList.add("yj-main-s5-cursor-block");
  });

  card.addEventListener("mouseleave", function () {
    s5Mouseicn.classList.remove("yj-main-s5-cursor-block");
    s5Mouseicn.classList.add("yj-main-s5-cursor-none");
  });
});

document.addEventListener("mousemove", (event) => {
  const mouseX = event.clientX;
  const mouseY = event.clientY;
  s5Mouseicn.style.left = mouseX + "px";
  s5Mouseicn.style.top = mouseY + "px";
});

// ////////// ////////// ////////// ////////// ////////// //////////
// Section 6
const s6menuBtn = document.getElementById("yj-main-s6-menuBtn");
const s6menuBtn1 = "imgFolder/yj-main-default-menu1.png";
const s6menuBtn2 = "imgFolder/yj-main-default-menu2.png";

// 메뉴 이미지 클릭 이벤트 리스너 등록
s6menuBtn.addEventListener("click", function () {
  // 현재 이미지 src 확인
  const currentSrc = this.querySelector("img").src;

  // 이미지 변경
  if (currentSrc.includes(s6menuBtn1)) {
    this.querySelector("img").src = s6menuBtn2;
  } else {
    this.querySelector("img").src = s6menuBtn1;
  }
});

// mouse cursor (scroll)
const s6CardConAll = document.querySelectorAll("#yj-main-s6");
const s6Mouseicn = document.querySelector(".yj-main-s6-cursor");

s6CardConAll.forEach((card) => {
  card.addEventListener("mouseenter", function (event) {
    s6Mouseicn.querySelector("img").src = "imgFolder/yj-main-s5-scroll.png";
    card.style.cursor = "none";
    s6Mouseicn.classList.remove("yj-main-s6-cursor-none");
    s6Mouseicn.classList.add("yj-main-s6-cursor-block");
  });

  card.addEventListener("mouseleave", function () {
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
