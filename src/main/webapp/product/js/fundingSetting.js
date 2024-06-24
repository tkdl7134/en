var cloneCount = 1;

function copyDiv(button) {
  // 복사할 대상 요소를 선택
  let originalBox = button.parentNode.parentNode.parentNode;

  // 복사된 요소 생성
  let clonedBox = originalBox.cloneNode(true);
  cloneCount++;

  // 복제 횟수를 증가시킵니다.
  cloneCount++;

  // 새로운 내용으로 변경
  // 이미지 추가
  var imgDiv = document.createElement("div");
  imgDiv.className = "je_detail-img je_detail-img-more";
  var img = document.createElement("img");
  img.src = "product/imgFolder/funding-more.png";
  img.alt = `Image ${cloneCount}`;
  imgDiv.appendChild(img);
  clonedBox.querySelector(".je_copyBox-default").appendChild(imgDiv);

  // 입력 필드 추가
  var inputDiv1 = document.createElement("div");
  inputDiv1.className = "je_detail-inputName";
  let input1 = document.createElement("input");
  input1.type = "text";
  input1.placeholder = "アイテム";
  input1.name = "item";
  inputDiv1.appendChild(input1);
  clonedBox.querySelector(".je_copyBox-default").appendChild(inputDiv1);

  var inputDiv2 = document.createElement("div");
  inputDiv2.className = "je_detail-input";
  let input2 = document.createElement("input");
  input2.type = "text";
  input2.placeholder = "円";
  input2.name = "item_price";
  inputDiv2.appendChild(input2);
  clonedBox.querySelector(".je_copyBox-default").appendChild(inputDiv2);

  // 버튼 추가
  var btnDiv = document.createElement("div");
  btnDiv.className = "je_detail-button";
  let btn = document.createElement("button");
  btn.textContent = "登録";
  btn.href = "http://www.naver.com";
  btnDiv.appendChild(btn);
  clonedBox.querySelector(".je_copyBox-default").appendChild(btnDiv);

  // 기존 버튼 삭제
  let buttonElement = clonedBox.querySelector(".je_copyDefault-button");
  if (buttonElement) {
    buttonElement.parentNode.removeChild(buttonElement);
  }
  let txtElement = clonedBox.querySelector("#je_copyDefault-txt");
  if (txtElement) {
    txtElement.parentNode.removeChild(txtElement);
  }

  originalBox.parentNode.insertBefore(clonedBox, originalBox);
}

/*function scrollUp(){
	window.scrollTo(0,0);
}*/
$(function(){
	$('#topBtn').click(function(){
		$('html, body').animate({scrollTop: 0}, 400);

	});
});

