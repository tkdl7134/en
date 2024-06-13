// document.addEventListener("DOMContentLoaded", () => {
//   const sections = document.querySelectorAll(".yj-main-section");
//   console.log(sections);
//   let currentSection = 0;

//   const showSection = (index) => {
//     sections.forEach((section, i) => {
//       section.style.transform = `translateY(${(i - index) * 100}vh)`;
//     });
//   };

//   showSection(currentSection);

//   const handleScroll = (event) => {
//     console.log("scrolling..");
//     if (event.deltaY > 0) {
//       // Scrolling down
//       if (currentSection < sections.length - 1) {
//         currentSection++;
//         showSection(currentSection);
//       }
//     } else {
//       // Scrolling up
//       if (currentSection > 0) {
//         currentSection--;
//         showSection(currentSection);
//       }
//     }
//   };

//   window.addEventListener("wheel", handleScroll);
// });

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
