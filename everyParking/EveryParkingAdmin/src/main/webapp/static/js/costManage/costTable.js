
let cost = {
		gridOption:{},
		grid : null,

		initPage: function(){
			let $this = this;
			this.gridOption = {
					cols : [
						{title:"번호", name:"NUM", colWidth:"6", order:true}
						, {title:"주차장명", name:"LOTNAME", colWidth:"10"}
						, {title:"비용사유", name:"CAUSE", colWidth:"10"}
						, {title:"금액", name:"COST", type:"number", colWidth:"15"}
						, {title:"발생일", name:"DATE", type:"date", colWidth:"25", order:true}
						,
						{title : "삭제", name: "DEL", colWidth:"7", filter:function(data, rowData, ridx, cidx, $this) {
							return `<a class="btn btn-outline-danger btn-sm" onclick="cmm.confirm('삭제', '삭제하시겠습니까', 'profit', ${rowData.TSEQ}, '${rowData.CATE}')">삭제</a>`
						}}
						],
						pagingEl : '#pagingBlock2',
						getParam : getParam
			};
			this.grid = new Grid("#costTable", $this.gridOption, "/costManage/selectListCostM");
		}
}

$(function(){
	cost.initPage();
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

	searchGrid('#costTable', '', getSelectedRange);

}






