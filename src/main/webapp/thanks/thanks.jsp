<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="thanks/thanks.css"/>
</head>
<body>
	
		<div class="tk_container">
			<div class="tk_letter">
				<div class="tk_letterContents">
					<div class="tk_letterWords">
						<div>ありがとうございます。</div>
						<div>商品に関して</div>
					</div>
					<div class="tk_thanks_button">
						<div>
 						 	<h3>ログイン</h3>
 						 	<img class="button_login" src="thanks/imgFolder/sakura.png" alt="상품 페이지">
						</div>
						<div>
  						 	<h3>テンプレート<br>ペイジー</h3>
  						 	<img class="button_templet" src="thanks/imgFolder/sakura.png" alt="로그인">
						</div>
					</div>
				</div>
			</div>
		</div>
		
</body>
<script type="text/javascript">
setTimeout(function(){location.href="MoveMainC";},10000); //4초

const buttonlogin = document.querySelector('.button_login'); // 버튼 클래스 로그인 div 선택
const buttontemplet = document.querySelector('.button_templet'); // 버튼 클래스 템플릿 div 선택

buttonlogin.addEventListener('click', () => {
  location.href = 'MoveMainC'; // 첫 번째 div 클릭 시 이동할 URL
});

buttontemplet.addEventListener('click', () => {
  location.href = 'MoveTempletC'; // 두 번째 div 클릭 시 이동할 URL
});
</script>
</html>