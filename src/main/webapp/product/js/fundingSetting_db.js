window.onload = function(){
	const imgMapping = {
	  'ソファー': 'product/imgFolder/funding-sofa.png',
      '冷蔵庫': 'product/imgFolder/funding-refrigerator.png',
      '洗濯機': 'product/imgFolder/funding-washing.png',
      'テレビジョン': 'product/imgFolder/funding-televison.png',
      '机': 'product/imgFolder/funding-desk.png',
      'ベット': 'product/imgFolder/funding-bed.png',
      'テーブル': 'product/imgFolder/funding-table.png'
	};
	
	const images = document.querySelectorAll('.je_fundingSetImg');
	images.forEach(img => {
	const productName = img.getAttribute('data-product-name');
	if(imgMapping[productName]){
		img.src = imgMapping[productName];
	}else {
		img.src = 'product/imgFolder/funding-more.png';
	}		
	});
};




$(document).ready(function() {
	$('.fundingRegForm').submit(function(event) {
		event.preventDefault(); // 기본제출동작방지
		
		var isValid = true;
		$(this).find('input[type="text"], input[type="number"]').each(function() {
        if (isEmpty(this)) {
            isValid = false;
            alert('商品名または価格を入力してください。');
        } 
    });
		if(isValid){
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

		}

	});
	
	
	$('.fundingUpdateForm').submit(function(event) {
		event.preventDefault(); // 기본제출동작방지

		var isValid = true;
		$(this).find('input[type="text"], input[type="number"]').each(function() {
        if (isEmpty(this)) {
            isValid = false;
            alert('価格を入力してください。');
        } 
    });
    if(isValid){
		var formData = $(this).serialize(); // 폼 데이터 직렬화

		$.ajax({
			type: "POST",
			url: "FundingSettingUpDelC",
			data: formData,
			success: function(response) {
				console.log('등록 성공!');
				window.location.reload();
			},
			error: function(xhr, status, error) {
				console.error('등록 실패: ' + error);
			}
		});

	}

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
