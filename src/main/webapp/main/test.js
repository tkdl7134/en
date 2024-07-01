const logo = document.querySelector(".yj-main-s2-menu>img");
const navi = document.querySelector(".navi");
logo.addEventListener("click", function () {
  if (navi.classList.contains("nonnon")) {
    this.src = "imgFolder/yj-main-default-menu2.png";
    navi.classList.remove("nonnon");
    navi.classList.add("onon");
  } else {
    this.src = "imgFolder/yj-main-default-menu1.png";
    navi.classList.remove("onon");
    navi.classList.add("nonnon");
  }
});
