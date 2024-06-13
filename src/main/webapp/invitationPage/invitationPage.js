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
    const mouseIcon = document.querySelector(".hw-f-mousemove");
    const cardCon = document.querySelector(".hw_invitation_main");

    cardCon.addEventListener("mouseover", function(event) {
        mouseIcon.classList.remove("hw-f-block");
        mouseIcon.classList.add("hw-f-none");
    });

    document.addEventListener("mousemove", (event) => {
        const mouseX = event.clientX;
        const mouseY = event.clientY;
        mouseIcon.style.pointerEvents = "none";
        mouseIcon.style.left = mouseX + "px";
        mouseIcon.style.top = mouseY + "px";
    });

    cardCon.addEventListener("mouseout", function() {
		
        if (event.target === cardCon) {
            document.querySelector(".hw-f-mousemove > img").src = "invitationPage/imgFolder/back_btn.png";
             
        }
        mouseIcon.classList.remove("hw-f-none");
        mouseIcon.classList.add("hw-f-block");
        event.stopPropagation();
        
    });
});
