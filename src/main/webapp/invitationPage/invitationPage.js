document.addEventListener("DOMContentLoaded", function() {
	const tabHeaders = document.querySelectorAll(".hw_tab_header");

	tabHeaders.forEach((header) => {
		const tabItems = header.querySelectorAll(".hw_tab__item");
		const tabContents = header.nextElementSibling.querySelectorAll(".hw_tab_content");

		tabItems.forEach((item, index) => {
			item.addEventListener("click", (e) => {
				e.preventDefault();
				tabItems.forEach((content) => {
					content.classList.remove("active");
				});
				tabContents.forEach((content) => {
					content.classList.remove("active");
				});
				tabItems[index].classList.add("active");
				tabContents[index].classList.add("active");
			});
		});
	});

	const topButton = document.querySelector(".top_button");
	topButton.addEventListener("click", (e) => {
		e.preventDefault();
		window.scrollTo({
			top: 0,
			behavior: "smooth"
		});
	});

	const moreButton = document.querySelector(".hw_more_button");
	const detailTableWrapper = document.querySelector(".hw_detail_wrapper");
	moreButton.addEventListener("click", () => {
		if (detailTableWrapper.style.display === "none" || detailTableWrapper.style.display === "") {
			detailTableWrapper.style.display = "block";
			moreButton.textContent = "クリック";
		} else {
			detailTableWrapper.style.display = "none";
			moreButton.textContent = "クリック";
		}
	});

	window.sortBy = function(type) {
		const form = document.querySelector("form");
		const input = document.createElement("input");
		input.type = "hidden";
		input.name = "sortType";
		input.value = type;
		form.appendChild(input);
		form.submit();
	};

	// 마우스 이동 기능 추가
	const mouseIcon = document.querySelector(".hw-f-mousemove img");
	const cardCon = document.querySelector(".hw_invitation_main");
	const body = document.querySelector('body');
	const canvas = document.getElementById('canvas1');
	const ctx = canvas.getContext('2d');
	const radius = 100; // 반원의 반지름
	const centerX = 170; // 반원의 중심 X 좌표
	const centerYTop = 150; // 상단 반원의 중심 Y 좌표
	const centerYBottom = 300; // 하단 반원의 중심 Y 좌표

	// 캔버스 크기 설정
	canvas.width = window.innerWidth;
	canvas.height = window.innerHeight;

	// 상단 반원 그리기
	const imgTop = new Image();
	imgTop.src = 'invitationPage/imgFolder/up_page.png';
	imgTop.onload = function() {
		ctx.drawImage(imgTop, centerX - radius, centerYTop - radius, radius * 2, radius * 2);
		ctx.beginPath();
		ctx.arc(centerX, centerYTop, radius, 0, Math.PI, false);
		ctx.closePath();
		ctx.clip();
	};

	// 하단 반원 그리기
	const imgBottom = new Image();
	imgBottom.src = 'invitationPage/imgFolder/down_page.png';
	imgBottom.onload = function() {
		ctx.drawImage(imgBottom, centerX - radius, centerYBottom - radius, radius * 2, radius * 2);
		ctx.beginPath();
		ctx.arc(centerX, centerYBottom, radius, Math.PI, 2 * Math.PI, false);
		ctx.closePath();
		ctx.clip();
	};

	document.addEventListener("mousemove", (event) => {
		const mouseX = event.clientX;
		const mouseY = event.clientY;
		mouseIcon.style.left = mouseX + "px";
		mouseIcon.style.top = mouseY + "px";

		checkMousePosition(event);
	});

	cardCon.addEventListener("mouseover", function(event) {
		mouseIcon.classList.remove("hw-f-block");
		mouseIcon.classList.add("hw-f-none");
	});

	cardCon.addEventListener("mouseout", function() {
		mouseIcon.classList.remove("hw-f-none");
		mouseIcon.classList.add("hw-f-block");
	});

	// 반원 영역에 있을 때만 마우스 아이콘 표시 및 반원 밖으로 나가면 커서 이미지 변경
	function isInsideArc(x, y, cx, cy, radius, startAngle, endAngle) {
		const dx = x - cx;
		const dy = y - cy;
		const distance = Math.sqrt(dx * dx + dy * dy);
		const angle = Math.atan2(dy, dx);

		// 각도를 0 ~ 2*PI 사이로 변환
		const adjustedAngle = (angle + 2 * Math.PI) % (2 * Math.PI);

		return (
			distance <= radius &&
			(adjustedAngle >= startAngle && adjustedAngle <= endAngle)
		);
	}

	function checkMousePosition(event) {
		const mouseX = event.clientX;
		const mouseY = event.clientY;

		const arcTop = isInsideArc(mouseX, mouseY, centerX, centerYTop, radius, 0, Math.PI);
		const arcBottom = isInsideArc(mouseX, mouseY, centerX, centerYBottom, radius, Math.PI, 2 * Math.PI);

		if (arcTop || arcBottom) {
			body.classList.remove("cursor-custom");
			mouseIcon.classList.remove("hw-f-none");
			mouseIcon.classList.add("hw-f-block");
		} else {
			body.classList.add("cursor-custom");
			mouseIcon.classList.remove("hw-f-block");
			mouseIcon.classList.add("hw-f-none");
		}
	}
});
