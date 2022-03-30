/**
 * 03/14 종화 작성
 */

let noticeManagement = {
	    gridOption:{},
	    grid : null,
	    initPage: function(){
	        let $this = this;
	        this.gridOption = {
	            cols : [
	                {title : "No", name: "NOTI_SEQ", type:"number", colWidth:"5", order: true},
	                {title : "제목", name: "NOTI_TITLE"},
	                {title : "작성자", name: "USER_NAME"},
	                {title : "date", name: "REG_DATE", type:"date"},
	            ],
	            onRowClick: "onRowClick",
	            pagingEl : '#pagingBlock3',
	            getParam : getParam
	        };
	        this.grid = new Grid("#noticeManageTable", $this.gridOption,"/operation/notice/selectListNoti");
	    },
	}
	function getParam(){
	    return {}
	}

	$(function(){
	    noticeManagement.initPage();
	    // alert, comfirm .. > cmm.alert()
	    // cmm.confirm


	    // cmm

	    // cmm.attachComma() >> 숫자 포맷 (콤마)
	    // cmm.formToJson()
	    // cmm.jsonToForm()
	    ajaxCall(

	    )
	})
	function onRowClick(num, obj){
		location.href = "/operation/notice/content?NOTI_SEQ="+ obj.childNodes[0].innerText;
    }

