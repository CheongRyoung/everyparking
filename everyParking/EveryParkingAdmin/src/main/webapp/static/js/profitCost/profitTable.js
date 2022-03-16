
let profit = {
		gridOption:{},
		grid : null,

		initPage: function(){
			let $this = this;
			this.gridOption = {
					cols : [
						{title:"번호", name:"RNUM", colWidth:"7", order:true}
						, {title:"주차장명", name:"PARKNAME", colWidth:"30"}
						, {title:"구분", name:"CATE", colWidth:"10"}
						, {title:"금액", name:"PRICE", type:"number", colWidth:"15"}
						, {title:"발생일", name:"REGDATE", type:"date", colWidth:"20", order:true}
						, 
						{title : "삭제", name: "TSEQ", colWidth:"7", filter:function(data, rowData, ridx, cidx, $this) {
							return `<a class="btn btn-outline-danger btn-sm" onclick="cmm.confirm('삭제', '삭제하시겠습니까', 'profit', ${rowData.TSEQ}, '${rowData.CATE}')">삭제</a>`
						}}
						],
						pagingEl : '#pagingBlock2',
						getParam : getParam
			};
			this.grid = new Grid("#profitTable", $this.gridOption, "/profitCost/selectListProfitCost");
		}
}

$(function(){
	profit.initPage();
	// alert, comfirm .. > cmm.alert()
	// cmm.confirm


	// cmm

	// cmm.attachComma() >> 숫자 포맷 (콤마)
	// cmm.formToJson()
	// cmm.jsonToForm()
	ajaxCall(

	)
})

function getParam() {
	return {}}

let getDateRangeN = document.getElementById('datepickerN');

function searchDate(){

	let getSelectedRange = getDateRangeN.value;

	console.log(getSelectedRange);

	searchGrid('#profitTable', '', getSelectedRange);

}






