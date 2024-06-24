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
        img.onload = function () {
            ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
        };

        // 콘솔 로그
        console.log(`Window resized: width=${canvasWidth}, height=${canvasHeight}`);
    }

    const canContainer = document.getElementById("canvas-content-container");
    const canContent = document.querySelector(".canvas-content");
    console.log(canContainer);
    console.log(canContent);

    let canConH = window.getComputedStyle(canContent).height;
    console.log(canConH);
    // 문자열에서 'px'를 제거하고 숫자로 변환
    let canConHNum = parseFloat(canConH);
    console.log(canConHNum);

    // 계산 수행
    let calcRes = canConHNum + 1500;
    console.log(calcRes);

    // 결과 적용
    canContent.style.height = calcRes + "px";
    console.log(canContent.style.height);

    let canvas1 = document.getElementById("canvas1");
    let canvas2 = document.getElementById("canvas2");
    let img1Src = "invitationPage/imgFolder/up_page.png"; // 첫 번째 이미지 경로
    let img2Src = "invitationPage/imgFolder/down_page.png"; // 두 번째 이미지 경로

    // 초기 로드 시 캔버스 크기 조정
    resizeCanvas(canvas1, img1Src);
    resizeCanvas(canvas2, img2Src);

    // 커서 변경 함수
    function changeCursorToCustom() {
        document.body.classList.add("cursor-custom");
    }

    function revertCursor() {
        document.body.classList.remove("cursor-custom");
    }

    // 캔버스에 이벤트 리스너 추가
    function addMouseListeners(canvas) {
        canvas.addEventListener("mouseenter", changeCursorToCustom);
        canvas.addEventListener("mouseleave", revertCursor);
    }

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
        background1.addEventListener("mousemove", function (event) {
            handleMouseMove(event, ctx1, canvas1);
        });
    }
    // 두 번째 배경 이미지의 마우스 이벤트 리스너 추가
    function addm2E() {
        let background2 = document.getElementById("background2");
        let ctx2 = canvas2.getContext("2d");
        background2.addEventListener("mousemove", function (event) {
            handleMouseMove(event, ctx2, canvas2);
        });
    }

    // 초기 로드 시 캔버스 크기 조정 및 이벤트 리스너 추가
    resizeCanvas(canvas1, img1Src);
    resizeCanvas(canvas2, img2Src);
    addm1E();
    addm2E();
    addMouseListeners(canvas1);
    addMouseListeners(canvas2);

    // 창 크기 변경 시 캔버스 크기 조정 및 이벤트 리스너 다시 추가
    window.onresize = function () {
        resizeCanvas(canvas1, img1Src);
        resizeCanvas(canvas2, img2Src);
        addm1E();
        addm2E();
        addMouseListeners(canvas1);
        addMouseListeners(canvas2);
    };
});
