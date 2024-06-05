const itembox = document.querySelectorAll(".kh-s-recom-item-box");
const sinput = document.querySelector(".kh-s-input");
itembox.forEach((element) => {
  element.addEventListener("click", function () {
    sinput.value = this.getAttribute("value");
  });
});
function goFinanceResult() {
  const container = document.querySelector("#kh-input-box");
  const sinput = document.querySelector(".kh-s-input");
  const warnspan = document.querySelector("#kh-warn-text");
  if (sinput.value == "") {
    container.classList.add("vibration");
    setTimeout(function () {
      container.classList.remove("vibration");
    }, 300);
    if(warnspan.classList.contains("kh-none")){
		warnspan.classList.remove("kh-none");
		warnspan.classList.add("kh-show");
	}
  } else {
    location.href = "ResultC";
  }
}
