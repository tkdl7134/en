function settingWish(){
	var formdata = {
		productName: $("#wl_name").val(),
		productPrice: $("#wl_price").val()
	};
	
	$.ajax({
		type: "POST",
		url: "FundingSettingC",
		data: JSON.stringify(formdata),		// json객체 출력준비
		contentType: "application/json", // 굳이 필요하지는 않음
		success : function(resData){
			console.log(resData);
		},
		error: function(xhr, status, error) {
				console.log('에러발생-');
				console.log('xhr : ' + xhr);
				console.log('status : ' + status);
				console.log('error : ' + error);
		}
	});
}