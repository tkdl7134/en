let mouseicn;

document.addEventListener("DOMContentLoaded", function() {

	//모달
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
	const val = document.getElementById("SendModal").getAttribute("data-value");
	let radioCheck = document.querySelectorAll("input[name='jw-w-radio']");
	radioCheck.forEach((element) => {
		if (element.value == val) {
			element.checked = "true";
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
			async: true,
			data: formData,
			dataType: "json",
			success: function(response) {

			}
		});
		alert("submit complete!");
		closeSendModal();
	}
}