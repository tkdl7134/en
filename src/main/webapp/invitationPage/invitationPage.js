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
    const detailWrapper = document.querySelector(".hw_detail_wrapper");

    moreButton.addEventListener("click", () => {
        if (detailWrapper.style.display === "none" || detailWrapper.style.display === "") {
            detailWrapper.style.display = "block";
            moreButton.textContent = "접기";
        } else {
            detailWrapper.style.display = "none";
            moreButton.textContent = "더보기";
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

});
