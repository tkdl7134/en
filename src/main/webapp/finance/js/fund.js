let deg = 15;
let zindex = 0;
let card = document.querySelectorAll(".kh-fund-card");
let mzindex = card.length;
let ci = 0;
let fpop = document.querySelector(".kh-f-popup");
const cardColor = ["#FFE2FC", "#FFFDD1", "#E4FAFF", "#E2FFC5", "#DDD7FF"];
let jlist = document.querySelector("#jlist");
let jsonData = JSON.parse(jlist.value);
const eno = jsonData[0].e_no;
console.log(eno);
console.log(jsonData);
card.forEach((element) => {
	let cdeg = deg;
	element.style.transform = "rotate(" + cdeg + "deg)";
	element.style.backgroundColor = cardColor[ci];
	element.style.transition = "0.1s ease-out";
	element.addEventListener("mouseover", function() {
		this.style.transform = "rotate(0deg)";
		this.style.scale = "120%";
		this.style.zIndex = mzindex + 1;
		this.style.transform = "translateY(-100px)";
	});
	element.addEventListener("mouseout", function() {
		this.style.transform = "rotate(" + cdeg + "deg)";
		this.style.scale = "100%";
		this.style.zIndex = zindex;
	});
	element.addEventListener("click", function(event) {
		let cardChild = event.target.closest('.kh-fund-card');
		if (cardChild) {
			let i = event.target.closest(".kh-fund-card").getAttribute("value");
			document.querySelector("#kh-f-product").innerHTML = jsonData[i].wl_product;
			document.querySelector("#kh-f-price").innerHTML = jsonData[i].wl_price;
			document.querySelector("#kh-f-comment").innerHTML = jsonData[i].wl_comment;
			document.querySelector(".kh-f-btn").setAttribute("value", jsonData[i].wl_no);
			fpop.style.display = "flex";
		}


		event.stopPropagation();
	});

	ci += 1;
	if (ci >= cardColor.length) {
		ci = 0;
	}
	deg *= -1;
	zindex += 1;
});
document.addEventListener("click", function(event) {
	if (fpop.style.display === "flex") {
		if (event.target !== fpop && !fpop.contains(event.target)) {
			fpop.style.display = "none";
		}
	}
});
const cardCon = document.querySelector(".kh-f-card-container");
cardCon.addEventListener("scroll", function() {
});
cardCon.addEventListener("wheel", function(event) {
	// Prevent the default vertical scroll
	event.preventDefault();
	// Scroll horizontally
	const scrollSpeed = 0.5;
	this.scrollLeft += event.deltaY * scrollSpeed;
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