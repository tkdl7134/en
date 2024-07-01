// 로고 버튼 클릭 이벤트
document.addEventListener('DOMContentLoaded', (event) => {
	const mainLogo = document.querySelector(".mainLogo");
	const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");
	
		mainLogo.addEventListener('click', (event) => {
			event.preventDefault();
			mainLogo.style.cursor = "pointer";
			location.href='MainC';
		});

	

// ////////// ////////// ////////// ////////// ////////// //////////
// 메뉴 버튼 클릭 이벤트
	const menus = document.querySelector(".yj-main-menu");
	const navi = document.querySelector(".yj-main-nav");
		console.log(menus);
		console.log(navi);
	menus.addEventListener("click", function() {
		console.log(menus);
		console.log(navi);
		const menuBtn = menus.querySelector("img");
		if (navi.classList.contains("nav-hidden")) {
			menuBtn.src = "main/imgFolder/yj-main-menu2.png";
			navi.classList.remove("nav-hidden");
			navi.classList.add("nav-show");
		} else {
			menuBtn.src = "main/imgFolder/yj-main-menu1.png";
			navi.classList.remove("nav-show");
			navi.classList.add("nav-hidden");
		}
	});


});

