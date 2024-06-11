<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="survey.css" />
 	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
 	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
  	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  	<script type="text/javascript" src="slick/slick.min.js"></script>
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
                <div class="slider">
                  <div>your content</div>
                  <div>your content</div>
                  <div>your content</div>
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
  
  $(document).ready(function(){
      $('.slider').slick({
    	  dots: true,
    	  infinite: true,
    	  speed: 300,
    	  slidesToShow: 1,
    	  adaptiveHeight: true      
    	  });
    });


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
          if (
            otherContainer !== container &&
            otherContainer.classList.contains("active")
          ) {
            otherContainer.classList.remove("active");
          }
        });
        // 클릭된 이미지 펼치기/닫기
        container.classList.toggle("active");
      });
    });
  </script>
</html>
