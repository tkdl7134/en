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
