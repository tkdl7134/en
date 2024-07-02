document.addEventListener('DOMContentLoaded', function() {
	const currentPage = document.getElementById('currentPage').value;  // currentPage 값을 가져오기 위한 수정
	const bodyElement = document.getElementById('page_top');
	if (currentPage > 1) {
		bodyElement.classList.remove('background-image');
	} else {
		bodyElement.classList.add('background-image');
	}
	const canContainer = document.getElementById("canvas-content-container");
	const canContent = document.querySelector(".canvas-content");
	console.log(canContainer);
	console.log(canContent);
	function resizeCanvas(canvas, imgpath) {
		let ctx = canvas.getContext("2d");

		// 설정할 캔버스 크기
		let canvasWidth = window.innerWidth;
		let canvasHeight = window.innerHeight;

		// 캔버스 크기 설정
		canvas.width = canvasWidth;
		canvas.height = canvasHeight;

		// 이미지 로드 및 그리기
		let img = new Image();
		img.src = imgpath; // 여기에 이미지 경로를 입력하세요
		img.onload = function() {
			ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
		};

		// 콘솔 로그
		console.log(
			`Window resized: width=${canvasWidth}, height=${canvasHeight}`
		);
	}


	let canConH = window.getComputedStyle(canContent).height;
	console.log(canConH);
	// 문자열에서 'px'를 제거하고 숫자로 변환
	let canConHNum = parseFloat(canConH);
	console.log(canConHNum);

	// 계산 수행
	let calcRes = canConHNum + 1200;
	console.log(calcRes);

	// 결과 적용
	canContent.style.height = calcRes + "px";
	console.log(canContent.style.height);

	let canvas1 = document.getElementById("canvas1");
	let canvas2 = document.getElementById("canvas2");
	let img1Src = "mytemplate/imgFolder/up_page.png"; // 첫 번째 이미지 경로
	let img2Src = "mytemplate/imgFolder/down_page.png"; // 두 번째 이미지 경로

	// 초기 로드 시 캔버스 크기 조정
	resizeCanvas(canvas1, img1Src);
	resizeCanvas(canvas2, img2Src);
	addm1E();
	addm2E();

	// 창 크기 변경 시 캔버스 크기 조정
	window.onresize = function() {
		resizeCanvas(canvas1, img1Src);
		resizeCanvas(canvas2, img2Src);
		addm1E();
		addm2E();
	};

	// 마우스 이벤트 처리 함수
	function handleMouseMove(event, ctx, canvas) {
		let rect = canvas.getBoundingClientRect();
		let x = event.clientX - rect.left;
		let y = event.clientY - rect.top;
		let pixel = ctx.getImageData(x, y, 1, 1).data;
		// 픽셀의 알파 값이 0이 아니면(투명하지 않으면) 이벤트 처리
		if (pixel[3] !== 0) {
			console.log("Mouse event on non-transparent area");
			// 필요한 이벤트 처리 작성
		}
	}

	// 첫 번째 배경 이미지의 마우스 이벤트 리스너 추가
	function addm1E() {
		let background1 = document.getElementById("background1");
		let ctx1 = canvas1.getContext("2d");
		background1.addEventListener("mousemove", function(event) {
			handleMouseMove(event, ctx1, canvas1);
		});
	}
	// 두 번째 배경 이미지의 마우스 이벤트 리스너 추가
	function addm2E() {
		let background2 = document.getElementById("background2");
		let ctx2 = canvas2.getContext("2d");
		background2.addEventListener("mousemove", function(event) {
			handleMouseMove(event, ctx2, canvas2);
		});
	}
});









function showPopup(url) {
	document.getElementById('popup-url').value = url;
	document.getElementById('popup').style.display = 'block';
}

function hidePopup() {
	document.getElementById('popup').style.display = 'none';
}

function copyToClipboard() {
	var copyText = document.getElementById('popup-url');
	copyText.select();
	copyText.setSelectionRange(0, 99999); // For mobile devices
	document.execCommand("copy");
	alert("URL이 복사되었습니다: " + copyText.value);
}



// ////////// ////////// ////////// ////////// ////////// //////////
// 로고 버튼 클릭 이벤트
document.addEventListener('DOMContentLoaded', (event) => {
	const mainLogo = document.querySelectorAll(".mainLogo");
	const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");
	mainLogo.forEach((logo) => {
		logo.addEventListener('mouseover', (event) => {
			event.preventDefault();
			mouseCursor.classList.add("yj-main-s6-cursor-none");
			logo.style.cursor = "pointer";
		});
		logo.addEventListener('mouseleave', (event) => {
			event.preventDefault();
			mouseCursor.classList.remove("yj-main-s6-cursor-none");
			logo.style.cursor = "none";
		});
		logo.addEventListener('click', (event) => {
			event.preventDefault(); // 기본 동작을 막습니다 (페이지 새로고침 방지)
			window.scrollTo({
				top: 0,
				behavior: 'smooth' // 부드럽게 스크롤됩니다
			});
		});
	})
});

// ////////// ////////// ////////// ////////// ////////// //////////
// 메뉴 버튼 클릭 이벤트
const menus = document.querySelectorAll(".yj-main-menu");

menus.forEach((menu) => {
	const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");
	const navi = menu.parentElement.querySelector(".yj-main-nav");
	menu.addEventListener("click", function() {
		console.log(menu);
		console.log(navi);
		const menuBtn = menu.querySelector("img");
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
	menu.addEventListener('mouseover', (event) => {
		event.preventDefault();
		mouseCursor.classList.add("yj-main-s6-cursor-none");
		menu.style.cursor = "pointer";
	});
	menu.addEventListener('mouseleave', (event) => {
		event.preventDefault();
		mouseCursor.classList.remove("yj-main-s6-cursor-none");
		menu.style.cursor = "none";
	});
});
