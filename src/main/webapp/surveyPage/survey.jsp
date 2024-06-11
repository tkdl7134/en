<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="survey.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200;400;700;900&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script
      type="text/javascript"
      src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
  </head>
  <body>
    <div class="survey-container">
      <header class="tk_survey_header">
        <div class="top-left">
          <img
            src="imgFolder/logo.png"
            alt="logo"
            style="width: 100%; height: 100%"
          />
        </div>

        <div class="middle-title">
          <div>出席の方</div>
          <div class="middle-img">
            <img
              src="imgFolder/footer.png"
              alt="title"
              style="width: 100%; height: 100%"
            />
          </div>
        </div>

        <div class="top-right">
          <img
            src="imgFolder/menu-btn.png"
            alt="menu-button"
            style="width: 100%; height: 100%"
          />
        </div>
      </header>

      <main class="tk_survey_main">
        <div class="main-content">
          <div class="main-content-words">
            <div>
              お手数ではございますが、ご出欠情報のご登録をお願い申し上げます。
            </div>
            <div style="margin-top: 0.5rem">
              2024.06.09までにご返信をお願いいたします。
            </div>
            <div>
              <img
                src="imgFolder/pointline.png"
                alt="menu-button"
                style="width: 100%; height: 100%"
              />
            </div>
            <div>
              <img
                src="imgFolder/arrowline.png"
                alt="menu-button"
                style="width: 100%; height: 100%"
              />
            </div>
          </div>
          <form action="SurveyC" method="post">

            <div class="tg-include-btu-page">

            <div class="slider-navigation">
              <button type="button" class="prev-slide">前へ</button>
            </div>

            <div class="survey-input">

              <div>
                <div class="tg-slide-page">
                  <div class="">
                    <div>ゲストカテゴリー</div>
                    <label>
                      <input name="interest" type="checkbox" value="groom" />
                      新郎側ゲスト
                    </label>
                    <label>
                      <input name="interest" type="checkbox" value="bride" />
                      新婦側ゲスト
                    </label>
                  </div>
                  <div class="relationship-container">
                    <div>作成者との関係</div>
                    <label>
                      <input name="interest" type="checkbox" value="groom" />
                      家族
                    </label>
                    <label>
                      <input name="interest" type="checkbox" value="bride" />
                      親友
                    </label>
                    <label>
                      <input name="interest" type="checkbox" value="bride" />
                      職場の同僚
                    </label>
                    <label>
                      <input name="interest" type="checkbox" value="bride" />
                      その他
                    </label>
                  </div>
                  <div class="together-container">
                    <div>同伴人数 </div>
                    <div class="together-people">大人</div> 
                    <input
                      type="button"
                      onclick='count("plus","adult")'
                      value="+"
                    />
                    <input
                      style="width: 2rem"
                      class="result"
                      value="0"
                      id="adult"
                    />
                    <input
                      type="button"
                      onclick='count("minus","adult")'
                      value="-"
                    /> 
                    <div class="together-people">子供</div> 
                    <input
                      type="button"
                      onclick='count("plus","child")'
                      value="+"
                    />
                    <input
                      style="width: 2rem"
                      class="result"
                      value="0"
                      id="child"
                    />
                    <input
                      type="button"
                      onclick='count("minus","child")'
                      value="-"
                    />
                     <div class="together-people">幼児</div> 
                     <input
                      type="button"
                      onclick='count("plus","baby")'
                      value="+"
                    />
                    <input
                      style="width: 2rem"
                      class="result baby"
                      value="0"
                      id="baby"
                    />
                    <input
                      type="button"
                      onclick='count("minus","baby")'
                      value="-"
                    />
                  </div>
                  <div class="name-container">
                    <fieldset>
                  <legend>
                      <div>
                          <img                 
                        src="imgFolder/flowersymbol.jpg"
                      alt="flowersymbol"
                    style="width: 100%; height: 100%"
                  />
                  </div>
                  &nbsp&nbsp&nbsp
                <div style="font-size: 1.5rem;"> お名前</div>
              </legend>
                      <label class="kanzi-container">
                        <div style="font-size: 1.2rem;">漢字</div>
                        <input
                          type="text"
                          placeholder="姓"
                          class="name-input"
                          required />
                        <input type="text" placeholder="名" class="name-input"
                        required
                      /></label></br>
                      <label class="kata-container">
                        <div style="font-size: 1.2rem;">カタカナ</div>
                        <input
                          type="text"
                          placeholder="せい"
                          class="name-input" 
                          required/>
                        <input
                          type="text"
                          placeholder="めい"
                          class="name-input"
                          required
                      /></label></br>
                      <label class="eng-container">
                        <div style="font-size: 1.2rem;">ローマ字</div>
                        <input
                          type="text"
                          placeholder="Last Name"
                          class="name-input" 
                          required/>
                        <input
                          type="text"
                          placeholder="First Name"
                          class="name-input"
                          required
                      /></label>
                    </fieldset>
                  </div>
                  <div class="contact-container">
                     <div>メールアドレス<input type="email" class="contact-input" name="email" required/></div>
                     <div>電話番号 <input type="number" class="contact-input" name="phonenum" required/></div>
                </div>
                </div>
              </div>

              <div class="tg-slide-second-page">

                <div class="address-container">
                    <fieldset>
                      <legend>
                        <div><img                 
                        src="imgFolder/homeicon.png"
                      alt="flowersymbol"
                    style="width: 100%; height: 100%"
                  /></div>
                  &nbsp&nbsp&nbsp
                  <div style="font-size: 1.5rem;">住所入力フォーム</div></legend>
                      <div class="address-contents-contaoner">
                        <div>    
                        <div>      
                        <span for="postal-code">郵便番号</span>
                      </div>
                      <div>  
                      <input
                    type="text"
                  id="postal-code"
                name="postal-code"
              placeholder="123-4567"
            required
          />
          </div>
          </div>   
                    <div class="address-contents-contaoner">
                      <div><span for="prefecture">都道府県</span></div>
                    <div><select id="prefecture" name="prefecture" required>
                        <option value="">選択してください</option>
                        <option value="hokkaido">北海道</option>
                        <option value="aomori">青森県</option>
                        <option value="iwate">岩手県</option>
                        <option value="miyagi">宮城県</option>
                        <option value="akita">秋田県</option>
                        <option value="yamagata">山形県</option>
                        <option value="fukushima">福島県</option>
                        <option value="ibaraki">茨城県</option>
                        <option value="tochigi">栃木県</option>
                        <option value="gunma">群馬県</option>
                        <option value="saitama">埼玉県</option>
                        <option value="chiba">千葉県</option>
                        <option value="tokyo">東京都</option>
                        <option value="kanagawa">神奈川県</option>
                        <option value="niigata">新潟県</option>
                        <option value="toyama">富山県</option>
                        <option value="ishikawa">石川県</option>
                        <option value="fukui">福井県</option>
                        <option value="yamanashi">山梨県</option>
                        <option value="nagano">長野県</option>
                        <option value="gifu">岐阜県</option>
                        <option value="shizuoka">静岡県</option>
                        <option value="aichi">愛知県</option>
                        <option value="mie">三重県</option>
                        <option value="shiga">滋賀県</option>
                        <option value="kyoto">京都府</option>
                        <option value="osaka">大阪府</option>
                        <option value="hyogo">兵庫県</option>
                        <option value="nara">奈良県</option>
                        <option value="wakayama">和歌山県</option>
                        <option value="tottori">鳥取県</option>
                        <option value="shimane">島根県</option>
                        <option value="okayama">岡山県</option>
                        <option value="hiroshima">広島県</option>
                        <option value="yamaguchi">山口県</option>
                        <option value="tokushima">徳島県</option>
                        <option value="kagawa">香川県</option>
          <option value="ehime">愛媛県</option>
        <option value="kochi">高知県</option>
      <option value="fukuoka">福岡県</option>
    <option value="saga">佐賀県</option>
  <option value="nagasaki">長崎県</option>
<option value="kumamoto">熊本県</option>
<option value="oita">大分県</option>
<option value="miyazaki">宮崎県</option>
<option value="kagoshima">鹿児島県</option>
<option value="okinawa">沖縄県</option>
</select>
</div>
</div>
                    <div class="address-contents-contaoner">                   
                      <div><span for="city">市区町村</span></div>
                      <div><input
                        type="text"
                        id="city"
                      name="city"
                        placeholder="新宿区"
                        required
                      />
                      </div>
                      </div>
                      
                      <div class="address-contents-contaoner">
                      <div><span for="address-line1">町域・番地</span>
                      </div>
                      <div>
                      <input
                        type="text"
                        id="address-line1"
                        name="address-line1"
                      placeholder="西新宿2-8-1"
                      required
                    />
                    </div>
                    </div>
                    
                    <div class="address-contents-contaoner">
                      <div>
                      <span for="address-line2">建物名・部屋番号</span>
                    </div>
                     <div><input
                        type="text"
                        id="address-line2"
                        name="address-line2"
                        placeholder="新宿ビル 101"
                        required
                      />
                    </div>
                      </div>                                                
                    </fieldset>
                </div>
              </div>
            </div>

            <div class="slider-navigation">
              <button type="button" class="next-slide">次へ</button>
            </div>

          </div>

          </form>
        </div>
      </main>

      <footer class="tk_survey_footer">
      </footer>
    </div>
  </body>

  <script>
      $(function () {
        $(".survey-input").slick({
          infinite: false,
          speed: 300,
          slideToShow: 1,
          adaptiveHeight: true,
          arrows: false, // Slick 기본 화살표를 비활성화합니다.
          draggable: false // 드래그로 슬라이드를 넘기지 못하게 합니다.
        });
        $(".prev-slide").hide(); // 첫 슬라이드에서는 '이전' 버튼을 숨깁니다.

        // '다음' 버튼 클릭 시 슬라이드 이동
        $(".next-slide").on("click", function () {
          $(".survey-input").slick("slickNext");
        });

        // '이전' 버튼 클릭 시 슬라이드 이동
        $(".prev-slide").on("click", function () {
          $(".survey-input").slick("slickPrev");
        });

        // 슬라이드 변경 시 호출되는 이벤트
        $(".survey-input").on("afterChange", function (event, slick, currentSlide) {
          var slideCount = slick.slideCount;

          if (currentSlide === 0) {
            $(".prev-slide").hide();
          } else {
            $(".prev-slide").show();
          }

          if (currentSlide === slideCount - 1) {
            $(".next-slide").hide();
          } else {
            $(".next-slide").show();
          }
        });
      });
  </script>

  <script>
    function count(type, input) {
      const resultElement = document.getElementById(input);

      let number = parseInt(resultElement.value);

      if (type === "plus") {
        number += 1;
      } else if (type === "minus") {
        if (number > 0) {
          number -= 1;
      }
    }
      // 결과 출력
      resultElement.value = number;
    }
  </script>
</html>