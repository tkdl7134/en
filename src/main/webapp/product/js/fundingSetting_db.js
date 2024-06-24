$(document).ready(function() {
	$('.fundignRegForm').submit(function(event) {
		event.preventDefault(); // 기본제출동작방지

		var formData = $(this).serialize(); // 폼 데이터 직렬화

		$.ajax({
			type: "POST",
			url: "FundingSettingC",
			data: formData,
			success: function(response) {
				console.log('등록 성공!');
				window.location.reload();
			},
			error: function(xhr, status, error) {
				console.error('등록 실패: ' + error);
			}
		});



	});

});

function deleteFunding(wl_no){
	console.log(wl_no);
	$.ajax({
		type: "GET",
		url: "FundingSettingUpDelC",
		data: {wl_no : wl_no},
		success: function(response) {
			console.log('삭제 성공!');
			window.location.reload();
		},
		error: function(xhr, status, error) {
			console.error('삭제 실패: ' + error);
		}

	});
}