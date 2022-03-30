var sessionInfo = null;

function uploadData() {
	
	let editorData = editor.getData();
	$('input[name=editorData]').val(editorData);
	
	var typeData = document.getElementById("type");
	var type = typeData.options[typeData.selectedIndex].value;
	
	let qnaTitle = document.getElementsByName("QNA_TITLE")[0].value;
	
	if ( editorData==null || editorData=="" ) {
		cmm.alert("본문을 입력해 주세요");
		event.preventDefault();
		return false;
	}
	
	if ( qnaTitle==null || qnaTitle=="" ) {
		cmm.alert("제목을 입력해 주세요");
		event.preventDefault();
		return false;
	}
	
	if ( type == "" || type == "문의 유형을 선택해주세요." || type == null) {
		cmm.alert("올바른 유형을 선택해 주세요");
		event.preventDefault();
		return false;
	}
	

}

function updateData() {
	
	let editorData = editor.getData();

	var typeData = document.getElementById("type");
	var type = typeData.options[typeData.selectedIndex].value;
	
	let qnaTitle = document.getElementsByName("QNA_TITLE")[0].value;
	
	if ( editorData==null || editorData=="" ) {
		cmm.alert("본문을 입력해 주세요");
		return false;
	}
	
	if ( qnaTitle==null || qnaTitle=="" ) {
		cmm.alert("제목을 입력해 주세요");
		return false;
	}
	
	if ( type == "" || type == "문의 유형을 선택해주세요." || type == null) {
		cmm.alert("올바른 유형을 선택해 주세요");
		return false;
	}

	let param = cmm.formToJson("#qnaDetail");
	param.editorData = editorData;
	
	ajaxCall("/operation/QNA/updateQna", param, function(data){
		cmm.alert(data.message, function(){
			if (data.code == 'S') {
				location.href = "redirect:/operation/QNA/list";
			}
		})
	})

}

	function deleteQna(qnaNum){
		cmm.confirm('삭제', '삭제하시겠습니까', null, function(){
			ajaxCall("/operation/QNA/deleteQna?QNA_SEQ=" + qnaNum, null, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.href = "redirect:/operation/QNA/list";
					}
				})
			})
		}
	)		
}


let qnaManage = {
	    gridOption:{},
	    grid : null,
	    initPage: function(){
	        let $this = this;
	        this.gridOption = {
	            cols : [
	                {title : "No", name: "QNA_SEQ", type:"number", colWidth:"5", order: true},
	                {title : "제목", name: "QNA_TITLE"},
	                {title : "유형", name: "SUB_NAME",},
	                {title : "DATE", name: "REG_DATE", type:"date"},
	                {title : "답변여부", name: "QNA_ANS", filter:function(data, rowData, ridx, cidx, $this) {
	                	if (rowData.QNA_ANS == 'Y') {
		                	return `<a href = "/operation/QNA/reply?QNA_SEQ=${rowData.QNA_SEQ}" class="btn btn-danger btn-sm"><i class="bi bi-check-lg"></i></a>`
						}
	                	return `<a href = "/operation/QNA/reply?QNA_SEQ=${rowData.QNA_SEQ}" class="btn btn-outline-primary btn-sm"><i class="bi bi-question-lg"></i></a>`
	                }, colWidth:"10"},
	            ],
	            pagingEl : '#pagingBlock4',
	            getParam : getParam
	        };
	        this.grid = new Grid("#qnaManageTable", $this.gridOption,"../QNA/selectListQna");
	    },
	}

	function insertComment(){
		
		let comment = document.getElementsByName("QNAC_CONT")[0].value;
		
		if ( comment==null || comment=="" ) {
			cmm.alert("내용을 입력해 주세요");
			event.preventDefault();
			return false;
		}
	}


	function updateComment(commentNum){
		
		var param = cmm.formToJson("#commentDetail" + commentNum);
		console.log(param)
		
		ajaxCall("/operation/QNA/updateComment", param, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.reload();
					}
				})
			})
		}

	function deleteComment(commentNum){
		cmm.confirm('삭제', '삭제하시겠습니까', null, function(){
			ajaxCall("/operation/QNA/deleteComment?QNAC_SEQ=" + commentNum, null, function(data){
				cmm.alert(data.message, function(){
					if (data.code == 'S') {
						location.reload();
					}
				})
			})
		}
	)}

	
///////////////////////////////////  세션 정보 가져오기  /////////////////////////////////////////////////////////////////////	

function getSessionInfo(){
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = JSON.parse(xhr.responseText);
			
			if(data.result != 'empty'){
				sessionInfo = {
					userNo : data.userNo,
					userName : data.userName
				};
			}
			
		}
	};
	xhr.open("get" , "../QNA/getSessionInfo" , false); //마지막 인자.. false 동기식인데.. 왠만하면 피하자..
	xhr.send();
}

function getParam(){
    return {}
}

$(function(){
    qnaManage.initPage();
    // alert, comfirm .. > cmm.alert()
    // cmm.confirm


    // cmm

    // cmm.attachComma() >> 숫자 포맷 (콤마)
    // cmm.formToJson()
    // cmm.jsonToForm()
    ajaxCall(

    )
})

	
window.addEventListener("DOMContentLoaded" , function(){
	getSessionInfo();			
})