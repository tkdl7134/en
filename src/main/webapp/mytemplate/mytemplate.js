  document.addEventListener('DOMContentLoaded', function() {
            const currentPage = document.getElementById('currentPage').value;
            const bodyElement = document.getElementById('page_top');
            // 추가적인 기능이 필요하다면 이곳에 작성
        });

        function showPopup(e_no) {
            const baseUrl = "http://localhost:8080/En/";
            const url = `${baseUrl}ReceptionC?eno=${e_no}`;
            document.getElementById('popup-url').value = url;
            document.getElementById('popup').style.display = 'block';
        }

        function hidePopup() {
            document.getElementById('popup').style.display = 'none';
        }

        function copyToClipboard() {
            const copyText = document.getElementById('popup-url');
            copyText.select();
            copyText.setSelectionRange(0, 99999); // 모바일 장치용
            document.execCommand("copy");
            alert("URL이 복사되었습니다: " + copyText.value);
        }

        function sendENo(e_no) {
            const baseUrl = "http://localhost:8080/En/";
            const url = `ReceivedMainC?eno=${e_no}`;
            console.log("Navigating to: " + url); // 디버깅 로그
            window.location.href = url;
        }

        function sendToInvitation(e_no) {
            const baseUrl = "http://localhost:8080/En/";
            const url = `${baseUrl}InvitationController?eno=${e_no}`;
            console.log("Navigating to: " + url); // 디버깅 로그
            window.location.href = url;
        }

        function submitToInvitationC(e_no) {
            const form = document.createElement('form');
            form.method = 'get';
            form.action = 'testC';

            const input = document.createElement('input');
            input.type = 'number';
            input.name = 'e_no';
            input.value = e_no;
            input.style.display="none";
            form.appendChild(input);

            document.body.appendChild(form);
            form.submit();
        }

        function navigateToMemberUpdate() {
            const baseUrl = "http://localhost:8080/En/";
            const m_id = sessionStorage.getItem('m_id'); // 세션 스토리지에서 m_id 값 가져오기
            if (m_id) {
                const url = `${baseUrl}MemberUpdateC?m_id=${m_id}`;
                console.log("Navigating to: " + url); // 디버깅 로그
                window.location.href = url;
            } else {
                console.error("m_id not found in sessionStorage");
            }
        }

        function navigateToMyMeeting() {
            const baseUrl = "http://localhost:8080/En/";
            const m_id = sessionStorage.getItem('m_id'); // 세션 스토리지에서 m_id 값 가져오기
            if (m_id) {
                const url = `${baseUrl}MyMeetingC?m_id=${m_id}`;
                console.log("Navigating to: " + url); // 디버깅 로그
                window.location.href = url;
            } else {
                console.error("m_id not found in sessionStorage");
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const mainLogo = document.querySelector(".mainLogo");
            const mouseCursor = document.querySelector(".yj-main-s6-cursor > img");

            mainLogo.addEventListener('click', function(event) {
                event.preventDefault();
                mainLogo.style.cursor = "pointer";
                location.href = 'MainC';
            });

            const menus = document.querySelector(".yj-main-menu");
            const navi = document.querySelector(".yj-main-nav");

            menus.addEventListener("click", function() {
                const menuBtn = menus.querySelector("img");
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
        });