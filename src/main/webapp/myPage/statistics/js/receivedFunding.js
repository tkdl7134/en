function generateGraph() {
    const prices = document.getElementById('prices'); // attribute prices를 가져옴

    const dateLabels = prices.map(price => price.w_date);
    const dateValues = prices.map((price, index) => index + 1);

    const ctx = document.getElementById('dateChart').getContext('2d');

    // Check if a chart instance already exists and destroy it to avoid overlap
    if (window.myChart) {
        window.myChart.destroy();
    }

    window.myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dateLabels,
            datasets: [{
                label: 'Dates',
                data: dateValues,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    beginAtZero: true
                },
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}
  function showInfo() {
        document.getElementById('recFund-info').style.visibility = 'visible';
        
    }
	function hideInfo(){
		
        document.getElementById('recFund-info').style.visibility = 'hidden';
		
		
	}
  
   
    