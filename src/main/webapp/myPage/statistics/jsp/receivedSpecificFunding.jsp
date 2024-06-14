<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myPage/statistics/css/receivedSpecificFund.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>

<!-- JavaScript 코드 시작 -->
<script>
$(document).ready(function() {
    let priceChart = null;
    $('#priceChart').css('height', '0');
    
    let wlno = $('#fundSpecProduct-wlno').text();
    
    
    $('[id^=MemberInfoPrice]').each(function() {
        let number = $(this).text();
        console.log(number);  // 예: "1234567"

        // 문자열을 정수로 변환
        number = parseInt(number, 10);

        // 쉼표를 추가하여 포맷팅
        let formattedNumber = number.toLocaleString();
        console.log(formattedNumber);  // 출력: "1,234,567"

        // 값을 업데이트
        $(this).text(formattedNumber + '円');
    });
    
    
    
    // byMoney 버튼 클릭 시

$('#byMoney').on('click', function() {
    $(this).addClass('active'); // 클릭된 버튼에 active 클래스 추가
    $('#byDate').removeClass('active'); // 다른 버튼에서 active 클래스 제거

    $.ajax({
        url: 'receivedSpecificFundingC?order=M&wlno=' + wlno,
        success: function(response) {
            console.log('request accessed', '${fund}');
                // 기존의 fund 요소들을 제거
                $('.recSpecMemberInfo').remove();
                try {
                    let newFund = JSON.parse('${fund}'); // 서버에서 JSON 문자열을 받아 JavaScript 객체로 변환

                    // 새로운 데이터로 반복문을 통해 UI 업데이트
                    newFund.forEach(function(f, index) {
                        let formattedPrice = parseInt(f.p_price, 10).toLocaleString() + '円';
                        let newItem = `
                            <div class="recSpecMemberInfo" id="recSpecPriceAndDate">
                                <div style="border-right: 1px solid;" class="recSpecMemberInfos">${f.m_name}</div>
                                <div id="MemberInfoPrice${index}" style="border-right: 1px solid;" class="recSpecMemberInfos">${formattedPrice}</div>
                                <div class="recSpecMemberInfos">${f.p_date}</div>
                            </div>`;
                        $('#fundSpec-dataBoard').append(newItem);
                    });
                } catch (error) {
                    console.error('Error parsing JSON:', error);
                }
             
        },
        error: function(xhr, status, error) {
            console.error('request denied', status, error);
        }
    });
});


    // byDate 버튼 클릭 시
   $('#byDate').on('click', function() {
    $(this).addClass('active'); // 클릭된 버튼에 active 클래스 추가
    $('#byMoney').removeClass('active'); // 다른 버튼에서 active 클래스 제거

    $.ajax({
        url: 'receivedSpecificFundingC?order=D&wlno=' + wlno,
        success: function(response) {
            console.log('request accessed', '${fund}');


                // 기존의 fund 요소들을 제거
                $('.recSpecMemberInfo').remove();
                try {
                    let newFund = JSON.parse('${fund}'); // 서버에서 JSON 문자열을 받아 JavaScript 객체로 변환

                    // 새로운 데이터로 반복문을 통해 UI 업데이트
                    newFund.forEach(function(f, index) {
                        let formattedPrice = parseInt(f.p_price, 10).toLocaleString() + '円';
                        let newItem = `
                            <div class="recSpecMemberInfo" id="recSpecPriceAndDate">
                                <div style="border-right: 1px solid;" class="recSpecMemberInfos">${f.m_name}</div>
                                <div id="MemberInfoPrice${index}" style="border-right: 1px solid;" class="recSpecMemberInfos">${formattedPrice}</div>
                                <div class="recSpecMemberInfos">${f.p_date}</div>
                            </div>`;
                        $('#fundSpec-dataBoard').append(newItem);
                    });
                } catch (error) {
                    console.error('Error parsing JSON:', error);
                }
        },
        error: function(xhr, status, error) {
            console.error('request denied', status, error);
        }
    });
});


    // 페이지 로딩 시 초기 상태 설정 (byMoney를 기본으로 active 상태로 만듦)
    $('#byMoney').addClass('active');
    
    
    
    $('#dateForm').submit(function(event) {
    	 event.preventDefault();
    	
    	if (priceChart) {
              priceChart.destroy();
          }
          
          $.ajax({
              type: 'POST',
              url: 'receivedSpecificFundingC',
              data: $(this).serialize() ,
              dataType: 'json',
              success: function(response) {
                  let labels = [];
                  let data = [];
                  
                  response.forEach(item => {
                      labels.push(item.date);
                      data.push(item.total_price);
                  });

                  let ctx = document.getElementById('priceChart').getContext('2d');
                  priceChart = new Chart(ctx, {
                      type: 'bar',
                      data: {
                          labels: labels,
                          datasets: [{
                              label: 'Total Price',
                              data: data,
                              borderColor: 'rgba(75, 192, 192, 1)',
                              backgroundColor: 'rgba(75, 192, 192, 0.2)',
                              fill: true
                          }]
                      },
                      options: {
                          responsive: false,
                          barPercentage: '0.3',
                          scales: {
                              x: {
                                  type: 'category',
                                  title: {
                                      display: true,
                                      text: 'Date'
                                  },
                                  ticks: {
                                      autoSkip: false
                                  }
                              },
                              y: {
                                  beginAtZero: true,
                                  title: {
                                      display: true,
                                      text: 'Total Price'
                                  }
                              }
                          }
                      }
                  });
                  $('#priceChart').css('height', '400px');
              },
              error: function(error) {
                  console.log(error);
              }
          });
      });

   
});
</script>
<script type="text/javascript">
function GoToTop() {
    var location = document.querySelector(".recFundSpec-container").offsetTop;
    window.scrollTo({top:location, behavior:'smooth'});
}
</script>
<!-- JavaScript 코드 끝 -->

</head>
<body>

<div class="recFundSpec-container">
    <div id="fundSpecProduct-img"><img id="fundSpecPro-img" alt="" src="myPage/statistics/imgFolder/${product }.png"></div>
    <div id="fundSpecProduct-name">${product }</div>
    <div id="fundSpecProduct-wlno">${wlno }</div>
    <div id="fundSpecProduct-rank">現在第${rank }位！ </div>
    <div id="fundSpec-leftPrice">✿目標金額まで後${leftPrice }％です✿</div>
    <div id="fundSpec-chartAlert">統計を確認したい場合は、日付を入力してください</div>

    <div id="fundSpec-inputDate">
        <form id="dateForm" >
            <input id="startDate" name="startDate" value="${lastWeekDate }" type="date">
            <span style="font-size: 1.6rem; margin-left: 1rem; margin-right: 1rem;">~</span>
            <input id="endDate"  name="endDate"  value="${todayDate }" type="date">
            <input id="submit" type="submit" value="確認する">
            <input type="hidden" name="product" value="${product }">
        </form>
    </div>
    <canvas id="priceChart" width="400" height="400"></canvas>

    <div id="fundSpec-dataBoard-container">
        <div id="fundSpec-arrBtn">
            <button class="arrButtons" id="byMoney">金額順</button>
            <button class="arrButtons" id="byDate" >日付順</button>
        </div>
        <div id="fundSpec-dataBoard">
            <div id="fundSpec-dataBoard-navi">
                <div style="border-right: 1px solid;" class="recSpecMemberInfos">恩人</div>
                <div style="border-right: 1px solid;" class="recSpecMemberInfos">金額</div>
                <div class="recSpecMemberInfos">日付</div>
            </div>
            <c:forEach items="${fund }" var="f" varStatus="vs" begin="0">
                <div class="recSpecMemberInfo" id="recSpecPriceAndDate">
                    <div style="border-right: 1px solid;" class="recSpecMemberInfos">${f.m_name }</div>
                    <div id="MemberInfoPrice${vs.index}" style="border-right: 1px solid;" class="recSpecMemberInfos"> ${f.p_price }</div>
                    <div class="recSpecMemberInfos">${f.p_date }</div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="recSpecReturn-img"><img onclick="GoToTop()" style="width : 20rem;" alt="" src="myPage/statistics/imgFolder/top_button.png"></div>
</div>

</body>
</html>
