<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="survey.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bxslider@4.2.17/dist/jquery.bxslider.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div>
      <div class="tk_survey_container">
        <div class="tk_durumari">
          <div class="tk_durumari_roll">
            <img src="imgFolder/ribbon.png" alt="ribbon" />
          </div>
          <div class="tk_durumari_paper">
            <div class="tk_survey">
              <header class="tk_survey_header">
                <div>
                  <div class="tk_index_container">
                    <div>
                      <img src="imgFolder/indeximg.png" alt="index" />
                      <div class="image-text">ゲスト· カテゴリー</div>
                    </div>
                    <div>
                      <img src="imgFolder/indeximg.png" alt="index" />
                      <div class="image-text">個人情報</div>
                    </div>
                    <div>
                      <img src="imgFolder/indeximg.png" alt="index" />
                      <div class="image-text">食事制限</div>
                    </div>
                    <div>
                      <img src="imgFolder/indeximg.png" alt="index" />
                      <div class="image-text">メッセージ</div>
                    </div>
                  </div>
                </div>
              </header>

              <main class="tk_survey_content">
              
              <div class="bxslider">
  				<div><img src="https://bxslider.com/assets/coffee1-7325690f507d48962d312be15d9d8929be4a5ff04d184d5ed0a96c1b27940260.jpg" /></div>
  				<div><img src="https://bxslider.com/assets/coffee2-8bb17517b21cc5b38f3ea7d14cfc4b4c82cc51b99e82bfc3a6d02688ab6c5988.jpg" /></div>
  				<div><img src="https://bxslider.com/assets/coffee3-02c76c3b922183d7c5144e6856065ad68834ddc7ab5367481a225c516a308cb8.jpg" /></div>
			 </div>
              
              </main>

              <footer class="tk_survey_footer">
                <p>진행도</p>
                <button>다음</button>
              </footer>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script type="text/javascript">
    const roll = document.querySelector(".tk_durumari_roll");
    const paper = document.querySelector(".tk_durumari_paper");
    roll.addEventListener("click", function () {
      if (paper.classList.contains("tk-paper-wide")) {
        paper.classList.remove("tk-paper-wide");
      } else {
        paper.classList.add("tk-paper-wide");
      }
    });

    const imageContainers = document.querySelectorAll(
      ".tk_index_container > div"
    );

    imageContainers.forEach((container) => {
      container.addEventListener("click", () => {
        // 다른 이미지 닫기 (선택 사항)
        imageContainers.forEach((otherContainer) => {
          if (otherContainer !== container &&otherContainer.classList.contains("active")) 
            {
            otherContainer.classList.remove("active");
          }
        });
        // 클릭된 이미지 펼치기/닫기
        container.classList.toggle("active");
      });
    });
    
    $(function() {
	$('.bxslider').bxSlider({
    	  infiniteLoop: false,
    	  hideControlOnEnd: true,
    	  slideWidth: 600
    	});
    });
		
    
  </script>
</body>
</html>

