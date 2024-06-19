function showPopup(url) {
    document.getElementById('popup-url').value = url;
    document.getElementById('popup').style.display = 'block';
}

function hidePopup() {
    document.getElementById('popup').style.display = 'none';
}

function copyToClipboard() {
    var copyText = document.getElementById('popup-url');
    copyText.select();
    copyText.setSelectionRange(0, 99999); // For mobile devices
    document.execCommand("copy");
    alert("URL이 복사되었습니다: " + copyText.value);
}
