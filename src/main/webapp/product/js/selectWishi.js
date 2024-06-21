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
	const amazonmodal = document.getElementById("AmazonModal");
	const jpop = document.getElementById("amazonpop");
	amazonmodal.addEventListener("click", function(event) {
		if (!jpop.contains(event.target)) {
			closeAmazonModal();
		}
	});
	const sendmodal = document.getElementById("SendModal");
	const jpop2 = document.getElementById("sendpop");
	sendmodal.addEventListener("click", function(event) {
		if (!jpop2.contains(event.target)) {
			closeSendModal();
		}
	});

//------
const val = document.getElementById("SendModal").getAttribute("data-value");
let radioCheck = document.querySelectorAll("input[name='jw-w-radio']");
radioCheck.forEach((element)=>{
	if(element.value==val){
		element.checked="true";
	}
});

});

function openAmazonModal() {
	const modal = document.getElementById("AmazonModal");
	modal.showModal();
}

function closeAmazonModal() {
	const modal = document.getElementById("AmazonModal");
	modal.close();
}
function openSendModal() {
	const modal = document.getElementById("SendModal");
	modal.showModal();
}

function closeSendModal() {
	const modal = document.getElementById("SendModal");
	modal.close();
}

function amazonSubmit(eno) {
	const alink = document.querySelector(".jw-w-popup-input").value;
	$.ajax({
		type: "post",
		url: "SelectWishiC",
		data: { "alink": alink, "eno": eno },
		dataType: "json",
		success: function(response) {

		}
	});
	alert("submit complete!");

	closeAmazonModal();
}
function sendSubmit() {
	const radios = document.querySelectorAll("input[name='jw-w-radio']");
	let isChecked = false;
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			isChecked = true;
			break;
		}
	}
	if (!isChecked) {
		const container = document.getElementById("sendpop");
		const warnspan = document.querySelector("#kh-warn-text");
		container.classList.add("vibration");
		setTimeout(function() {
			container.classList.remove("vibration");
		}, 300);
		if (warnspan.classList.contains("jw-none")) {
			warnspan.classList.remove("jw-none");
			warnspan.classList.add("jw-show");
		}
	}
	else {
		const formData = $("#sendModalForm").serialize();
		$.ajax({
			type: "post",
			url: "SelectWishiC",
			async:true,
			data: formData,
			dataType: "json",
			success: function(response) {

			}
		});
		alert("submit complete!");
		closeSendModal();
	}
}