function goStatistic() {
	const container = document.querySelector("#kh-input-box");
	const finput = document.querySelector(".kh-f-input");
	const warnspan = document.querySelector("#kh-warn-text");
	if (finput.value == "") {
		container.classList.add("vibration");
		setTimeout(function() {
			container.classList.remove("vibration");
		}, 300);
		if (warnspan.classList.contains("kh-none")) {
			warnspan.classList.remove("kh-none");
			warnspan.classList.add("kh-show");
		}
	} else {
		location.href = "StatisticsC";
	}
}
