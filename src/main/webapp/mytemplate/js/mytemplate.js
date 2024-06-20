document.addEventListener('DOMContentLoaded', function() {
	const currentPage = document.getElementById('currentPage').value;  // currentPage 값을 가져오기 위한 수정
	const bodyElement = document.getElementById('page_top');
	if (currentPage > 1) {
		bodyElement.classList.remove('background-image');
	} else {
		bodyElement.classList.add('background-image');
	}
	const canContainer = document.getElementById(
		"canvas-content-container"
	);
	const canContent = document.querySelector(".canvas-content");
	console.log(canContainer);
	console.log(canContent);

	let canConH = window.getComputedStyle(canContent).height;
	console.log(canConH);
		// 문자열에서 'px'를 제거하고 숫자로 변환
		let canConHNum = parseFloat(canConH);
		console.log(canConHNum);

		// 계산 수행
		let calcRes = canConHNum - 1200;
		console.log(calcRes);

		// 결과 적용
		canContainer.style.height = calcRes + "px";
		console.log(canContainer.style.height);
	if (canConH > 1300) {
	}
	// 첫 번째 배경 이미지와 관련된 요소들
	let background1 = document.getElementById("background1");
	let canvas1 = document.getElementById("canvas1");
	let ctx1 = canvas1.getContext("2d");
	let img1 = new Image();
	img1.src = "mytemplate/imgFolder/up_page.png"; // 첫 번째 배경 이미지 경로 설정

	// 두 번째 배경 이미지와 관련된 요소들
	let background2 = document.getElementById("background2");
	let canvas2 = document.getElementById("canvas2");
	let ctx2 = canvas2.getContext("2d");
	let img2 = new Image();
	img2.src = "mytemplate/imgFolder/down_page.png"; // 두 번째 배경 이미지 경로 설정

	// 캔버스 초기화 함수
	function initCanvas(canvas, ctx, imageSrc) {
		let img = new Image();
		img.src = imageSrc;
		img.onload = function() {
			canvas.width = img.width;
			canvas.height = img.height;
			ctx.drawImage(img, 0, 0);
		};
	}

	// 첫 번째 배경 이미지 캔버스 초기화
	initCanvas(canvas1, ctx1, img1.src);

	// 두 번째 배경 이미지 캔버스 초기화
	initCanvas(canvas2, ctx2, img2.src);

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
	background1.addEventListener("mousemove", function(event) {
		handleMouseMove(event, ctx1, canvas1);
	});

	// 두 번째 배경 이미지의 마우스 이벤트 리스너 추가
	background2.addEventListener("mousemove", function(event) {
		handleMouseMove(event, ctx2, canvas2);
	});



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
