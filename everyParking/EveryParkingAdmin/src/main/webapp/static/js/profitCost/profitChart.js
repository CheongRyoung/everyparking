let parkSeq = new Map();

let barChart;

ajaxCall("/profitCost/selectReserChartDataByParkSeq", parkSeq, function(data){
	var list = data.list;
	drawChart(list)
});

function searchParkSeq(this.value){
	parkSeq = {'PARK_SEQ' : this.value};
}

function drawChart(list){
	let profitChart = document.getElementById('profitChart').getContext('2d');
	var monthList = [];
	var resultLabels = [];
	var profitValue = [];

	list.forEach((item, index)=>{
		resultLabels.push(`${item.month}월`);
		profitValue.push(item.totalPrice);
	})
	
	if(barChart)
		barChart.destroy();
	barChart = new Chart(profitChart, {
		type : 'line',
	    data : {
	    	labels : resultLabels,
	    	datasets:[{
	   		 	label : '수익',
	   		 	data : profitValue 
	    	}],
			labels : resultLabels,
			datasets:[{
				 	label : '관리비용',
				 	data : profitValue 
			}],
			labels : resultLabels,
			datasets:[{
				 	label : '순수익',
				 	data : profitValue 
			}]
	    }
	})
	
	
}

function searchDate(){
	var searchDateValue = document.getElementById('datepickerN').value;
	console.log(searchDateValue);
	ajaxCall("/profitCost/selectReserChartDataByParkSeq", searchDateValue, function(data){
		var list = data.list;
		drawChart(list)
	});
}