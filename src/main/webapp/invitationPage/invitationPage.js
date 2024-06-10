
// invitationPage.js에 추가
document.addEventListener("DOMContentLoaded", function() {
    var modal = document.getElementById("invitationModal");
    var span = document.getElementsByClassName("close")[0];

    function openModal() {
        modal.style.display = "block";
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    var invitationElements = document.getElementsByClassName("hw_invitation_content");
    for (var i = 0; i < invitationElements.length; i++) {
        invitationElements[i].onclick = openModal;
    }
});
