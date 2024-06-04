const itembox = document.querySelectorAll(".kh-s-recom-item-box");
const sinput = document.querySelector(".kh-s-input");
itembox.forEach((element) => {
  element.addEventListener("click", function () {
    sinput.value = this.getAttribute("value");
  });
});
