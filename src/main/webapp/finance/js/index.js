function numberMaxLength(e) {
  if (e.value.length > e.maxLength) {
    e.value = e.value.slice(0, e.maxLength);
  }
}

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