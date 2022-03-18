
let barChart = function() {
	this.SEARCHCOND ='',
	this.SEARCHKEY = '',
	this.params = getParam,
	this.search = function() {
		let $this = this;
		let params = $this.params();
		if(this.SEARCHCOND != '') {
			params.SEARCHCOND = this.SEARCHCOND;
		}
		if(this.SEARCHKEY != '') {
			params.SEARCHKEY = this.SEARCHKEY;
		}
		// var xhr = new XMLHttpRequest();
		// xhr.onreadystatechange = function() {
		// 	if(xhr.readyState == 4 && xhr.status==200) {
		// 		var data = JSON.parse(xhr.responseText);
		// 		var list = data.list;
		// 		drawChart(list);
		// 	}
		// }
		// xhr.open("post","/profitCost/selectProfitChartDataByMonth", true);
		// xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		// xhr.send(params);

		ajaxCall("/profitCost/selectProfitChartDataByMonth", params, function (data) {
			var list = data.list;
			drawChart(list)
		})
	}
}

function drawChart(list){
	let profitChart = document.getElementById('profitChart').getContext('2d');
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
	   		 	label : '순수익',
	   		 	data : profitValue 
	    	}]
	    }
	})
}

function getParam() {
	return {}}

function searchChart(condition, key, ){
	let $this = barChart;
	if(key != undefined) {
		$this.SEARCHCOND = key;
	}
	if(condition != ''){
		$this.SEARCHCOND = condition;
	}
	$this.search();
}