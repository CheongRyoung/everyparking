
let cost = {
		gridOption:{},
		grid : null,

		initPage: function(){
			let $this = this;
			this.gridOption = {
					cols : [
						{title:"번호", name:"COST_SEQ", colWidth:"6", order:true}
						, {title:"주차장명", name:"PARK_NAME", colWidth:"10"}
						, {title:"비용사유", name:"COST_CONT"}
						, {title:"금액", name:"COST_PRICE", type:"number", colWidth:"15"}
						, {title:"발생일", name:"REG_DATE", type:"date", colWidth:"10"}
						, {title : "수정", name: "modify", filter:function(data, rowData, ridx, cidx, $this){
		                    return `<a href="/profitCost/costUpdateForm?COST_SEQ=${rowData.COST_SEQ}" class="btn btn-outline-primary btn-sm">수정</a>`
		                }, colWidth:"10"}
						,
						{title : "삭제", name: "DEL", colWidth:"7", filter:function(data, rowData, ridx, cidx, $this) {
							return `<a class="btn btn-outline-danger btn-sm" onclick="cost.deleteRow(${ridx})">삭제</a>`
						}}
						],
						pagingEl : '#pagingBlock2',
						getParam : getParam
			};
			this.grid = new Grid("#costTable", $this.gridOption, "/costManage/selectListCost");
		},
		deleteRow: function(ridx) {
			   let $this = this;
			   let rowData = this.grid.getRowData(ridx);
			   cmm.confirm('삭제', '삭제하시겠습니까', null, function(){
			      
			      param = {'COST_SEQ': rowData.COST_SEQ};
			      
			      ajaxCall('/costManage/deleteCost', param, function(data) {
			         cmm.alert(data.message, function(){
			            if(data.code == 'S'){
			               grids[0].reSearch();
			            }
			         })
			      });
			   })
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








