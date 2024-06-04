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
						<button onclick="locations.href='MoveMainC'">商品 ページ</button>
						<button>ログイン</button>
					</div>
				</div>
			</div>
		</div>
		
</body>
<script type="text/javascript">
setTimeout(function(){location.href="MoveMainC";},10000); //2초후 이동
</script>
</html>