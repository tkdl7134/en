$(document).ready(function() {
    let eventno = 1;
    let scrollTimeout;
    let isMouseOverCard;
    let jsoninfos;

    $.ajax({
        type: "post",
        url: "receivedMoneyController",
        data: { eno: eventno },
        async: false,
        dataType: "json",
        success: function(response) {
            console.log(response);
            jsoninfos = response;
            response.forEach((element, index) => {
                $(".kh-f-card-container").append(`
                    <div class="kh-f-card-out">
                        <div class="kh-fund-card" value="${element.m_name}">
                            <div style="height: 18rem">
                                <img style="height: 100%" alt="noImg" src="myPage/statistics/imgFolder/${element.g_relation}.png" />
                            </div>
                            <div>
                                <h3>${element.m_name}</h3>
                            </div>
                        </div>
                    </div>`);
            });

            $(".kh-f-card-container").append(`<div class="kh-f-card-fake"></div>`)
            initializeCardEvents();
        },
    });

    function initializeCardEvents() {
        let card = document.querySelectorAll(".kh-f-card-out");

        card.forEach((element, index) => {
            let cardIn = element.querySelector(".kh-fund-card");

            if (index % 2 == 0) {
                element.style.transform = "scale(0.9)";
                element.classList.add("kh-f-card-min");
                cardIn.style.backgroundColor = "#FFF1E0";
            } else {
                cardIn.style.backgroundColor = "#FFE0E0";
            }

            element.style.transition = "0.8s ease-in-out";
            element.addEventListener("mouseenter", () => {
                isMouseOverCard = true;
            });
            element.addEventListener("mouseleave", () => {
                isMouseOverCard = false;
            });

            element.addEventListener("mouseover", function(event) {
                card.forEach((otherCard) => {
                    if (otherCard !== element) {
                        if (otherCard.classList.contains("kh-f-card-min")) {
                            otherCard.style.transform = "scale(0.8)";
                        } else {
                            otherCard.style.transform = "scale(0.9)";
                        }
                        otherCard.style.filter = "grayscale(100%)";
                    }
                    document.querySelector(".kh-f-mousemove > img").src = "myPage/statistics/imgFolder/viewbtn.png";
                    mouseicn.classList.remove("kh-f-none");
                    mouseicn.classList.add("kh-f-block");
                });

                if (element.classList.contains("kh-f-card-min")) {
                    this.style.transform = "scale(1)";
                } else {
                    this.style.transform = "scale(1.1)";
                }
                event.stopPropagation();
            });

            element.addEventListener("mouseout", function(event) {
                card.forEach((otherCard) => {
                    if (otherCard !== element) {
                        if (otherCard.classList.contains("kh-f-card-min")) {
                            otherCard.style.transform = "scale(0.9)";
                        } else {
                            otherCard.style.transform = "scale(1)";
                        }
                        otherCard.style.filter = "none";
                    }
                });
                if (element.classList.contains("kh-f-card-min")) {
                    this.style.transform = "scale(0.9)";
                } else {
                    this.style.transform = "scale(1)";
                }
                event.stopPropagation();
            });

            element.addEventListener("click", function(event) {
                let cardParent = event.target.closest(".kh-fund-card");
                element.classList.add("kh-f-rotate");

                if (cardParent) {
                    let m_name = event.target.closest(".kh-fund-card").getAttribute("value");
                    let selectobj = jsoninfos.find(function(element) {
                        return element.m_name === m_name;
                    });

                    let percent = selectobj.percent || 0;
                    location.href = `receivedMoneyController&eno=${eventno}`;

                    document.querySelector("#kh-f-price").innerHTML = percent;
                    document.querySelector("#kh-f-product").innerHTML = selectobj.m_name;
                    document.querySelector(".kh-f-btn").setAttribute("value", selectobj.m_name);
                    document.querySelector("#kh-f-img").src = "myPage/statistics/imgFolder/" + selectobj.g_relation + ".png";
                    document.querySelector(".kh-f-mousemove > img").src = "myPage/statistics/imgFolder/backbtn.png";
                }

                scrollTimeout = setTimeout(() => {
                    element.classList.remove("kh-f-rotate");
                }, 1000);

                event.stopPropagation();
            });
        });

        const cardCon = document.querySelector(".kh-f-card-container");
        const mouseicn = document.querySelector(".kh-f-mousemove");

        cardCon.addEventListener("mouseover", function(event) {
            if (event.target === cardCon) {
                document.querySelector(".kh-f-mousemove > img").src = "myPage/statistics/imgFolder/dragbtn.png";
                mouseicn.classList.remove("kh-f-block");
                mouseicn.classList.add("kh-f-none");
                card.forEach((element) => {
                    element.style.transform = "scale(1)";
                    element.style.filter = "none";
                });
            }
            event.stopPropagation();
        });
    }
});
