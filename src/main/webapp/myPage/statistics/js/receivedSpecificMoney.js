$(document).ready(function() {
    
    let eno = $('#SpecMoneyEno').val();
    console.log(eno);
    
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
    $('#byName').removeClass('active'); // 다른 버튼에서 active 클래스 제거
	
    $.ajax({
    	type: 'POST',
        url: 'receivedSpecificMoneyAjaxC?order=M&eno='+eno,
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
    $('#byName').removeClass('active'); // 다른 버튼에서 active 클래스 제거

    $.ajax({
    	type: 'POST',
        url: 'receivedSpecificMoneyAjaxC?order=D&eno='+eno ,
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
    // byName 버튼 클릭 시
   $('#byName').on('click', function() {
    $(this).addClass('active'); // 클릭된 버튼에 active 클래스 추가
    $('#byMoney').removeClass('active'); // 다른 버튼에서 active 클래스 제거
    $('#byDate').removeClass('active'); // 다른 버튼에서 active 클래스 제거
    $.ajax({
    	type: 'POST',
        url: 'receivedSpecificMoneyAjaxC?order=N&eno='+eno,
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
    $('#byName').addClass('active');
    
    
    
});
function GoToTop() {
    var location = document.querySelector("#canvas-content-container").offsetTop;
    window.scrollTo({top:location, behavior:'smooth'});
}
