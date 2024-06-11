let card = document.querySelectorAll(".kh-f-card-out");
let fpop = document.querySelector(".kh-f-popup");
const cardColor = ["#FFF1E0", "#FFE0E0"];
let scrollTimeout;
let jlist = document.querySelector("#jlist");
let jsonData = JSON.parse(jlist.value);
const eno = jsonData[0].e_no;
console.log(eno);
console.log(jsonData);
let isMouseOverCard;
card.forEach((element, index, array) => {

	let cardIn = element.querySelector(".kh-fund-card");
	if (index % 2 == 0) {
		element.style.transform = 'scale(0.9)';
		element.classList.add("kh-f-card-min");
		cardIn.style.backgroundColor = "#FFF1E0";
	}
	else {
		cardIn.style.backgroundColor = "#FFE0E0";
	}
	element.style.transition = "0.8s ease-in-out";
	element.addEventListener('mouseenter', () => {
		isMouseOverCard = true;
		console.log('true');
	});
	element.addEventListener('mouseleave', () => {
		isMouseOverCard = false;
		console.log('false');
	});
	element.addEventListener("mouseover", function(event) {
		card.forEach((otherCard) => {
			if (otherCard !== element) {
				if (otherCard.classList.contains('kh-f-card-min')) {
					otherCard.style.transform = 'scale(0.8)';
				}
				else {
					otherCard.style.transform = 'scale(0.9)';
				}
				otherCard.style.filter = 'grayscale(100%)';
			}
			document.querySelector(".kh-f-mousemove > img").src = "finance/img/viewbtn.png";
			mouseicn.classList.remove("kh-f-none");
			mouseicn.classList.add("kh-f-block");
		});
		if (element.classList.contains('kh-f-card-min')) {
			this.style.transform = "scale(1)";
		}
		else {
			this.style.transform = "scale(1.1)";
		}
		event.stopPropagation();
	});
	element.addEventListener("mouseout", function(event) {
		card.forEach((otherCard) => {
			if (otherCard !== element) {
				if (otherCard.classList.contains('kh-f-card-min')) {
					otherCard.style.transform = 'scale(0.9)';
				}
				else {
					otherCard.style.transform = 'scale(1)';
				}
				otherCard.style.filter = 'none';
			}
		});
		if (element.classList.contains('kh-f-card-min')) {
			this.style.transform = "scale(0.9)";
		}
		else {
			this.style.transform = "scale(1)";
		}
		event.stopPropagation();
	});
	element.addEventListener("click", function(event) {
		let cardChild = event.target.closest('.kh-fund-card');
		element.classList.add("kh-f-rotate")
		if (cardChild) {
			let i = event.target.closest(".kh-fund-card").getAttribute("value");
			document.querySelector("#kh-f-product").innerHTML = jsonData[i].wl_product;
			document.querySelector("#kh-f-price").innerHTML = jsonData[i].wl_price;
			document.querySelector("#kh-f-comment").innerHTML = jsonData[i].wl_comment;
			document.querySelector(".kh-f-btn").setAttribute("value", jsonData[i].wl_no);
			fpop.style.display = "flex";
			fpop.style.trasform = "transrate(-50%,-50%)";
			fpop.classList.add("kh-f-rotate");
		}
		scrollTimeout = setTimeout(() => {
			element.classList.remove("kh-f-rotate");
			fpop.classList.remove("kh-f-rotate");
		}, 200);
		event.stopPropagation();
	});
});

document.addEventListener("click", function(event) {
	if (fpop.style.display === "flex") {
		if (event.target !== fpop && !fpop.contains(event.target)) {
			fpop.style.display = "none";
		}
	}
});
const cardCon = document.querySelector(".kh-f-card-container");
const cardConAll = document.querySelectorAll(".kh-f-card-container");
const mouseicn = document.querySelector(".kh-f-mousemove");

cardCon.addEventListener("mouseover", function(event) {
	if (event.target === cardCon) {
		document.querySelector(".kh-f-mousemove > img").src = "finance/img/dragbtn.png";
	}
	mouseicn.classList.remove("kh-f-none");
	mouseicn.classList.add("kh-f-block");
	event.stopPropagation();
});
document.addEventListener('mousemove', (event) => {
	const mouseX = event.clientX;
	const mouseY = event.clientY;
	mouseicn.style.pointerEvents = 'none';
	mouseicn.style.left = mouseX + 'px';
	mouseicn.style.top = mouseY + 'px';
});
cardCon.addEventListener("mouseout", function() {
	mouseicn.classList.remove("kh-f-block");
	mouseicn.classList.add("kh-f-none");
});


cardCon.addEventListener("wheel", function(event) {
	if (isMouseOverCard) return;
	card.forEach((element) => {
		// Prevent the default vertical scroll
		event.preventDefault();
		element.style.transform = 'rotateY(30deg)';
		// Scroll horizontally
		const scrollSpeed = 0.5;
		this.scrollLeft += event.deltaY * scrollSpeed;
		// Add 'asd' class to start the transition
		if (scrollTimeout) {
			clearTimeout(scrollTimeout);
		}
		// Set a timeout to remove the vibration class after 1 second
		scrollTimeout = setTimeout(() => {
			card.forEach(function(element) {
				element.style.transform = 'rotateY(0deg)';
				element.style.transform = '';
			});
		}, 500); // 1초 동안 유지
	});
});

let isDown = false;
let startX;
let scrollLeft;

cardCon.addEventListener("mousedown", (e) => {
	isDown = true;
	cardCon.classList.add('active');
	startX = e.pageX - cardCon.offsetLeft;
	scrollLeft = cardCon.scrollLeft;
});

cardCon.addEventListener("mouseleave", () => {
	isDown = false;
	cardCon.classList.remove('active');
});

cardCon.addEventListener("mouseup", () => {
	isDown = false;
	cardCon.classList.remove('active');
});
let isRotated = false;
cardCon.addEventListener("mousemove", (e) => {
	if (!isDown) return;
	e.preventDefault();
	const x = e.pageX - cardCon.offsetLeft;
	const walk = (x - startX) * 2; //scroll-fast
	cardCon.scrollLeft = scrollLeft - walk;
	card.forEach((element) => {
		e.preventDefault();
		if (scrollTimeout) {
			element.style.transform += ' rotateY(30deg)';
			clearTimeout(scrollTimeout);
		}
		scrollTimeout = setTimeout(() => {
			card.forEach(function(element) {
				if (!isRotated) {
					element.style.transform += ' rotateY(0deg)';
					isRotated = true;
				}
				if (element.classList.contains("kh-f-card-min")) {
					element.style.transform = 'scale(0.9)';
				}
				else {
					element.style.transform = 'scale(1)';
				}
			});
			isRotated = false;
		}, 500);
	});
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
	card.forEach((element) => {
		e.preventDefault();
			element.style.transform += ' rotateY(30deg)';
		if (scrollTimeout) {
			clearTimeout(scrollTimeout);
		}
		scrollTimeout = setTimeout(() => {
			card.forEach(function(element) {
				if (!isRotated) {
					element.style.transform += ' rotateY(0deg)';
					isRotated = true;
				}
				if (element.classList.contains("kh-f-card-min")) {
					element.style.transform = 'scale(0.9)';
				}
				else {
					element.style.transform = 'scale(1)';
				}
			});
			isRotated = false;
		}, 500);

	});
	e.stopPropagation();
});

function goStatistic(no) {
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
		console.log(jsonData[0]);
		location.href = "StatisticsC?paytype=fund&price=" + finput.value
			+ "&eno=" + eno + "&wlno=" + no;
	}
}