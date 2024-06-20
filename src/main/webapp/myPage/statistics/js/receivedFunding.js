let eventno = 1;
let scrollTimeout;
let isMouseOverCard;
let jsoninfos;
//카드 초기배치
$.ajax({
	type: "post",
	url: "FundC",
	data: { eno: eventno },
	async: false,
	dataType: "json",
	success: function(response) {
		console.log(response);
		jsoninfos = response;
		response.forEach((element, index) => {
			eventno = element.e_no;
			$(".kh-f-card-container").append(`
				<div class="kh-f-card-out">
					<div class="kh-fund-card" value="${element.wl_no}">
						<div style="height: 18rem">
							<img style="height: 100%" alt="noImg" src="myPage/statistics/imgFolder/${element.wl_product}.png" />
						</div>
						<div>
							<h1>${element.wl_product}</h3>
						</div>
					</div>
				</div>`);
		});
		$(".kh-f-card-container").append(`<div class="kh-f-card-fake"></div>`)
		let percent = response.percent;
		if (percent === undefined) {
			percent = 0;
		}
		let card = document.querySelectorAll(".kh-f-card-out");
		//let fpop = document.querySelector(".kh-f-popup");
		//const modal = document.getElementById("modal");
		card.forEach((element, index, array) => {
			let cardIn = element.querySelector(".kh-fund-card");
			cardIn.stri
			if (index % 2 == 0) {
				element.style.transform = "scale(0.9)";
				element.classList.add("kh-f-card-min");
				cardIn.style.backgroundColor = "#FFF1E0";
			} else {
				cardIn.style.backgroundColor = "#FFE0E0";
			}
			element.style.transition = "0.8s ease-in-out";
			element.addEventListener("mouseenter", () => {
				isMouseOverCard = true;
			});
			element.addEventListener("mouseleave", () => {
				isMouseOverCard = false;
			});
			element.addEventListener("mouseover", function(event) {
				card.forEach((otherCard) => {
					if (otherCard !== element) {
						if (otherCard.classList.contains("kh-f-card-min")) {
							otherCard.style.transform = "scale(0.8)";
						} else {
							otherCard.style.transform = "scale(0.9)";
						}
						otherCard.style.filter = "grayscale(100%)";
					}
					document.querySelector(".kh-f-mousemove > img").src =
						"myPage/statistics/imgFolder/viewbtn.png";
					mouseicn.classList.remove("kh-f-none");
					mouseicn.classList.add("kh-f-block");
				});
				if (element.classList.contains("kh-f-card-min")) {
					this.style.transform = "scale(1)";
				} else {
					this.style.transform = "scale(1.1)";
				}
				event.stopPropagation();
			});
			element.addEventListener("mouseout", function(event) {
				card.forEach((otherCard) => {
					if (otherCard !== element) {
						if (otherCard.classList.contains("kh-f-card-min")) {
							otherCard.style.transform = "scale(0.9)";
						} else {
							otherCard.style.transform = "scale(1)";
						}
						otherCard.style.filter = "none";
					}
				});
				if (element.classList.contains("kh-f-card-min")) {
					this.style.transform = "scale(0.9)";
				} else {
					this.style.transform = "scale(1)";
				}
				event.stopPropagation();
			});
			element.addEventListener("click", function(event) {
				console.log(jsoninfos);
			let cardParent = event.target.closest(".kh-fund-card");
				element.classList.add("kh-f-rotate");
				if (cardParent) {
					let wlno = event.target.closest(".kh-fund-card").getAttribute("value");
					let selectobj = jsoninfos.find(function(element) {
						return element.wl_no === wlno;
					});
				if (selectobj.percent === undefined) {
					percent = 0;
			}
					else{
						percent = selectobj.percent;
					};
				let wl_no = cardIn.getAttribute("value");
				location.href = `receivedSpecificFundingC?wlno=${wl_no}&eno=`+eventno;
					document.querySelector("#kh-f-price").innerHTML = percent;
					document.querySelector("#kh-f-product").innerHTML = selectobj.wl_product;
					document.querySelector(".kh-f-btn").setAttribute("value", selectobj.wl_no);
					document.querySelector("#kh-f-img").src = "myPage/statistics/imgFolder/" + selectobj.wl_product + ".png";
					//modal.showModal();
					document.querySelector(".kh-f-mousemove > img").src =
						"myPage/statistics/imgFolder/backbtn.png";
					fpop.classList.add("kh-f-rotate");
				}
				scrollTimeout = setTimeout(() => {
					element.classList.remove("kh-f-rotate");
					fpop.classList.remove("kh-f-rotate");
				}, 1000);
				event.stopPropagation();
				
				
			});
		});



		/*modal.addEventListener("click", function(event) {
			if (!fpop.contains(event.target)) {
				closeModal();
			}
		});

		// 모달 내부 클릭 시 이벤트 전파를 막기
		modal.addEventListener("click", function(event) {
			if (!fpop.contains(event.target)) {
				event.stopPropagation();
			}
		});*/

		//변수 설정
		const cardCon = document.querySelector(".kh-f-card-container");
		const mouseicn = document.querySelector(".kh-f-mousemove");
		console.log(mouseicn);
		//마우스 따라다니는 요소
		cardCon.addEventListener("mouseover", function(event) {
			if (event.target === cardCon) {
				document.querySelector(".kh-f-mousemove > img").src =
					"myPage/statistics/imgFolder/dragbtn.png";
			}
			cardCon.style.cursor="none";
			mouseicn.classList.remove("kh-f-none");
			mouseicn.classList.add("kh-f-block");
			event.stopPropagation();
		});
		document.addEventListener("mousemove", (event) => {
			const mouseX = event.clientX;
			const mouseY = event.clientY;
			mouseicn.style.pointerEvents = "none";
			mouseicn.style.left = mouseX + "px";
			mouseicn.style.top = mouseY + "px";
		});
		cardCon.addEventListener("mouseout", function() {
			mouseicn.classList.remove("kh-f-block");
			mouseicn.classList.add("kh-f-none");
		});

		//마우스 휠할때 도는 애니메이션
		let isRotated = false;
		cardCon.addEventListener("wheel", function(event) {
			if (isMouseOverCard) return;
			card.forEach((element) => {
				// Prevent the default vertical scroll
				event.preventDefault();
				// Scroll horizontally
				const scrollSpeed = 0.5;
				this.scrollLeft += event.deltaY * scrollSpeed;
				if (scrollTimeout) {
					if (element.classList.contains("kh-f-card-min")) {
						element.style.transform = "scale(0.9) rotateY(30deg)";
					} else {
						element.style.transform = "rotateY(30deg)";
					}
					clearTimeout(scrollTimeout);
				}
				// Set a timeout to remove the vibration class after 1 second
				scrollTimeout = setTimeout(() => {
					card.forEach(function(element) {
						element.style.transform = "rotateY(0deg)";
						if (element.classList.contains("kh-f-card-min")) {
							element.style.transform = "scale(0.9)";
						} else {
							element.style.transform = "scale(1)";
						}
					});
					isRotated = false;
				}, 300); // 1초 동안 유지
			});
		});

		let isDown = false;
		let startX;
		let scrollLeft;

		cardCon.addEventListener("mousedown", (e) => {
			isDown = true;
			cardCon.classList.add("active");
			startX = e.pageX - cardCon.offsetLeft;
			scrollLeft = cardCon.scrollLeft;
		});

		cardCon.addEventListener("mouseleave", () => {
			isDown = false;
			cardCon.classList.remove("active");
		});

		cardCon.addEventListener("mouseup", () => {
			isDown = false;
			cardCon.classList.remove("active");
		});

		cardCon.addEventListener("mousemove", (e) => {
			if (!isDown) return;
			e.preventDefault();
			const x = e.pageX - cardCon.offsetLeft;
			const walk = (x - startX) * 2; //scroll-fast
			cardCon.scrollLeft = scrollLeft - walk;
		});

		// For touch devices
		cardCon.addEventListener("touchstart", (e) => {
			isDown = true;
			startX = e.touches[0].pageX - cardCon.offsetLeft;
			scrollLeft = cardCon.scrollLeft;
		});

		cardCon.addEventListener("touchend", () => {
			isDown = false;
		});

		cardCon.addEventListener("touchmove", (e) => {
			if (!isDown) return;
			const x = e.touches[0].pageX - cardCon.offsetLeft;
			const walk = (x - startX) * 2; //scroll-fast
			cardCon.scrollLeft = scrollLeft - walk;
		});






	},
});//ajax 종료
//크기,색상 호버시 확대 및 다른요소 비활성화


function goStatistic(no) {
	const container = document.querySelector("#kh-input-box");
	const finput = document.querySelector(".kh-f-input");
	const warnspan = document.querySelector("#kh-warn-text");
	const eno = eventno;
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
		location.href =
			"StatisticsC?paytype=fund&price=" +
			finput.value +
			"&eno=" +
			eno +
			"&wlno=" +
			no;
	}
}
/*
function openModal() {
	const modal = document.getElementById("modal");
	modal.showModal();
}

function closeModal() {
	const modal = document.getElementById("modal");
	modal.close();
}*/

