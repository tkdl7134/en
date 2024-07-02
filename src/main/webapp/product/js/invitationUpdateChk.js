	const groomKanjiL = document.querySelector("input[name='new_groomL']");
	const groomKanjiF = document.querySelector("input[name='new_groomF']");
	const groomKanaL = document.querySelector("input[name='new_groomKanaL']");
	const groomKanaF = document.querySelector("input[name='new_groomKanaF']");
	const groomRomaL = document.querySelector("input[name='new_groomRomaL']");
	const groomRomaF = document.querySelector("input[name='new_groomRomaF']");
	
	const brideKanjiL = document.querySelector("input[name='new_brideL']");
	const brideKanjiF = document.querySelector("input[name='new_brideF']");
	const brideKanaL = document.querySelector("input[name='new_brideKanaL']");
	const brideKanaF = document.querySelector("input[name='new_brideKanaF']");
	const brideRomaL = document.querySelector("input[name='new_brideRomaL']");
	const brideRomaF = document.querySelector("input[name='new_brideRomaF']");
	
	const weddingDay = document.querySelector("input[name='new_weddingDay']");
	const marriageTime = document.querySelector("input[name='new_marriageTime']");
	const marriageTime_a = document.querySelector("input[name='new_marriageTime_a']");
	const marriage_place = document.querySelector("input[name='new_marriage_place']");
	const marriage_addr = document.querySelector("input[name='new_marriage_addr']");
	const receptionTime = document.querySelector("input[name='new_receptionTime']");
	const receptionTime_a = document.querySelector("input[name='new_receptionTime_a']");
	const reception_place = document.querySelector("input[name='new_reception_place']");
	const reception_addr = document.querySelector("input[name='new_reception_addr']");

	const helloMessage = document.querySelector("textarea[name='new_helloMessage']");
	const byeMessage = document.querySelector("textarea[name='new_byeMessage']");
	
	const oldphoto1 = document.querySelector("input[name='oldPhoto1']");
	const oldphoto2 = document.querySelector("input[name='oldPhoto2']");
	const oldphoto3 = document.querySelector("input[name='oldPhoto3']");
	const oldphoto4 = document.querySelector("input[name='oldPhoto4']");
	const photo1 = document.querySelector("input[name='new_photo1']");
	const photo2 = document.querySelector("input[name='new_photo2']");
	const photo3 = document.querySelector("input[name='new_photo3']");
	const photo4 = document.querySelector("input[name='new_photo4']");
function call(){
 // 이름정보 
 	// 신랑
 	if(isEmpty(groomKanjiL)|| isEmpty(groomKanjiF)){
		alert("必須で入力してください。");
	 if (isEmpty(groomKanjiL)) {
	        groomKanjiL.focus();
	    } else {
	        groomKanjiF.focus();
	    }
	    return false;
}

	 if(isEmpty(groomKanaL)|| isEmpty(groomKanaF)){
		alert("必須で入力してください。");
	 if (isEmpty(groomKanaL)) {
	        groomKanaL.focus();
	    } else {
	        groomKanaF.focus();
	    }
	    return false;
	}	

	 if(isEmpty(groomRomaL)|| isEmpty(groomRomaF)){
		alert("必須で入力してください。");
		 if (isEmpty(groomRomaL)) {
		        groomRomaL.focus();
		    } else {
		        groomRomaF.focus();
		    }
		    return false;
	}	
	
	// 신부
	 if(isEmpty(brideKanjiL)|| isEmpty(brideKanjiF)){
		alert("必須で入力してください。");
		 if (isEmpty(brideKanjiL)) {
		        brideKanjiL.focus();
		 } else {
		        brideKanjiF.focus();
		 }
		 return false;
}

	if(isEmpty(brideKanaL)|| isEmpty(brideKanaF)){
		alert("必須で入力してください。");
		 if (isEmpty(brideKanaL)) {
		        brideKanaL.focus();
		 } else {
		        brideKanaF.focus();
		 }
		 return false;
}

	if(isEmpty(brideRomaL)|| isEmpty(brideRomaF)){
		alert("必須で入力してください。");
		 if (isEmpty(brideRomaL)) {
		        brideRomaL.focus();
		 } else {
		        brideRomaF.focus();
		 }
		 return false;
}

	// 식 날짜 및 시간
	if(isEmpty(weddingDay)){
		alert("必須で入力してください。");
		weddingDay.focus();
		return false;
	}
	
	if(isEmpty(marriageTime)|| isEmpty(marriageTime_a)){
		alert("必須で入力してください。");
			 if (isEmpty(marriageTime)) {
			        marriageTime.focus();
			 } else {
			        marriageTime_a.focus();
			 }
			 return false;
	}

	if(isEmpty(marriage_place)|| isEmpty(marriage_addr)){
		alert("必須で入力してください。");
			 if (isEmpty(marriage_place)) {
			        marriage_place.focus();
			 } else {
			        marriage_addr.focus();
			 }
			 return false;
	}

	if(isEmpty(receptionTime)|| isEmpty(receptionTime_a)){
		alert("必須で入力してください。");
			 if (isEmpty(receptionTime)) {
			        receptionTime.focus();
			 } else {
			        receptionTime_a.focus();
			 }
			 return false;
	}
	if(isEmpty(reception_place)|| isEmpty(reception_addr)){
		alert("必須で入力してください。");
			 if (isEmpty(reception_place)) {
			        reception_place.focus();
			 } else {
			        reception_addr.focus();
			 }
			 return false;
	}
	
// 메세지
	if(isEmpty(helloMessage)|| isEmpty(byeMessage)){
		alert("必須で入力してください。");
			 if (isEmpty(helloMessage)) {
			        helloMessage.focus();
			 } else {
			        byeMessage.focus();
			 }
			 return false;
	}
	
	
	

}

function groomKanaChk(){
	if (onlyKana(groomKanaL) || onlyKana(groomKanaF)) {
    	alert("カタカナで入力してください");
    
	    if (onlyKana(groomKanaL)) {
	        groomKanaL.focus();
	    } else {
	        groomKanaF.focus();
	    }
	    return false;
	}
}
function groomEngChk(){
	if (onlyEng(groomRomaL) || onlyEng(groomRomaF)) {
    	alert("英語で入力してください");
    
	    if (onlyEng(groomRomaL)) {
	        groomRomaL.focus();
	    } else {
	        groomRomaF.focus();
	    }
	    return false;
	}
}

function brideKanaChk(){
	if (onlyKana(brideKanaL) || onlyKana(brideKanaF)) {
    	alert("カタカナで入力してください");
    
	    if (onlyKana(brideKanaL)) {
	        brideKanaL.focus();
	    } else {
	        brideKanaF.focus();
	    }
	    return false;
}
	
}

function brideEngChk(){
	if (onlyEng(brideRomaL) || onlyEng(brideRomaF)) {
	    	alert("英語で入力してください");
	    
		    if (onlyEng(brideRomaL)) {
		        brideRomaL.focus();
		    } else {
		        brideRomaF.focus();
		    }
		    return false;
	}
	
}

function lengthChk_hello(){
	if(lessThen(helloMessage, 240)){
		alert("240");
		helloMessage.focus();
		return false;
	}
}

function lengthChk_bye(){
	if(lessThen(byeMessage, 240)){
		alert("240");
		helloMessage.focus();
		return false;
	}
}
function photoType1(){
	if (isNotType(photo1, "jpg") && isNotType(photo1, "png") && isNotType(photo1, "jpeg")) {
	    alert("「jpg・png・jpeg」 のような形式のファイルを添付してください。 ");
	    photo1.value = "";
	    return false;
  }
	
}
function photoType2(){
	if (isNotType(photo2, "jpg") && isNotType(photo2, "png") && isNotType(photo2, "jpeg")) {
	    alert("「jpg・png・jpeg」 のような形式のファイルを添付してください。 ");
	    photo2.value = "";
	    return false;
  }
}
function photoType3(){
	if (isNotType(photo3, "jpg") && isNotType(photo3, "png") && isNotType(photo3, "jpeg")) {
	    alert("「jpg・png・jpeg」 のような形式のファイルを添付してください。 ");
	    photo3.value = "";
	    return false;
  }
}
function photoType4(){
	if (isNotType(photo4, "jpg") && isNotType(photo4, "png") && isNotType(photo4, "jpeg")) {
	    alert("「jpg・png・jpeg」 のような形式のファイルを添付してください。 ");
	    photo4.value = "";
	    return false;
  }
}
