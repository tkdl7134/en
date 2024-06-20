document.addEventListener("DOMContentLoaded", function() {
	// 첫 번째 배경 이미지와 관련된 요소들
	let background1 = document.getElementById("background1");
	let canvas1 = document.getElementById("canvas1");
	let ctx1 = canvas1.getContext("2d");
	let img1 = new Image();
	img1.src = "product/imgFolder/selectwishibg.png"; // 첫 번째 배경 이미지 경로 설정

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
});