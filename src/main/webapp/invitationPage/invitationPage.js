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
   document.addEventListener("DOMContentLoaded", function () {
        const canContainer = document.getElementById(
          "canvas-content-container"
        );
        const canContent = document.querySelector(".canvas-content");
        console.log(canContainer);
        console.log(canContent);

        let canConH = window.getComputedStyle(canContent).height;
        console.log(canConH);
        if (canConH > 1300) {
          // 문자열에서 'px'를 제거하고 숫자로 변환
          let canConHNum = parseFloat(canConH);
          console.log(canConHNum);

          // 계산 수행
          let calcRes = canConHNum + 800;
          console.log(calcRes);

          // 결과 적용
          canContent.style.height = calcRes + "px";
          console.log(canContent.style.height);
        }
        // 첫 번째 배경 이미지와 관련된 요소들
        let background1 = document.getElementById("background1");
        let canvas1 = document.getElementById("canvas1");
        let ctx1 = canvas1.getContext("2d");
        let img1 = new Image();
        img1.src = "/src/topnohalf.png"; // 첫 번째 배경 이미지 경로 설정

        // 두 번째 배경 이미지와 관련된 요소들
        let background2 = document.getElementById("background2");
        let canvas2 = document.getElementById("canvas2");
        let ctx2 = canvas2.getContext("2d");
        let img2 = new Image();
        img2.src = "/src/bottom.png"; // 두 번째 배경 이미지 경로 설정

        // 캔버스 초기화 함수
        function initCanvas(canvas, ctx, imageSrc) {
          let img = new Image();
          img.src = imageSrc;
          img.onload = function () {
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
        background1.addEventListener("mousemove", function (event) {
          handleMouseMove(event, ctx1, canvas1);
        });

        // 두 번째 배경 이미지의 마우스 이벤트 리스너 추가
        background2.addEventListener("mousemove", function (event) {
          handleMouseMove(event, ctx2, canvas2);
        });
      });
