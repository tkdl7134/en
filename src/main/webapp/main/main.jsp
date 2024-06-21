<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MAIN</title>
<link rel="stylesheet" href="main/main.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200;400;700;900&display=swap"
	rel="stylesheet" />
<script defer src="main/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>

<body>
	<!-- Section 1 -->
	<div class="yj-main-section" id="yj-main-s1">
		<div class="yj-main-s1-musubi">
			<!-- 띠 이미지 추후 변경되어야 함 -->
			<img src="main/imgFolder/yj-main-s1-musubi.png" alt="섹션1 musubi" />
		</div>
		<div class="yj-main-s1-logo">
			<img src="main/imgFolder/yj-main-default-logo.png" alt="섹션1 logo" />
		</div>
		<div class="yj-main-s1-scroll" alt="섹션1 scroll">
			<div class="s1-scroll-line"></div>
			<div class="s1-scroll-arrow"></div>
		</div>
	</div>

	<!-- Section 2 -->
	<div class="yj-main-section" id="yj-main-s2">
		<div class="yj-main-s2-logo">
			<img src="main/imgFolder/yj-main-default-logo.png" alt="섹션2 logo" />
		</div>

		<!-- <div class="yj-main-s2-menu" id="yj-main-s2-menuBtn">
        <img src="main/imgFolder/yj-main-default-menu1.png" alt="섹션2 menu1" />
        <div class=""></div>
      </div> -->

		<div class="yj-main-menubox">
			<div class="yj-main-menu">
				<img alt="" src="main/imgFolder/yj-main-menu1.png">
			</div>
			<div class="yj-main-nav nav-hidden">
				<div class="fakeDiv"></div>
				<div>
					<a href="MemberC"><h2>로그인</h2></a>
				</div>
				<div>
					<h2>회원가입</h2>
				</div>
				<div>
					<h2>템플릿</h2>
				</div>
				<div class="topBtn">
					<img src="main/imgFolder/top button.png" alt="topBtn">
				</div>
			</div>
		</div>


		<div class="yj-main-s2-cover">
			<img src="main/imgFolder/yj-main-s2-cover.png" alt="섹션2 커버" />
		</div>

		<div class="yj-main-s2-cursor yj-main-s2-cursor-none">
			<img alt="" src="main/imgFolder/yj-main-s2-drag.png" />
		</div>

		<div class="yj-main-s2-list">
			<div class="yj-main-s2-img">
				<img src="main/imgFolder/yj-main-s2-img1.png" alt="섹션2 슬라이드img1" />
			</div>

			<div class="yj-main-s2-img">
				<img src="main/imgFolder/yj-main-s2-img2.png" alt="섹션2 슬라이드img2" />
			</div>

			<div class="yj-main-s2-img">
				<img src="main/imgFolder/yj-main-s2-img3.png" alt="섹션2 슬라이드img3" />
			</div>

			<div class="yj-main-s2-img">
				<img src="main/imgFolder/yj-main-s2-img4.png" alt="섹션2 슬라이드img4" />
			</div>

			<div class="yj-main-s2-img">
				ii <img src="main/imgFolder/yj-main-s2-img5.png" alt="섹션2 슬라이드img5" />
			</div>

			<div class="yj-main-s2-img">
				<img src="main/imgFolder/yj-main-s2-img6.png" alt="섹션2 슬라이드img6" />
			</div>
			<div class="yj-main-s2-img">
				<img src="main/imgFolder/yj-main-s2-img7.png" alt="섹션2 슬라이드img7" />
			</div>
		</div>
	</div>


	<!-- Section 3 -->
	<div class="yj-main-section" id="yj-main-s3">
		<div class="yj-main-s3-logo">
			<img src="main/imgFolder/yj-main-default-logo.png" alt="섹션3 logo" />
		</div>
		<div class="yj-main-menubox">
			<div class="yj-main-menu" id="yj-main-s3-menuBtn">
				<img src="main/imgFolder/yj-main-default-menu1.png" alt="섹션3 menu1" />
			</div>
		</div>


		<div class="vertical-text" id="verticalText1"
			data-text="縁は不思議な力で結ばれるものであり、 永遠に続く絆です。"></div>

		<div class="yj-main-s3-img">
			<img id="currentSlideImage" src="main/imgFolder/yj-main-s2-img1.png"
				alt="Current Slide" />
		</div>

		<div class="yj-main-s3-scroll" alt="섹션3 scroll">
			<div class="s3-scroll-line"></div>
			<div class="s3-scroll-arrow"></div>
		</div>
	</div>

	<!-- Section 4 -->
	<div class="yj-main-section" id="yj-main-s4">
		<div class="yj-main-s4-logo">
			<img src="main/imgFolder/yj-main-default-logo.png" alt="섹션4 logo" />
		</div>
		<div class="yj-main-menubox">
			<div class="yj-main-menu" id="yj-main-s4-menuBtn">
				<img src="main/imgFolder/yj-main-default-menu1.png" alt="섹션4 menu1" />
			</div>
		</div>

		<div class="yj-main-s4-cover">
			<img src="main/imgFolder/yj-main-s4-cover.png" alt="섹션4 커버" />
		</div>

		<div class="yj-main-s4-flexContainer">
			<div class="yj-main-s4-cursor yj-main-s4-cursor-none">
				<img alt="" src="main/imgFolder/yj-main-s4-click.png" />
			</div>
			<div class="yj-main-s4-container" id="item10to4">
				<img src="main/imgFolder/yj-main-s4-img10.png"
					class="clickable-image" alt="섹션4 리스트img10" /> <img
					src="main/imgFolder/yj-main-s4-img1.png" class="clickable-image"
					alt="섹션4 리스트img1" /> <img src="main/imgFolder/yj-main-s4-img2.png"
					class="clickable-image" alt="섹션4 리스트img2" /> <img
					src="main/imgFolder/yj-main-s4-img3.png" class="clickable-image"
					alt="섹션4 리스트img3" /> <img src="main/imgFolder/yj-main-s4-img4.png"
					class="clickable-image" alt="섹션4 리스트img4" />
			</div>

			<div class="yj-main-s4-container" id="item8to1">
				<img src="main/imgFolder/yj-main-s4-img8.png"
					class="clickable-image" alt="섹션4 리스트img8" /> <img
					src="main/imgFolder/yj-main-s4-img9.png" class="clickable-image"
					alt="섹션4 리스트img9" /> <img
					src="main/imgFolder/yj-main-s4-img10.png" class="clickable-image"
					alt="섹션4 리스트img10" /> <img
					src="main/imgFolder/yj-main-s4-img1.png" class="clickable-image"
					alt="섹션4 리스트img1" />
			</div>

			<div class="yj-main-s4-container" id="item5to9">
				<img src="main/imgFolder/yj-main-s4-img5.png"
					class="clickable-image" alt="섹션4 리스트img5" /> <img
					src="main/imgFolder/yj-main-s4-img6.png" class="clickable-image"
					alt="섹션4 리스트img6" /> <img src="main/imgFolder/yj-main-s4-img7.png"
					class="clickable-image" alt="섹션4 리스트img7" /> <img
					src="main/imgFolder/yj-main-s4-img8.png" class="clickable-image"
					alt="섹션4 리스트img8" /> <img src="main/imgFolder/yj-main-s4-img9.png"
					class="clickable-image" alt="섹션4 리스트img9" />
			</div>

			<div class="yj-main-s4-container" id="item3to6">
				<img src="main/imgFolder/yj-main-s4-img3.png"
					class="clickable-image" alt="섹션4 리스트img3" /> <img
					src="main/imgFolder/yj-main-s4-img4.png" class="clickable-image"
					alt="섹션4 리스트img4" /> <img src="main/imgFolder/yj-main-s4-img5.png"
					class="clickable-image" alt="섹션4 리스트img5" /> <img
					src="main/imgFolder/yj-main-s4-img6.png" class="clickable-image"
					alt="섹션4 리스트img6" />
			</div>

			<div class="yj-main-s4-container" id="item7to1">
				<img src="main/imgFolder/yj-main-s4-img4.png"
					class="clickable-image" alt="섹션4 리스트img4" /> <img
					src="main/imgFolder/yj-main-s4-img3.png" class="clickable-image"
					alt="섹션4 리스트img3" /> <img src="main/imgFolder/yj-main-s4-img2.png"
					class="clickable-image" alt="섹션4 리스트img2" /> <img
					src="main/imgFolder/yj-main-s4-img1.png" class="clickable-image"
					alt="섹션4 리스트img1" /> <img
					src="main/imgFolder/yj-main-s4-img10.png" class="clickable-image"
					alt="섹션4 리스트img10" />
			</div>
		</div>
	</div>

	<!-- Section 5 -->
	<div class="yj-main-section" id="yj-main-s5">
		<div class="yj-main-s5-logo">
			<img src="main/imgFolder/yj-main-default-logo.png" alt="섹션5 logo" />
		</div>

		<div class="yj-main-s5-menu" id="yj-main-s5-menuBtn">
			<img src="main/imgFolder/yj-main-default-menu1.png" alt="섹션5 menu1" />
		</div>
		<div class="yj-main-s5-cursor yj-main-s5-cursor-none">
			<img alt="" src="main/imgFolder/yj-main-default-scroll.png" />
		</div>

		<div class="yj-main-s5-bigCon">
			<div class="yj-main-s5-container">
				<img class="yj-main-s5-invitation"
					src="main/imgFolder/초대장 완성본.png" alt="" />
			</div>
		</div>
	</div>

	<!-- Section 6 -->
	<div class="yj-main-section" id="yj-main-s6">
		<div class="yj-main-s6-cursor yj-main-s6-cursor-none">
			<img alt="" src="main/imgFolder/yj-main-default-scroll.png" />
		</div>
		<div class="yj-main-s6-logo">
			<img src="main/imgFolder/yj-main-default-logo.png" alt="섹션6 logo" />
		</div>

		<div class="yj-main-s6-menu" id="yj-main-s6-menuBtn">
			<img src="main/imgFolder/yj-main-default-menu1.png" alt="섹션6 menu1" />
		</div>

		<div class="yj-main-s6-cover">
			<img src="main/imgFolder/yj-main-s6-cover.png" alt="섹션6 커버" />
		</div>

		<div class="yj-main-s6-flexContainer">
			<div class="yj-main-s6-container" id="item10to4">
				<img src="main/imgFolder/yj-main-s6-img10.png" alt="섹션6 리스트img10" />
				<img src="main/imgFolder/yj-main-s6-img1.png" alt="섹션6 리스트img1" />
				<img src="main/imgFolder/yj-main-s6-img2.png" alt="섹션6 리스트img2" />
				<img src="main/imgFolder/yj-main-s6-img3.png" alt="섹션6 리스트img3" />
				<img src="main/imgFolder/yj-main-s6-img4.png" alt="섹션6 리스트img4" />
			</div>

			<div class="yj-main-s6-container" id="item8to1">
				<img src="main/imgFolder/yj-main-s6-img8.png" alt="섹션6 리스트img8" />
				<img src="main/imgFolder/yj-main-s6-img9.png" alt="섹션6 리스트img9" />
				<img src="main/imgFolder/yj-main-s6-img10.png" alt="섹션6 리스트img10" />
				<img src="main/imgFolder/yj-main-s6-img1.png" alt="섹션6 리스트img1" />
			</div>

			<div class="yj-main-s6-container" id="item5to9">
				<img src="main/imgFolder/yj-main-s6-img5.png" alt="섹션6 리스트img5" />
				<img src="main/imgFolder/yj-main-s6-img6.png" alt="섹션6 리스트img6" />
				<img src="main/imgFolder/yj-main-s6-img7.png" alt="섹션6 리스트img7" />
				<img src="main/imgFolder/yj-main-s6-img8.png" alt="섹션6 리스트img8" />
				<img src="main/imgFolder/yj-main-s6-img9.png" alt="섹션6 리스트img9" />
			</div>

			<div class="yj-main-s6-container" id="item3to6">
				<img src="main/imgFolder/yj-main-s6-img3.png" alt="섹션6 리스트img3" />
				<img src="main/imgFolder/yj-main-s6-img4.png" alt="섹션6 리스트img4" />
				<img src="main/imgFolder/yj-main-s6-img5.png" alt="섹션6 리스트img5" />
				<img src="main/imgFolder/yj-main-s6-img6.png" alt="섹션6 리스트img6" />
			</div>

			<div class="yj-main-s6-container" id="item7to1">
				<img src="main/imgFolder/yj-main-s6-img4.png" alt="섹션6 리스트img4" />
				<img src="main/imgFolder/yj-main-s6-img3.png" alt="섹션6 리스트img3" />
				<img src="main/imgFolder/yj-main-s6-img2.png" alt="섹션6 리스트img2" />
				<img src="main/imgFolder/yj-main-s6-img1.png" alt="섹션6 리스트img1" />
				<img src="main/imgFolder/yj-main-s6-img10.png" alt="섹션6 리스트img10" />
			</div>
		</div>
	</div>

	<!-- Section 7 -->
	<div class="yj-main-section" id="yj-main-s7">
		<div class="yj-main-footer"></div>
		<div class="yj-main-s7-cover">
			<img src="main/imgFolder/yj-main-s7-cover.png" alt="섹션7 커버" />
		</div>
	</div>
</body>
</html>
