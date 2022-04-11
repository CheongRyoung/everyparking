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
	                {title : "", name: "NOTI_SEQ", type:"number", colWidth:"5", order: true},
	                {title : "제목", name: "NOTI_TITLE", colWidth:"40", filter:function(data, rowData, ridx, cidx, $this) {
	                	return escapeHtml(rowData.NOTI_TITLE);}},
	                {title : "작성자", name: "USER_NAME"},
	                {title : "작성일", name: "REG_DATE", type:"date", colWidth:"22"},
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
	    dateJspForm();
	})
	
	function onRowClick(num, obj){
		
		location.href = "/operation/notice/content?NOTI_SEQ="+ obj.childNodes[0].innerText;
		
    }
	
	function dateJspForm(){
		try{
			var date = document.getElementById("dateJsp").value;		
		}
		catch{
			return;
		}
		var dateForm = moment(date).format('YY-MM-DD HH:mm');
		
		$("#dateJsp").empty();
		$("#dateJsp").append(dateForm);	
	}
