function numberMaxLength(e) {
  if (e.value.length > e.maxLength) {
    e.value = e.value.slice(0, e.maxLength);
  }
}

let deg = 15;
let zindex = 0;
let card = document.querySelectorAll(".kh-fund-card");
let mzindex = card.length;
let ci = 0;
let fpop = document.querySelector(".kh-f-popup");
const cardColor = ["#FFE2FC", "#FFFDD1", "#E4FAFF", "#E2FFC5", "#DDD7FF"];
card.forEach((element) => {
  let cdeg = deg;
  element.style.transform = "rotate(" + cdeg + "deg)";
  element.style.backgroundColor = cardColor[ci];
  element.style.transition = "0.1s ease-out";
  console.log(cardColor[ci]);
  element.addEventListener("mouseover", function () {
    this.style.transform = "rotate(0deg)";
    this.style.scale = "120%";
    this.style.zIndex = mzindex + 1;
    this.style.transform = "translateY(-100px)";
  });
  element.addEventListener("mouseout", function () {
    this.style.transform = "rotate(" + cdeg + "deg)";
    this.style.scale = "100%";
    this.style.zIndex = zindex;
    console.log(zindex);
  });
  element.addEventListener("click", function (event) {
    fpop.style.display = "flex";
    event.stopPropagation();
  });

  ci += 1;
  if (ci >= cardColor.length) {
    ci = 0;
  }
  deg *= -1;
  zindex += 1;
});
document.addEventListener("click", function (event) {
  if (fpop.style.display === "flex") {
    if (event.target !== fpop && !fpop.contains(event.target)) {
      fpop.style.display = "none";
    }
  }
});
const cardCon = document.querySelector(".kh-f-card-container");
console.log(cardCon);
cardCon.addEventListener("scroll", function () {
  console.log(`Scroll Position - X: ${this.scrollLeft}, Y: ${this.scrollTop}`);
});
cardCon.addEventListener("wheel", function (event) {
  // Prevent the default vertical scroll
  event.preventDefault();
  // Scroll horizontally
  const scrollSpeed = 0.5;
  this.scrollLeft += event.deltaY * scrollSpeed;
});
//let furin = document.querySelector(".kh-furin");
//furin.classList.add("kh-swaying");
// furin.addEventListener("mouseover", function () {
//   this.classList.add("kh-swaying");
// });
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
function removeWarn(){
	const warnspan = document.querySelector("#kh-warn-text");
	if(warnspan.classList.contains("kh-show")){
		warnspan.classList.remove("kh-show");
		warnspan.classList.add("kh-none");
	}
}