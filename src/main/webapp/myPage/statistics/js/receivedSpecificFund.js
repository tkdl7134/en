$(document).ready(function() {
    let priceChart = null;
    $('#priceChart').css('height', '0');
    
    let wlno = $('#fundSpecWlno').val();
    let eno = $('#fundSpecEno').val();
    console.log(eno);
    console.log(wlno);
    
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
    	type: 'get',
        url: 'receivedajaxC?order=M&wlno=' + wlno+'&eno='+eno,
        dataType: 'json',
        success: function(response) {
        	console.log("hereVVVVVVVV")
            console.log(response);
                // 기존의 fund 요소들을 제거
                $('.recSpecMemberInfo').remove();
                try {
                    let newFund = response; // 서버에서 JSON 문자열을 받아 JavaScript 객체로 변환

                    // 새로운 데이터로 반복문을 통해 UI 업데이트
                    newFund.forEach(function(f, index) {
                        let formattedPrice = parseInt(f.p_price, 10).toLocaleString() + '円';
                      
                         let originalDate = f.p_date; // 예: "06월 15, 2023"
                    let [month, day, year] = originalDate.split(/[\s월,]+/);
                    month = month.padStart(2, '0');
                    day = day.padStart(2, '0');
                    let formattedDate = `${year}-${month}-${day}`;
                        
                        
                        let newItem = `
                            <div class="recSpecMemberInfo" id="recSpecPriceAndDate">
                                <div style="border-right: 1px solid;" class="recSpecMemberInfos">${f.m_name}</div>
                                <div id="MemberInfoPrice${index}" style="border-right: 1px solid;" class="recSpecMemberInfos">${formattedPrice}</div>
                                <div class="recSpecMemberInfos">${formattedDate}</div>
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
    	type: 'get',
        url: 'receivedajaxC?order=D&wlno=' + wlno+'&eno='+eno ,
        dataType: 'json',
        success: function(response) {
        	console.log("hereVVVVVVVV")
                // 기존의 fund 요소들을 제거
                $('.recSpecMemberInfo').remove();
                try {
                    let newFund = response; // 서버에서 JSON 문자열을 받아 JavaScript 객체로 변환
					console.log(newFund);	
				
					
					
					
                    // 새로운 데이터로 반복문을 통해 UI 업데이트
                    newFund.forEach(function(f, index) {
                        let formattedPrice = parseInt(f.p_price, 10).toLocaleString() + '円';
                      
                      		 let originalDate = f.p_date; // 예: "06월 15, 2023"
                    let [month, day, year] = originalDate.split(/[\s월,]+/);
                    month = month.padStart(2, '0');
                    day = day.padStart(2, '0');
                    let formattedDate = `${year}-${month}-${day}`;
                      
                      
                        let newItem = `
                            <div class="recSpecMemberInfo" id="recSpecPriceAndDate">
                                <div style="border-right: 1px solid;" class="recSpecMemberInfos">${f.m_name}</div>
                                <div id="MemberInfoPrice${index}" style="border-right: 1px solid;" class="recSpecMemberInfos">${formattedPrice}</div>
                                <div class="recSpecMemberInfos">${formattedDate}</div>
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
                    
                    
                    let dateOnly = item.date.split(' ')[0];
                    let dateParts = dateOnly.split('-');  // 연, 월, 일을 분리
let monthAndDay = dateParts.slice(1).join('-');  // 월과 일만 결합
                labels.push(monthAndDay);
 //                     labels.push(item.date);
 						let totalPrice = item.total_price;
 						let banPrice = totalPrice/ 10000;
 						
 						
                      data.push(banPrice);
                  });
				console.log(labels);
 						console.log(data);
				
                  let ctx = document.getElementById('priceChart').getContext('2d');
                  priceChart = new Chart(ctx, {
                      type: 'bar',
                      data: {
                          labels: labels,
                          datasets: [{
                              label: '当日貰った金額',
                              data: data,
                              borderColor: 'rgba(75, 192, 192, 1)',
                              backgroundColor: 'rgba(75, 192, 192, 0.2)',
                              fill: false
                          }]
                      },
                      options: {
                          responsive: false,
                          barPercentage: '0.3',
                          maintainAspectRatio : false,
                          scales: {
                              x: {
                                  type: 'category',
                                  title: {
                                      display: true,
                                      text: '日付'
                                  },
                                  ticks: {
                                      autoSkip: false
                                  }
                              },
                              y: {
                                  beginAtZero: true,
                                  title: {
                                      display: true,
                                      text: '貰った金額'
                                  },
                                    ticks: {
                                callback: function(value, index, values) {
                                    return value + '万円';  // y축 값에 '万円' 추가
                                }
                            }
                              }
                          }
                      }
                  });
                  $('#priceChart').css('height', '35rem');
              },
              error: function(error) {
                  console.log(error);
              }
          });
      });

   
});
function GoToTop() {
    var location = document.querySelector("#canvas-content-container").offsetTop;
    window.scrollTo({top:location, behavior:'smooth'});
}
