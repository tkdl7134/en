function generateGraph() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);

    if (startDate > endDate) {
        alert("Start date must be before end date.");
        return;
    }

    const dateArray = [];
    const currentDate = new Date(startDate);

    while (currentDate <= endDate) {
        dateArray.push(new Date(currentDate));
        currentDate.setDate(currentDate.getDate() + 1);
    }

    const dateLabels = dateArray.map(date => date.toISOString().split('T')[0]);
    const dateValues = dateArray.map((date, index) => index + 1);

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
  
   
    